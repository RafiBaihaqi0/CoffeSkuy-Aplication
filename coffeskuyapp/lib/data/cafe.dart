class Cafe {
  int id;
  String nama;
  String alamat;
  String gambar;
  String content;
  String latitude;
  String longitude;
  String createdAt;
  String updatedAt;
  int userId;
  double averageRating;
  List<dynamic> reviews;

  Cafe({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.gambar,
    required this.content,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.averageRating,
    required this.reviews,
  });

  factory Cafe.fromJson(Map<String, dynamic> json) {
    return Cafe(
      id: json['id'],
      nama: json['nama'],
      alamat: json['alamat'],
      gambar: json['gambar'],
      content: json['content'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      userId: json['user_id'],
      averageRating: json['averageRating']?? 0.0,
      reviews: json['reviews'],
    );
  }
}