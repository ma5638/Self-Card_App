import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'services/quoteService.dart';

import 'dart:convert';

class App {
  static late SharedPreferences localStorage;
  static late QuoteService quoteService;
  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
    quoteService = QuoteService();
  }
}