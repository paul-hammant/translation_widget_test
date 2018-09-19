// *********************************************************
// * Copyright (C) 2018 Paul Hammant <paul@hammant.org>    *
// *                                                       *
// * All rights reserved. This file is proprietary and     *
// * confidential and can not be copied and/or distributed *
// * without the express permission of Paul Hammant        *
// *********************************************************
import 'package:flutter/material.dart';

typedef void LocaleChangeCallback(Locale locale);

class APPLIC {
  // List of supported languages
  final List<String> supportedLanguages = ['en', 'hi'];

  // Returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguages.map<Locale>((lang) => new Locale(lang, ''));

  // Function to be invoked when changing the working language
  LocaleChangeCallback onLocaleChanged;

  ///
  /// Internals
  ///
  static final APPLIC _applic = new APPLIC._internal();

  factory APPLIC() {
    return _applic;
  }

  APPLIC._internal();
}

APPLIC applic = new APPLIC();
