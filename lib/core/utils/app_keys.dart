import 'package:devpop/core/widgets/bottom_navbar/keys/bottom_navbar_key.dart';

class AppKeys {
  factory AppKeys() => _instance;

  AppKeys._internal();

  static final AppKeys _instance = AppKeys._internal();

  static final bottomNavbarWidget = BottomNavbarKey();
}
