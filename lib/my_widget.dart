import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My SSL Certificate'),
        ),
        body: const Center(
          child: Text('Validate Certificate'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: _callApi, child: const Icon(Icons.send)));
  }

  void _callApi() async {
    final dio = Dio();

    final byteData = await rootBundle.load('assets/cer/facebook.pem');

    //Add certificate to api call
    final defaultAdapter = dio.httpClientAdapter as DefaultHttpClientAdapter;

    defaultAdapter.onHttpClientCreate = (client) {
      SecurityContext securityContext = SecurityContext();

      securityContext.setTrustedCertificatesBytes(byteData.buffer.asInt8List());

      HttpClient httpClient = HttpClient(context: securityContext);

      return httpClient;
    };
    try {
      var response = await dio.get('https://www.facebook.com/');

      print(response.data);
    } on DioError catch (error) {
      throw error.toString();
    } catch (error) {
      throw error.toString();
    }
  }
}
