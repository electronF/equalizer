String toUTCDateTimeString(String isoDateTime, String language) {
  List<String> enWeekDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  List<String> frWeekDays = [
    "Lundi",
    "Mardi",
    "Mercredi",
    "Jeudi",
    "Vendredi",
    "Samedi",
    "Dimanche"
  ];

  List<String> enMonths = [
    "January",
    "Febuary",
    "March",
    "April",
    "May",
    "Jun",
    "Jully",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List<String> frMonths = [
    "Janvier",
    "Fevrier",
    "Mars",
    "Avril",
    "Mai",
    "Juin",
    "Juillet",
    "Août",
    "Septembre",
    "Octobre",
    "Novembre",
    "Decembre"
  ];

  var dateTime = DateTime.parse(isoDateTime);
  if (language == 'en') {
    return "${enWeekDays[dateTime.weekday - 1]}, ${dateTime.day} ${enMonths[dateTime.month - 1].toLowerCase()} ${dateTime.year} at ${dateTime.hour}:${dateTime.minute}";
  } else {
    return "${frWeekDays[dateTime.weekday - 1]}, ${dateTime.day} ${frMonths[dateTime.month - 1].toLowerCase()} ${dateTime.year} à ${dateTime.hour}:${dateTime.minute}";
  }
}

String toUTCDateString(String isoDateTime, String language) {
  List<String> enMonths = [
    "January",
    "Febuary",
    "March",
    "April",
    "May",
    "Jun",
    "Jully",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List<String> frMonths = [
    "Janvier",
    "Fevrier",
    "Mars",
    "Avril",
    "Mai",
    "Juin",
    "Juillet",
    "Août",
    "Septembre",
    "Octobre",
    "Novembre",
    "Decembre"
  ];

  var dateTime = DateTime.parse(isoDateTime);
  if (language == 'en') {
    return "${dateTime.day} ${enMonths[dateTime.month - 1].toLowerCase()} ${dateTime.year}";
  } else {
    return "${dateTime.day} ${frMonths[dateTime.month - 1].toLowerCase()} ${dateTime.year}";
  }
}
