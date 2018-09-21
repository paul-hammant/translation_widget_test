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

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:little_flutter_app/DocIn.dart';
import 'package:little_flutter_app/DocOut.dart';
import 'package:little_flutter_app/Translations.dart';


void main() {

  final allLocales = ['locale/i18n_en.json', 'locale/i18n_hi.json'];
  Map<String, ByteData> localisedData = new Map();

  // I found that in testWidgets methods flutter now allowing to access the bundle/filesystem
  // that's why I moved the loading logic to this setUp function
  setUp(() async {
    for(String path in allLocales) {
      final uri = Uri.file(path);
      final fileData = await File.fromUri(uri).readAsBytes();
      final data = new ByteData.view(new Uint8List.fromList(fileData).buffer);
      localisedData[path] = data;
    }
  });


  testWidgets('Doc In test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(buildTestableWidget(new DocIn()));

    //This test works correctly
    expect(find.text('Doc In'), findsNWidgets(2));
  });

  testWidgets('Doc Out test', (WidgetTester tester) async {

    final rootWidget = new DefaultAssetBundle(
      bundle: new TestAssetBundle(localisedData),
      child: new Builder(
        builder: (BuildContext context) {
          final Translations translations = new Translations(context);
          return new MaterialApp(
            localizationsDelegates: [
              TranslationsDelegate(translations),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', ''),
              const Locale('hi', ''),
            ],
            home: new DocOut(translations),
          );
        },
      ),
    );

    await tester.pumpWidget(rootWidget);
    await tester.pumpAndSettle();
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

/// Assets bundle provider
class TestAssetBundle extends CachingAssetBundle {

  final Map<String, ByteData> localisedData;

  TestAssetBundle(this.localisedData);

  @override
  Future<ByteData> load(String key) async {
    return localisedData[key];
  }

}