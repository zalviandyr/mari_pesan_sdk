part of 'app.dart';

class FlutterNotification {
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  late NotificationDetails _platformChannelSpecifics;

  static FlutterNotification? _notification;

  FlutterNotification._();

  static FlutterNotification get _instance =>
      _notification ??= FlutterNotification._();

  Future<void> _init(Config config) async {
    String channelId = config.notificationId;
    String channelName = config.notificationName;
    String channelDesc = config.notificationDesc;

    // init plugin
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // init channel
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      channelId,
      channelName,
      description: channelDesc,
      playSound: true,
      enableVibration: true,
      enableLights: true,
      ledColor: const Color.fromARGB(255, 255, 0, 0),
      importance: Importance.high,
    );

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(channelId, channelName,
            playSound: true,
            channelDescription: channelDesc,
            importance: Importance.high,
            priority: Priority.high,
            ticker: 'ticker',
            enableLights: true,
            ledColor: const Color.fromARGB(255, 255, 0, 0),
            ledOnMs: 1000,
            ledOffMs: 500);

    _platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // init setting
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');

    InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    // init
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) {
        if (payload != null) {
          // TODO: create navigator if needed
          // NavigatorNavigate().go(MyApp.navigatorKey, payload);
        }
      },
    );
  }

  Future<void> show(RemoteMessage payload) async {
    await _flutterLocalNotificationsPlugin.show(
      payload.hashCode,
      payload.notification?.title ?? '',
      payload.notification?.body ?? '',
      _platformChannelSpecifics,
    );
  }
}
