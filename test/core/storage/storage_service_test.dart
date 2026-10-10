import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cutra/core/storage/secure_storage_service.dart';
import 'package:cutra/core/storage/shared_prefs_service.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}
class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('SecureStorageService tests', () {
    late MockFlutterSecureStorage mockSecureStorage;
    late SecureStorageService service;

    setUp(() {
      mockSecureStorage = MockFlutterSecureStorage();
      service = SecureStorageService(secureStorage: mockSecureStorage);
    });

    test('readString should call secureStorage.read', () async {
      when(() => mockSecureStorage.read(key: 'token'))
          .thenAnswer((_) async => 'secret_token');

      final result = await service.readString('token');

      expect(result, equals('secret_token'));
      verify(() => mockSecureStorage.read(key: 'token')).called(1);
    });

    test('writeString should call secureStorage.write', () async {
      when(() => mockSecureStorage.write(key: 'token', value: 'secret_token'))
          .thenAnswer((_) async {});

      await service.writeString('token', 'secret_token');

      verify(() => mockSecureStorage.write(key: 'token', value: 'secret_token'))
          .called(1);
    });

    test('delete should call secureStorage.delete', () async {
      when(() => mockSecureStorage.delete(key: 'token'))
          .thenAnswer((_) async {});

      await service.delete('token');

      verify(() => mockSecureStorage.delete(key: 'token')).called(1);
    });
  });

  group('SharedPrefsService tests', () {
    late MockSharedPreferences mockPrefs;
    late SharedPrefsService service;

    setUp(() {
      mockPrefs = MockSharedPreferences();
      service = SharedPrefsService(mockPrefs);
    });

    test('readString should call prefs.getString', () async {
      when(() => mockPrefs.getString('theme')).thenReturn('dark');

      final result = await service.readString('theme');

      expect(result, equals('dark'));
      verify(() => mockPrefs.getString('theme')).called(1);
    });

    test('writeString should call prefs.setString', () async {
      when(() => mockPrefs.setString('theme', 'dark'))
          .thenAnswer((_) async => true);

      await service.writeString('theme', 'dark');

      verify(() => mockPrefs.setString('theme', 'dark')).called(1);
    });
  });
}
