import 'customer.dart';
import 'refresh_token.dart';

abstract class JSONObject {

}

class LoginResponse {
  dynamic message;
  Customer customer;
  String token;
  RefreshToken refreshToken;

  LoginResponse({
    this.message,
    this.customer,
    this.token,
    this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => new LoginResponse(
    message: json["message"],
    customer: Customer.fromJson(json["customer"]),
    token: json["token"],
    refreshToken: RefreshToken.fromJson(json["refresh_token"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "customer": customer.toJson(),
    "token": token,
    "refresh_token": refreshToken.toJson(),
  };
}

class Logr {
  dynamic message;
  Customer customer;
  String token;
  RefreshToken refreshToken;

  Logr({
    this.message,
    this.customer,
    this.token,
    this.refreshToken,
  });

  Logr.fromJSON

  factory Logr.fromJson(Map<String, dynamic> json) => new Logr(
    message: json["message"],
    customer: Customer.fromJson(json["customer"]),
    token: json["token"],
    refreshToken: RefreshToken.fromJson(json["refresh_token"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "customer": customer.toJson(),
    "token": token,
    "refresh_token": refreshToken.toJson(),
  };
}