import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Google_Provider extends ChangeNotifier {
  double progressbar = 0;
  InAppWebViewController? inAppWebViewController;


  void changeprogressbar(double progress) {
    progressbar = progress;
    notifyListeners();
  }
}
