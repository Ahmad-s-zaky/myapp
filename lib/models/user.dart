class User {
  final String? nama;
  final String? alamat;
  final String? email;
  final String? password;
  final String? noTelpon;
  final String? company;

  User({
    required this.nama,
    required this.alamat,
    required this.email,
    required this.password,
    required this.noTelpon,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nama: json['nama'],
      alamat: json['alamat'],
      email: json['email'],
      password: json['password'],
      noTelpon: json['noTelpon'],
      company: json['company'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'alamat': alamat,
      'email': email,
      'password': password,
      'noTelpon': noTelpon,
      'company': company,
    };
  }
}
