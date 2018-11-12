class Customer {
  int id;
  String uuid;
  String email;
  String firstname;
  String lastname;
  String merchantUUID;

  Customer({
    this.id,
    this.uuid,
    this.email,
    this.firstname,
    this.lastname,
    this.merchantUUID,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => new Customer(
    id: json["id"],
    uuid: json["uuid"],
    email: json["email"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    merchantUUID: json["merchant_uuid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "email": email,
    "firstname": firstname,
    "lastname": lastname,
    "merchant_uuid": merchantUUID,
  };
}