class CustomerModel {
  String email;
  String firstName;
  String lastName;
  String password;

  CustomerModel({this.email, this.firstName, this.lastName, this.password});

  // CustomerModel.fromJson(Map<String, dynamic> json) {
  //   email = json['email'];
  //   firstName = json['firstName'];
  //   lastName = json['lastName'];
  //   password = json['password'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data.addAll({
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
      'username': email,
    });
    return data;
  }
}
