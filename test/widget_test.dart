import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pm_p5_4243250017/main.dart';

void main() {
  testWidgets('Tombol favorit mengubah ikon dan memunculkan SnackBar', (tester) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const AplikasiUtama());
    await tester.pumpAndSettle();
    expect(find.text('Soto Daging Sapi'), findsOneWidget);
    final tombolHati = find.byIcon(Icons.favorite_border).first;
    expect(tombolHati, findsWidgets);

    await tester.ensureVisible(tombolHati);
    await tester.pumpAndSettle();

    await tester.tap(tombolHati);
    await tester.pump();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.text('Soto Daging Sapi ditambahkan ke favorit'), findsOneWidget);
  });
}