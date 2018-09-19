// *********************************************************
// * Copyright (C) 2018 Paul Hammant <paul@hammant.org>    *
// *                                                       *
// * All rights reserved. This file is proprietary and     *
// * confidential and can not be copied and/or distributed *
// * without the express permission of Paul Hammant        *
// *********************************************************
import 'package:flutter/material.dart';

class ButtonsRound extends StatelessWidget {
  const ButtonsRound(
      {Key key, this.text, this.symbol, this.color, this.textcolor, this.width})
      : super(key: key);

  final text, symbol, color, textcolor, width;

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 140.0 * width,
      height: 140.0 * width,
      padding: EdgeInsets.all(20.0 * width),
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          //borderRadius: new BorderRadius.circular(30.0),
          color: color,
          border: Border.all(color: Colors.black, width: 4.0 * width)),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(symbol,
              style: new TextStyle(
                  color: textcolor,
                  fontSize: 50.0 * width,
                  fontWeight: FontWeight.bold)),
          Text(text,
              style: new TextStyle(
                  color: textcolor,
                  fontSize: 25.0 * width,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
