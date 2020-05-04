import 'package:automation_testing_module/view/widget_testing_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Login Successful', (WidgetTester widgetTester) async {

    //Renders the UI from the given widget
    await widgetTester.pumpWidget(LoginWidget());

    // Widget finders using key & type
    final emailTextFieldFinder = find.byKey(Key('emailKey'));
    final passwordTextFieldFinder = find.byKey(Key('passwordKey'));
    final buttonFieldFinder = find.byType(MaterialButton);

    //enters text to the TextFormField using enterText
    await widgetTester.enterText(emailTextFieldFinder, 'akshay@aeologic.com');
    await widgetTester.pump();
    expect(find.text('akshay@aeologic.com'), findsOneWidget);

    //enters text to the TextFormField using enterText
    await widgetTester.enterText(passwordTextFieldFinder, 'Unittest@123');
    await widgetTester.pump();
    expect(find.text('Unittest@123'), findsOneWidget);

    //make the button tap event
    await widgetTester.tap(buttonFieldFinder);
    await widgetTester.pump();

    //check for the response after button tap
    final textFinder = find.text('Valid Data');
    expect(textFinder, findsWidgets);

  });
}
