import 'package:tabungan_kita/constants.dart';

String kGetDateFromDateTime(DateTime dateTime) {
  return dateTime.day.toString() +
      " " +
      kMonth[dateTime.month-1] +
      " " +
      dateTime.year.toString();
}

String kGetMonthYearFromDateTime(DateTime dateTime){
  return kMonth[dateTime.month-1] +
      " " +
      dateTime.year.toString();
}