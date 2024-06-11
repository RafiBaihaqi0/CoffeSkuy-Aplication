class User {
  final int id;
  final String name;
  final String email;
  final String password; // Pastikan ada field password

  User({required this.id, required this.name, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'], // Pastikan ada field password
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password, // Pastikan ada field password
    };
  }
}
