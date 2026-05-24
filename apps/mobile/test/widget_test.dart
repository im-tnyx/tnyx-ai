import 'package:flutter_test/flutter_test.dart';
import 'package:tnyx_mobile/app/tnyx_app.dart';

void main() {
  testWidgets('Welcome screen renders base content', (tester) async {
    await tester.pumpWidget(const TnyxApp());
    await tester.pumpAndSettle();

    expect(find.text('Welcome to TNYX'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
