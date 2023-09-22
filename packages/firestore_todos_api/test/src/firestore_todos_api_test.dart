// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:firestore_todos_api/firestore_todos_api.dart';

void main() {
  group('FirestoreTodosApi', () {
    test('can be instantiated', () {
      expect(FirestoreTodosApi(), isNotNull);
    });
  });
}
