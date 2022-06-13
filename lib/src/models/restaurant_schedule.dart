import 'package:intl/intl.dart';
import 'package:mari_pesan_sdk/src/utils/utils.dart';

class RestaurantSchedule {
  final int id;
  final int restaurantId;
  final String day;
  final String dayEnglish;
  final DateTime open;
  final String openText;
  final DateTime close;
  final String closeText;
  final bool isOpen;

  RestaurantSchedule({
    required this.id,
    required this.restaurantId,
    required this.day,
    required this.dayEnglish,
    required this.open,
    required this.openText,
    required this.close,
    required this.closeText,
    required this.isOpen,
  });

  factory RestaurantSchedule.fromMap(dynamic map) {
    DateFormat format = DateFormat('HH:mm');
    DateTime now = DateTime.now();

    DateTime open = format.parse(map['open']);
    DateTime nowOpen =
        DateTime(now.year, now.month, now.day, open.hour, open.minute);

    DateTime close = format.parse(map['close']);
    DateTime nowClose =
        DateTime(now.year, now.month, now.day, close.hour, close.minute);

    return RestaurantSchedule(
      id: map['id'],
      restaurantId: map['restaurantId'],
      day: map['day'],
      dayEnglish: Formatter.toEnglishDay(map['day']),
      open: nowOpen,
      openText: format.format(nowOpen),
      close: nowClose,
      closeText: format.format(nowClose),
      isOpen: map['isOpen'],
    );
  }
}
