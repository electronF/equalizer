String capitalize(String text) {
  return text.substring(0, 1).toUpperCase() + text.substring(1);
}

String capitalizeEachWord(String text) {
  String newText = "";
  for (String word in text.split(' ')) {
    newText += "${word.substring(0, 1).toUpperCase()}${word.substring(1)} ";
  }

  return newText;
}
