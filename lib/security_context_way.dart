import 'dart:io';

import 'package:flutter/services.dart';

Future<void> setUpGlobalCertificate() async {
// Step 1:- Set SecurityContext to not trust the OS Certificate.

  SecurityContext(withTrustedRoots: false);

  // Step 2:- Load certificate file by AssetBundle

  ByteData byteData = await rootBundle.load('assets/cer/facebook.pem');

// Step 3- Create default Security Context
  SecurityContext defaultContext = SecurityContext.defaultContext;

// Step 4:- setTrustedCertificatesBytes
  defaultContext.setTrustedCertificatesBytes(byteData.buffer.asInt8List());
}
