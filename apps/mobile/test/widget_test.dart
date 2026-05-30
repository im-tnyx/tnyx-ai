import 'package:flutter_test/flutter_test.dart';
import 'package:tnyx_mobile/src/app/tnyx_app.dart';

void main() {
  testWidgets('Welcome screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TnyxApp());

    // Verify that we are on the welcome screen by checking for specific text
    expect(find.text('Get Started'), findsOneWidget);
  });
}
