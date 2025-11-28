import 'package:flutter_test/flutter_test.dart';
import 'package:azkar/data/azkar_data.dart';
import 'package:azkar/models/zekr.dart';

void main() {
  group('AzkarData', () {
    test('morning azkar returns correct number of items', () {
      final azkar = AzkarData.getData(AzkarType.morning);
      expect(azkar.length, 23);
    });

    test('evening azkar returns correct number of items', () {
      final azkar = AzkarData.getData(AzkarType.evening);
      expect(azkar.length, 23);
    });

    test('pray azkar returns correct number of items', () {
      final azkar = AzkarData.getData(AzkarType.pray);
      expect(azkar.length, 13);
    });

    test('zekr count can be modified', () {
      final zekr = Zekr(text: 'test', count: 3);
      expect(zekr.count, 3);
      zekr.count--;
      expect(zekr.count, 2);
    });
  });
}
