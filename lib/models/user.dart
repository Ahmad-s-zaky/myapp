class User {
  final String name;
  final String address;
  final String company;
  final String phoneNumber;
  final String email;
  final String password;

  User({
    required this.name,
    required this.address,
    required this.company,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'company': company,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      address: map['address'],
      company: map['company'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      password: map['password'],
    );
  }
}