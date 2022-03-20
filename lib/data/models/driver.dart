class Driver{

  String name, email, phone, address, city, state, companyId, id;

  Driver({this.name = "", this.email = "", this.address = "", this.city = "", this.phone = " ", this.state = "", this.companyId = "", this.id = ""});

  factory Driver.fromJson(Map<String, dynamic> json){
    return Driver(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      address: json["address"],
      city: json["city"],
      phone: json["phone"],
      state: json["state"],
      companyId: json["companyId"],
    );
  }

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      "userId": id,
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "city":city,
      "state": state,
      "companyId": companyId,
      "roles":[
       "Driver"
      ]
    };
  }

}