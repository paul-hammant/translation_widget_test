// *********************************************************
// * Copyright (C) 2018 Paul Hammant <paul@hammant.org>    *
// *                                                       *
// * All rights reserved. This file is proprietary and     *
// * confidential and can not be copied and/or distributed *
// * without the express permission of Paul Hammant        *
// *********************************************************
import 'package:flutter/material.dart';
import 'package:little_flutter_app/Translations.dart';

class DocOut extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    final translations = Translations.of(context);

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(translations.text("doc_out")),
        ),
        body: new Center(
          child: Text(translations.text("doc_out"), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
        )
    );
  }
}