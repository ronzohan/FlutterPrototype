import 'customer.dart';
import 'refresh_token.dart';

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