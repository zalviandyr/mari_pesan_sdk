import 'package:intl/intl.dart';

class Formatter {
  static String toRupiah(dynamic number) {
    NumberFormat format =
        NumberFormat.currency(locale: 'ID_id', name: 'Rp. ', decimalDigits: 0);

    return format.format(number);
  }

  static String phone(String phone) {
    List<String> validNumber = ['+628', '628', '08', '8'];
    String prefix = '+628';

    List valid = validNumber.where((elm) => phone.startsWith(elm)).toList();
    if (valid.isNotEmpty) {
      return phone.replaceFirst(valid.first, prefix);
    }

    return phone;
  }

  static String shortDate(DateTime date) {
    DateFormat format = DateFormat('dd/MM/y');

    return format.format(date);
  }

  static String longDate(DateTime date) {
    DateFormat format = DateFormat('dd MMMM y');

    return format.format(date);
  }

  static String shortTime(DateTime time) {
    DateFormat format = DateFormat('HH:mm');

    return format.format(time);
  }

  static String toEnglishDay(String day) {
    day = day.toLowerCase();

    Map<String, String> days = {
      'senin': 'monday',
      'selasa': 'tuesday',
      'rabu': 'wednesday',
      'kamis': 'thursday',
      'jumat': 'friday',
      'sabtu': 'saturday',
      'minggu': 'sunday',
    };

    return days[day] ?? day;
  }

  static String toIndonesiaDay(String day, {bool toLower = false}) {
    day = day.toLowerCase();

    Map<String, String> days = {
      'monday': 'Senin',
      'tuesday': 'Selasa',
      'wednesday': 'Rabu',
      'thursday': 'Kamis',
      'friday': 'Jumat',
      'saturday': 'Sabtu',
      'sunday': 'Minggu',
    };

    String result = days[day] ?? day;
    return toLower ? result.toLowerCase() : result;
  }
}
