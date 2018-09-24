// *********************************************************
// * Copyright (C) 2018 Paul Hammant <paul@hammant.org>    *
// *                                                       *
// * All rights reserved. This file is proprietary and     *
// * confidential and can not be copied and/or distributed *
// * without the express permission of Paul Hammant        *
// *********************************************************
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:little_flutter_app/ButtonsRound.dart';
import 'package:little_flutter_app/DocIn.dart';
import 'package:little_flutter_app/DocOut.dart';
import 'package:little_flutter_app/Application.dart';
import 'package:little_flutter_app/Strings.dart';
import 'package:little_flutter_app/Translations.dart';

var width;

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SpecificLocalizationDelegate _localeOverrideDelegate;
  Translations translations;

  @override
  void initState() {
    super.initState();
    translations = new Translations(context);
    _localeOverrideDelegate = new SpecificLocalizationDelegate(translations, null);

    ///
    /// Let's save a pointer to this method, should the user wants to change its language
    /// We would then call: applic.onLocaleChanged(new Locale('en',''));
    ///
    applic.onLocaleChanged = onLocaleChange;
  }

  onLocaleChange(Locale locale) {
    setState(() {
      _localeOverrideDelegate = new SpecificLocalizationDelegate(translations, locale);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: Strings.title,

      localizationsDelegates: [
        TranslationsDelegate(translations),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('hi', ''),
      ],

      home: new DocuSend(title: Strings.title),
    );
  }
}

class DocuSend extends StatefulWidget {
  DocuSend({Key key, this.title}) : super(key: key);

  final String title;

  @override
  createState() => new DocuSendState();
}

class DocuSendState extends State<DocuSend> {

  DocuSendState({Key key});


  @override
  Widget build(BuildContext context) {
    width = Strings.dimensions(context);
    final translations = Translations.of(context);

    var docOut = new Container(
      margin: EdgeInsets.only(right: 20.0 * width),
      child: new Center(
        child: new InkWell(
          onTap: () => docOutMethod(),
          child: new ButtonsRound(width: width,
              symbol: '\u2015',
              text: translations.text('doc_out'),
              color: Colors.orange,
              textcolor: Colors.black),
        ),
      ),
    );

    var docIn = new Container(
      margin: EdgeInsets.only(left: 20.0 * width),
      child: new Center(
        child: new InkWell(
          onTap: () => docInMethod(),
          child: new ButtonsRound(width: width,
              symbol: '\u002b',
              text: translations.text('doc_in'),
              color: Colors.green,
              textcolor: Colors.white),
        ),
      ),
    );

    return new Scaffold(

      appBar: new AppBar(
        title: new Center(child: new Image.asset('assets/images/title.png', fit: BoxFit.cover)),
      ),

      body: new SingleChildScrollView(
        child: Column(
          children: <Widget>[

            new Container(
                margin: EdgeInsets.all(20.0 * width),
                child: new Row(
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    docOut,
                    docIn,
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }


  docOutMethod() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DocOut()),
    );
  }

  docInMethod() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DocIn()),
    );
  }

}