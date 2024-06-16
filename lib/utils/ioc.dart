import 'package:get_it/get_it.dart';

class Ioc {
  static final GetIt _getIt = GetIt.instance;

  static T get<T extends Object>() {
    return _getIt.get<T>();
  }

  static Future<void> register<T extends Object>(T singleton) async {
    if (_getIt.isRegistered<T>()) {
      await _getIt.unregister<T>();
    }
    _getIt.registerSingleton(singleton);
  }

  static bool isRegistered<T extends Object>() => _getIt.isRegistered<T>();
}
