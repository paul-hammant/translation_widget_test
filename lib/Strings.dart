// *********************************************************
// * Copyright (C) 2018 Paul Hammant <paul@hammant.org>    *
// *                                                       *
// * All rights reserved. This file is proprietary and     *
// * confidential and can not be copied and/or distributed *
// * without the express permission of Paul Hammant        *
// *********************************************************
import 'package:flutter/material.dart';

class Strings {
  static String title = 'DocuSend';
  static String userImage = 'https://st2.depositphotos.com/8440746/11967/v/950/depositphotos_119670430-stock-illustration-user-icon-man-profile-businessman.jpg';
  static String userName = 'Micheal Smith';
  static String userRating = '99.8%';
  static String currentCredit = '\$57.15';

  static String fileName = 'A_Document.docx';
  static String receiverName = 'Sadiq Karimala';
  static String receiverImage = 'https://st2.depositphotos.com/8440746/11967/v/950/depositphotos_119670430-stock-illustration-user-icon-man-profile-businessman.jpg';
  static String receiverRating = '99.5%';

  static String senderName = 'Anna Karolina';

  static double dimensions(context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width / 411;
    return width;
  }
}