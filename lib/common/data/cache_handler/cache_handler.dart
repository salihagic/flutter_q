import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_q/_all.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class CacheHandler {
  Future init();

  Future<dynamic> get(String key);

  Future set(String key, dynamic data);

  Future clear();

  String generateKey([
    String route = '',
    Map<String, dynamic> queryParametersSerialized = const {},
    Map<String, dynamic> dataSerialized = const {},
  ]);
}

class CacheHandlerImpl implements CacheHandler {
  late Box _storage;

  @override
  Future init() async {
    _storage = await Hive.openBox(AppKeys.cachedStorageKey);
  }

  @override
  Future<dynamic> get(String key) async {
    final data = await _storage.get(key);

    if (data is Map) {
      return data.map<String, dynamic>(
        (key, value) => MapEntry<String, dynamic>(key, value),
      );
    }

    if (data is List) {
      return data
          .map(
            (item) => item.map<String, dynamic>(
              (key, value) => MapEntry<String, dynamic>(key, value),
            ),
          )
          .toList();
    }

    return data;
  }

  @override
  Future set(String key, dynamic data) async {
    assert(data is Map<String, dynamic> || data is List<Map<String, dynamic>>,
        'Cache data should be serializable and of Map<String, dynamic> or List<Map<String, dynamic>>');

    await _storage.put(key, data);
  }

  @override
  Future clear() async {
    await _storage.clear();
  }

  @override
  String generateKey([
    String route = '',
    Map<String, dynamic> queryParametersSerialized = const {},
    Map<String, dynamic> dataSerialized = const {},
  ]) {
    final key =
        '$route${json.encode(queryParametersSerialized)}${json.encode(dataSerialized)}';

    return '$route - ${md5.convert(utf8.encode(key)).toString()}';
  }
}
