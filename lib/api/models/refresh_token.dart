class RefreshToken {
  String token;
  String expiration;

  RefreshToken({
    this.token,
    this.expiration,
  });

  factory RefreshToken.fromJson(Map<String, dynamic> json) => new RefreshToken(
    token: json["token"],
    expiration: json["expiration"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "expiration": expiration,
  };
}