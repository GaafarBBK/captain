import 'dart:async';
import 'package:flutter/material.dart';
import 'package:captain11/services/api.dart';

class BaseProvider with ChangeNotifier {
  final Api api = Api();
  bool isLoading = false;
  bool isFailed = false;

  void setLoading(bool value) {
    Timer(Duration(milliseconds: 50), () {
      isLoading = value;
      notifyListeners();
    });
  }

  void setFailed(bool status) {
    Timer(Duration(milliseconds: 50), () {
      isFailed = status;
      notifyListeners();
    });
  }
}
