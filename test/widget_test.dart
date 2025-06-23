// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_and_unit_test/logic/checker.dart';

import 'package:tdd_and_unit_test/main.dart';

void main() {
  
  test("check bad student", (){

    expect(checkStudentStatus(allQuestion: 10,correctQustion: 7,grade: Grade.EXCELLENT), false);
  });


  test("check Good student", (){

    expect(checkStudentStatus(allQuestion: 10,correctQustion: 10,grade: Grade.VERYGOOD), true);
  });


  test("check Perfect student", (){

    expect(checkStudentStatus(allQuestion: 10,correctQustion: 10,grade: Grade.EXCELLENT), true);
  });


  test("check all value negative student", (){

    expect(()=> checkStudentStatus(allQuestion: -10,correctQustion: -10,grade: Grade.GOOD), throwsException);
  });


  testWidgets("test for green snackbar", (WidgetTester tester)async{
    await tester.pumpWidget(MyApp());
    final allQuestionTextFeild = find.byKey(ValueKey("all"));

    final solverQuestion = find.byKey(ValueKey("some"));

    final button = find.byIcon(Icons.add);

   await tester.enterText(allQuestionTextFeild, "10");
    await tester.enterText(solverQuestion, "8");
    await tester.tap(button);
    await tester.pump();
    expect(find.byType(SnackBar),findsOneWidget);
  });

}
