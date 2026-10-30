import 'package:flutter_test/flutter_test.dart';

import 'package:dice_game_app/main.dart';

void main() {
  testWidgets('starts at total 2 and reset brings it back', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Play Dice'), findsOneWidget);
    expect(find.text('Total is 2'), findsOneWidget);
    expect(find.text('You Lose'), findsOneWidget);

    await tester.tap(find.text('roll'));
    await tester.pump();
    await tester.tap(find.text('reset'));
    await tester.pump();

    expect(find.text('Total is 2'), findsOneWidget);
  });
}
