import 'package:http/http.dart';
import 'models/login_response.dart';
import 'models/merchant_token_response.dart';
import 'models/rewards_list.dart';
import 'dart:convert';

// API Manager
class APIManager {
  static final APIManager shared = APIManager._internal();
  
  factory APIManager() {
    return shared;
  }

  APIManager._internal();

  final baseURL = 'https://rush-revamp.globedv.com';

  Future<LoginResponse> loginUser(String mobileNumber, String pin) async {
    final url = '$baseURL/customer-service/customer/login/mobile';
    final body = {
      'mobile_number': mobileNumber,
      'pin': pin
    };

    final response = await post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'Application/x-www-form-urlencoded',
          'X-Merchant-Token':	Tokens.merchantToken
        },
        body: body
    );

    if (response.statusCode == 200) {
      var loginResponse = LoginResponse.fromJson(json.decode(response.body));
      Tokens.loginToken = loginResponse.token;
      UserManager.userMobileNumber = loginResponse.customer.email;
      UserManager.userName = "${loginResponse.customer.firstname} + ${loginResponse.customer.lastname}";

      return loginResponse;
    } else {
      throw Exception('Error response');
    }
  }

  Future<MerchantTokenResponse> merchantToken({
    String apiKey = 'EUecwls4K0ON', 
    String apiSecret = '2hayChGvEh1OE7dSTokaYchhvqEiQcWu'
  }) async {
    final url = '$baseURL/merchant-service/token/customer-app';
    final body = {
      'key': apiKey,
      'secret': apiSecret
    };

    final response = await post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'Application/x-www-form-urlencoded',
        },
        body: body
    );

    if (response.statusCode == 200) {
      var merchantTokenResponse = MerchantTokenResponse.fromJson(json.decode(response.body));
      Tokens.merchantToken = merchantTokenResponse.token;
      return merchantTokenResponse;
    } else {
      throw Exception('Error response');
    }
  }

  Future<RewardsList> featuredRewards({int count}) async {
    final url = '$baseURL/rewards-service/rewards/customer/featured/$count';

    final response = await get(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'Application/x-www-form-urlencoded',
          'Authorization': Tokens.loginToken
        }
    );

    if (response.statusCode == 200) {
      return RewardsList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}

class Tokens {
  static var merchantToken = '';
  static var loginToken = '';
}

class UserManager {
  static var userName = '';
  static var userMobileNumber = '';
}