import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_http.mocks.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  final MockBankHttp httpMock = MockBankHttp();

  testWidgets("My Widget has a text Spent", (tester) async {
    when(
      httpMock.dolarToReal(),
    ).thenAnswer(
      (_) async => ("5"),
    );
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: httpMock.dolarToReal(),
          ),
        ),
      ),
    );
    final spentFinder = find.text("Spent");
    expect(spentFinder, findsOneWidget);
  });

  testWidgets("Find a LinearProgressIndicator", (tester) async {
    when(
      httpMock.dolarToReal(),
    ).thenAnswer(
      (_) async => ("5"),
    );
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: httpMock.dolarToReal(),
          ),
        ),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets("Find a AccountStatus", (tester) async {
    when(
      httpMock.dolarToReal(),
    ).thenAnswer(
      (_) async => ("5"),
    );
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: httpMock.dolarToReal(),
          ),
        ),
      ),
    );
    expect(find.byKey(Key("testKey")), findsOneWidget);
  });

  testWidgets("Find 5x BoxCards", (tester) async {
    when(
      httpMock.dolarToReal(),
    ).thenAnswer(
      (_) async => ("5"),
    );
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: httpMock.dolarToReal(),
          ),
        ),
      ),
    );
    expect(find.byWidgetPredicate((widget) {
      if (widget is BoxCard) {
        return true;
      } else {
        return false;
      }
    }), findsNWidgets(5));
  });

  testWidgets(
    "When tap deposit should upload earned in \$10",
    (tester) async {
      when(
        httpMock.dolarToReal(),
      ).thenAnswer(
        (_) async => ("5"),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: httpMock.dolarToReal(),
            ),
          ),
        ),
      );
      await tester.tap(find.text("Deposit"));
      await tester.tap(find.text("Earned"));
      await tester.pumpAndSettle();
      expect(find.text("\$10.0"), findsOneWidget);
    },
  );

  testWidgets("Testing MockHttp dolarToReal", (tester) async {
    when(
      httpMock.dolarToReal(),
    ).thenAnswer(
      (_) async => ("5"),
    );
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: httpMock.dolarToReal(),
          ),
        ),
      ),
    );
    verify(httpMock.dolarToReal()).called(6);
  });
}
