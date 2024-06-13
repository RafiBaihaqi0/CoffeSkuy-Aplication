class User {
  final int id; // Ubah tipe data menjadi String
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],// Konversi ke String
      name: json['name'],
      email: json['email'],
    );
  }
}
