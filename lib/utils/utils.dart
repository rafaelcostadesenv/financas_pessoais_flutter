import 'package:intl/intl.dart';

class Utils {
  static convertDate(String date) {
    try {
      if (date.contains('T')) {
        return DateFormat('dd/MM/y').format(DateTime.parse(date));
      }
    } catch (e) {}
  }
}
