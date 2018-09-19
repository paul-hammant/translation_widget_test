// *********************************************************
// * Copyright (C) 2018 Paul Hammant <paul@hammant.org>    *
// *                                                       *
// * All rights reserved. This file is proprietary and     *
// * confidential and can not be copied and/or distributed *
// * without the express permission of Paul Hammant        *
// *********************************************************

// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:little_flutter_app/DocIn.dart';
import 'package:little_flutter_app/DocOut.dart';
import 'package:little_flutter_app/Translations.dart';


void main() {
  testWidgets('Doc In test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(buildTestableWidget(new DocIn()));

    //This test works correctly
    expect(find.text('Doc In'), findsNWidgets(2));
  });

  testWidgets('Doc Out test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    //TODO Make changes here. Pass a correct context and initialize Translations.
    // See line 33 to 63 in main.dart how it works correctly when the app is ran
    // This test should use around the same logic
    Translations translations = new Translations(null);
    await tester.pumpWidget(buildTestableWidget(new DocOut(translations)));

    //FIXME This test needs to work
    expect(find.text('Doc Out'), findsNWidgets(2));
  });
}

Widget buildTestableWidget(Widget widget) {
  return new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(
          home: widget,
      )
  );
}