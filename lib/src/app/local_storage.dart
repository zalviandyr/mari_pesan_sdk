part of 'app.dart';

class LocalStorage {
  static LocalStorage? _localStorage;
  late FlutterSecureStorage _storage;

  LocalStorage._();

  static LocalStorage get _instance => _localStorage ??= LocalStorage._();

  void _init() {
    _storage = const FlutterSecureStorage();
  }

  Future<void> store<V>(LocalStorageKey key, V value) async {
    bool valid = (value.runtimeType == key.type);

    if (valid) {
      await _storage.write(key: key.value, value: value.toString());
    } else {
      throw TypeError();
    }
  }

  Future<V?> read<V>(LocalStorageKey key) async {
    String? value = await _storage.read(key: key.value);

    if (value == null) return null;

    switch (V) {
      case bool:
        return (value == 'true') as V;
      case int:
        return int.tryParse(value) as V;
      case double:
        return double.tryParse(value) as V;
      default:
        return value as V;
    }
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}

enum LocalStorageKey {
  isFirstTime('is_first_time', bool);

  final String value;
  final Type type;
  const LocalStorageKey(this.value, this.type);
}
