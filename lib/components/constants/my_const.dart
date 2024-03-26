import 'package:intl/intl.dart';

class MyConstants {

  static DateTime selectedDate = DateTime.now();

  // March 26, 2024 -- Date Formant Original
  static String formatDate(DateTime date) {
    return DateFormat('MMMM dd, yyyy').format(date);
  }

  // March --- Month format for my_appbar.
  static String monthFormat(DateTime date) {
    return DateFormat('MMMM yyyy').format(date);
  }

  // Tue --- Weekday format for date_row.
  static String weekdayFormat(DateTime date) {
    return DateFormat('EEE').format(date);
  }


  
  static int getWeekNumber(DateTime date) {
    // Find the first day of the year
    DateTime firstDayOfYear = DateTime(date.year, 1, 1);
    // Calculate the difference in days
    int difference = date.difference(firstDayOfYear).inDays;
    // Calculate the week number
    int weekNumber = (difference / 7).ceil();
    return weekNumber;
  }

}