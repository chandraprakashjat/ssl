import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssl_pining/bad_cer_callaback.dart';

import 'my_widget.dart';
import 'security_context_way.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//Way 1:-
  // await setUpGlobalCertificate();

//Way 2:-

  SecurityContext(withTrustedRoots: false);

  // HttpOverrides.global = MyHttpOverride();

//Way 3:- With All api call
  runApp(const MaterialApp(home: MyWidget()));
}
