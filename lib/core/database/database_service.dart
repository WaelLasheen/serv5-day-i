abstract class DatabaseService {
  Future<void> init();

  // Save data
  Future<bool> setString(String key, String value);
  Future<bool> setBool(String key, bool value);
  Future<bool> setInt(String key, int value);

  // Retrieve data
  String? getString(String key);
  bool? getBool(String key);
  int? getInt(String key);

  // Delete data
  Future<bool> remove(String key);
  Future<bool> clear();
}