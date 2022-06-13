abstract class Config {
  final String appName;
  final String notificationId;
  final String notificationName;
  final String notificationDesc;
  final String host;
  final String dynamicLink;
  final String package;
  final String signInRoute;
  final String navigationRoute;

  Config({
    required this.appName,
    required this.notificationId,
    required this.notificationName,
    required this.notificationDesc,
    required this.host,
    required this.dynamicLink,
    required this.package,
    required this.signInRoute,
    required this.navigationRoute,
  });
}
