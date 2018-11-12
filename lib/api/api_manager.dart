import 'package:http/http.dart';
import 'models/login_response.dart';
import 'dart:convert';

// API Client
class APIClient {
  APIClient({String baseURL});

//  Future<T> fetchURL<T>(String url) async {
//    final response = await get(url);
//
//    if (response.statusCode == 200) {
//      return LoginResponse.fromJson(json)
//    }
//  }
}

// API Manager
class APIManager {
  Future<LoginResponse> loginUser(String mobileNumber, String pin) async {
    final url = 'https://rush-revamp.globedv.com/customer-service/customer/login/mobile';
    final body = {
      'mobile_number': mobileNumber,
      'pin': pin
    };

    final response = await post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'Application/x-www-form-urlencoded',
          'X-Merchant-Token':	'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJtZXJjaGFudC1zZXJ2aWNlIiwic3ViIjoiZDM2YjBhMmQtMzc4MS00MjU0LTgwMjUtMzUxMmFhODAwOGE4IiwiaWF0IjoxNTQyMDEwNzQ1LCJleHAiOjE1NDIwMTQzNDUsIm1lcmNoYW50Ijp7InV1aWQiOiI4OGQ2NWM1Yy02OWE5LTMzNGEtOWY5NC0yY2I1NzRkNzVmN2EiLCJuYW1lIjoiRGlnaXRhbCBWZW50dXJlczEiLCJwZXJtaXNzaW9ucyI6W119fQ.aMKnWbuXehNOy27QJ562yApR89MGPxE8UlYEKeOSE_4dvuMAzN3xiaXLUAQr6te-meb3TgK82Bf5lmoPOHY1cb9aQtm1k_jWWpr5GHH2nGN-8WdOr30QqvDlgqqlg2BuwubGYR0gzP0U0vJZ3W1WrAyHZ6GMIUgQJJ0uuadDG4ltsLGuwlcc_gELMo8VcI4q9MGoeu5rvCoPphrloq5WcLXj2j6FOObIZ4ZDcJxf7l55jAJIiSjiRoLMucr8SfJjXhwALIMfsIfhV0p00qc0NtiIwdXk2X8gd1nNuURHrkLkVZgkf8Hcb2-gZYvd-6QRMx2K0Jq3JcBQRHbFHgG_wXLWwYVFMEpWl-F80GXamUF7tDwHzvHeL9M5q8haQPYLBV08Dblk-N06h1a-3milQoATW3AkpemPYFVBtzbzIT-DrExz4mmlm-034owDkaAKU5KZmspVj9KhxwpmgfeFzXhmuTxZChEnYuJU6Oc8YmdKtEoGERqxo3O4Vewm_bnbu0E7W3kvoU6bvecC-cTEeG9w5GdX5tiglicSaFrk5CvxK3Lbhu6LFPF778Y1x7_S3_x1qVgTGPTmvKu7_8lfVXlJRP23GF4M76qACggwarzAYmwxOm2uYn3JU8svQMFQmxK1lPeqql5htSyc2C2kQqJBbwQkPI8HriPSgVv4bcE',
        },
        body: body
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      print('Failed to load post');
    }
  }
}
