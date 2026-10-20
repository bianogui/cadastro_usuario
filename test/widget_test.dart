import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cadastro_usuario/main.dart';

void main() {
  Future<void> preencher(WidgetTester tester, String label, String valor) {
    return tester.enterText(find.widgetWithText(TextFormField, label), valor);
  }

  Future<void> cadastrar(WidgetTester tester) async {
    await tester.ensureVisible(find.text('CADASTRAR'));
    await tester.tap(find.text('CADASTRAR'));
    await tester.pump();
  }

  testWidgets('exibe erros quando os campos estão vazios', (tester) async {
    await tester.pumpWidget(const MyApp());

    await cadastrar(tester);

    expect(find.text('Informe o nome completo'), findsOneWidget);
    expect(find.text('Informe o e-mail'), findsOneWidget);
    expect(find.text('Informe o CPF'), findsOneWidget);
    expect(find.text('Informe o telefone'), findsOneWidget);
    expect(find.text('Informe a senha'), findsOneWidget);
    expect(find.text('Corrija os campos destacados antes de continuar.'),
        findsOneWidget);
  });

  testWidgets('valida e-mail sem @ e senha curta', (tester) async {
    await tester.pumpWidget(const MyApp());

    await preencher(tester, 'E-mail', 'maria.email.com');
    await preencher(tester, 'Senha', '123');
    await cadastrar(tester);

    expect(find.text('O e-mail deve conter @'), findsOneWidget);
    expect(find.text('A senha deve ter no mínimo 6 caracteres'), findsOneWidget);
  });

  testWidgets('CPF e telefone aceitam somente números', (tester) async {
    await tester.pumpWidget(const MyApp());

    await preencher(tester, 'CPF', '123.abc-45');
    await preencher(tester, 'Telefone', '(11) 9876');

    expect(find.text('12345'), findsOneWidget);
    expect(find.text('119876'), findsOneWidget);
  });

  testWidgets('exibe SnackBar de sucesso com dados válidos', (tester) async {
    await tester.pumpWidget(const MyApp());

    await preencher(tester, 'Nome completo', 'Maria da Silva');
    await preencher(tester, 'E-mail', 'maria@email.com');
    await preencher(tester, 'CPF', '12345678901');
    await preencher(tester, 'Telefone', '11987654321');
    await preencher(tester, 'Senha', 'senha123');
    await preencher(tester, 'Confirmar senha', 'senha123');
    await cadastrar(tester);

    expect(find.text('Usuário Maria da Silva cadastrado com sucesso!'),
        findsOneWidget);
  });
}
