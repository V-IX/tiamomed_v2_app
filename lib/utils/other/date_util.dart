extension DateUtil on String {
  String toDateWithoutAgeLetter() {
    return substring(0, length-2);
  }
}

String formattedTime({required int timeInSecond}) {
  final int sec = timeInSecond % 60;
  final int min = (timeInSecond / 60).floor();
  final String minute = min.toString().length <= 1 ? "0$min":"$min";
  final String second = sec.toString().length <= 1 ? "0$sec":"$sec";
  return "$minute:$second";
}

String formattedHourTime({required int timeInSecond}) {
  final int sec = timeInSecond % 60;
  final int min = (timeInSecond / 60).floor();
  final int h = min == 0 ? 0 : (min / 60).floor();
  final String minute = min.toString().length <= 1 ? "0$min":"$min";
  final String second = sec.toString().length <= 1 ? "0$sec":"$sec";
  final String hour = h.toString().length <= 1 ? "0$h":"$h";
  return "$hour:$minute:$second";

}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);

  return DateTime.utc(to.year, to.month, to.day)
      .difference(DateTime.utc(from.year, from.month, from.day)).inDays;
}
