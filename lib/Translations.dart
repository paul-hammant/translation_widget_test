// *********************************************************
// * Copyright (C) 2018 Paul Hammant <paul@hammant.org>    *
// *                                                       *
// * All rights reserved. This file is proprietary and     *
// * confidential and can not be copied and/or distributed *
// * without the express permission of Paul Hammant        *
// *********************************************************
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'Application.dart';

class Translations {


  Translations(BuildContext context) {
    this.context = context;
    _localizedValues = null;
  }

  Locale locale;
  BuildContext context;
  static Map<dynamic, dynamic> _localizedValues;

  String text(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  Future<Translations> load(Locale locale) async {
    this.locale = locale;
    String jsonContent =
        await rootBundle.loadString("locale/i18n_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return this;
  }

  get currentLanguage => locale.languageCode;
}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {

  final Translations translations;

  TranslationsDelegate(this.translations);

  @override
  bool isSupported(Locale locale) =>
      applic.supportedLanguages.contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) => translations.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}

class SpecificLocalizationDelegate extends LocalizationsDelegate<Translations> {
  final Locale overriddenLocale;

  final Translations translations;

  SpecificLocalizationDelegate(this.translations, this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<Translations> load(Locale locale) =>
      translations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<Translations> old) => true;
}
