import 'dart:io';

import 'package:flutter/services.dart';

class MyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    HttpClient httpClient = super.createHttpClient(context);

    httpClient.badCertificateCallback = ((cert, host, port) {
      //Step 1 :- load local file

      String localPEM = loadLocalFileString();

      if (cert.pem == localPEM) {
        return true;
      } else {
        return false;
      }
    });
    return httpClient;
  }

  loadLocalFileString() async {
    return await rootBundle.loadString('assets/cer/facebook.pem');
  }
}
