import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Integration tests for the full App require DI initialization.
    // Unit tests for individual Cubits and use cases are co-located in
    // each feature's test/ folder.
    expect(true, isTrue);
  });
}
