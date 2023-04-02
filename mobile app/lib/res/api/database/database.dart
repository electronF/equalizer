import 'package:mapiol/res/api/models/article.dart';
import 'package:mapiol/res/api/models/document.dart';
import 'package:mapiol/res/api/models/message.dart';
import 'package:mapiol/res/api/models/organization.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database ?? await initDB();

    _database = await initDB();
    return _database ?? await initDB();
  }

  String messageTableName = "messages";
  String articleTableName = "articles";
  String documentTableName = "documents";
  String organizationTableName = "organizations";

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), "equalizer.db"),
      onCreate: (db, version) async {
        await db.execute('''
            CREATE TABLE $articleTableName(
                id INTEGER PRIMARY KEY,
                source_name TEXT NOT NULL,
                title TEXT NOT NULL,
                source_link TEXT,
                source_image_link TEXT,
                content TEXT NOT NULL,
                short_description TEXT,
                article_references TEXT);
      ''');
        await db.execute('''
            CREATE TABLE $documentTableName(
                id INTEGER PRIMARY KEY NOT NULL,
                type TEXT NOT NULL,
                title TEXT NOT NULL,
                source_link TEXT NOT NULL,
                source_image_link TEXT,
                short_description TEXT NOT NULL);
      ''');
        await db.execute('''
            CREATE TABLE $messageTableName(
                id INTEGER PRIMARY KEY NOT NULL,
                datetime TEXT NOT NULL,
                sender_id TEXT NOT NULL,
                text_content TEXT,
                image_path TEXT,
                video_path TEXT,
                audio_path TEXT,
                document_path TEXT);
      ''');
        await db.execute('''
            CREATE TABLE $organizationTableName(
                id PRIMARY KEY NOT NULL,
                type TEXT NOT NULL,
                name TEXT NOT NULL,
                short_description TEXT NOT NULL,
                full_description TEXT NOT NULL,
                image TEXT NOT NULL,
                adresses TEXT, 
                contacts TEXT,
                social_media TEXT);
      ''');
      },
      version: 1,
    );
  }

  openDB() async {
    await database;
  }

  closeDB() async {
    var db = await database;
    db.close();
  }

  Future<int> _addRow(String table, Map<String, dynamic>? fieldsValues) async {
    var db = await database;
    List<String> valuesReplacer = [];
    List<String> keys = [];
    List<String> values = [];
    fieldsValues?.forEach((key, value) {
      if (value != null) {
        valuesReplacer.add("?");
        keys.add(key.toString());
        values.add("'${value.toString()}'");
      }
    });
    try {
      var res = await db.rawInsert(
          '''INSERT INTO $table (${keys.join(",")})VALUES(${values.join(",")})''');
      return res;
    } catch (e) {
      print(e);
      return -1;
    }
  }

  Future<int> _updateRow(
      String table, String columnId, int id, dynamic dataModel) async {
    var db = await database;
    var res = await db.update(table, dataModel.toInternalDBMap(),
        where: "$columnId = ?", whereArgs: [id]);
    return res;
  }

  Future<int> _deleteRow(String table, String columnId, int id) async {
    var db = await database;
    var res = await db.delete(table, where: "$columnId = ?", whereArgs: [id]);
    return res;
  }

  Future<int> _deleteAllRows(String table) async {
    var db = await database;
    int count = await db.delete(table, where: "1");
    return count;
  }

  Future<Map<String, dynamic>> _getRow(
      String table, String columnId, int id) async {
    var db = await database;
    var res =
        await db.query(table, distinct: true, where: columnId, whereArgs: [id]);
    if (res.isEmpty) {
      return <String, dynamic>{};
    } else {
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : <String, dynamic>{};
    }
  }

  Future<List<Map<String, dynamic>>> _getAllRows(String table) async {
    var db = await database;
    var res = await db.query(table, distinct: true);
    if (res.isEmpty) {
      return List.filled(0, <String, dynamic>{});
    } else {
      return res;
    }
  }

  Future<List<Message>> getAllMessages() async {
    var res = await _getAllRows(messageTableName);
    List<Message> messages = [];

    for (var element in res) {
      messages.add(Message.fromInternalDB(element));
    }

    return messages;
  }

  Future<int> addMessage(Message message) async {
    return await _addRow(messageTableName, message.toInternalDBMap());
  }

  Future<int> deleteAllMessages() async {
    return await _deleteAllRows(messageTableName);
  }

  Future<List<Article>> getAllArticles() async {
    var res = await _getAllRows(articleTableName);
    List<Article> articles = [];

    for (var element in res) {
      articles.add(Article.fromInternalDB(element));
    }

    return articles;
  }

  Future<int> addArticle(Article article) async {
    return await _addRow(articleTableName, article.toInternalDBMap());
  }

  Future<int> deleteAllArticles() async {
    return await _deleteAllRows(articleTableName);
  }

  Future<List<Organization>> getAllOrganization() async {
    var res = await _getAllRows(organizationTableName);
    List<Organization> organizations = [];

    for (var element in res) {
      organizations.add(Organization.fromInternalDB(element));
    }

    return organizations;
  }

  Future<int> addOrganization(Organization organization) async {
    return await _addRow(organizationTableName, organization.toInternalDBMap());
  }

  Future<int> deleteAllOrganizations() async {
    return await _deleteAllRows(organizationTableName);
  }

  Future<List<Document>> getAllDocuments() async {
    var res = await _getAllRows(documentTableName);
    List<Document> documents = [];

    for (var element in res) {
      documents.add(Document.fromInternalDB(element));
    }

    return documents;
  }

  Future<int> addDocument(Message message) async {
    return await _addRow(documentTableName, message.toInternalDBMap());
  }

  Future<int> deleteAllDocuments() async {
    return await _deleteAllRows(documentTableName);
  }
}
