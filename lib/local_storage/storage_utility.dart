import 'package:get_storage/get_storage.dart';

class KLocalStorage {
  // static final KLocalStorage _instance = KLocalStorage._internal();

  late final GetStorage _storage;
  static KLocalStorage? _instance;
  KLocalStorage._internal();

  factory KLocalStorage() {
    _instance ??= KLocalStorage._internal();
    return _instance!;
  }
  // final _storage = GetStorage();

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = KLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}
