class MerchantTokenResponse {
    String token;
    dynamic message;

    MerchantTokenResponse({
        this.token,
        this.message,
    });

    factory MerchantTokenResponse.fromJson(Map<String, dynamic> json) => new MerchantTokenResponse(
        token: json["token"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "message": message,
    };
}
