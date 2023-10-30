const List<String> months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

String getMonth(int monthNum) {
  return months[monthNum - 1];
}

String getHumanReadableDate(DateTime? date) {
  if (date == null) {
    return "No date";
  }

  final monthText = getMonth(date.month);
  return '${date.year} $monthText ${date.day}';
}

String getShortDate(DateTime? date) {
  if (date == null) {
    return "No date";
  }

  return '${date.day}.${date.month + 1}.${date.year}';
}

String countAge(DateTime? date) {
  if (date == null) {
    return "No age";
  }

  final now = DateTime.now();
  final age = now.year - date.year;

  if (age == 0 && (now.month - date.month == 6)) {
    return "Less than 6 months";
  }

  if (age == 0) {
    return "Less than a year";
  }

  if (age == 1) {
    return "1 year";
  }

  return "${age.toString()} years";
}
