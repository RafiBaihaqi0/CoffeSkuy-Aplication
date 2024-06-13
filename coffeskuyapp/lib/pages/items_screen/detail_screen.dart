import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:coffeskuyapp/pages/maps_screen/maps_screen.dart';
import 'package:coffeskuyapp/pages/form_screen.dart';
import 'package:coffeskuyapp/pages/list_menu.dart';
import 'package:coffeskuyapp/data/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> cafe;

  DetailScreen({required this.cafe});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final MapController _mapController = MapController();
  late LatLng _currentCenter;
  List<User> users = [];
  bool isLoadingUsers = true;

  @override
  void initState() {
    super.initState();
    _currentCenter = LatLng(
      double.parse(widget.cafe["latitude"]),
      double.parse(widget.cafe["longitude"]),
    );
    fetchUsers();
  }

  Future<void> fetchUsers() async {
  setState(() {
    isLoadingUsers = true;
  });

  try {
    final response = await http.get(Uri.parse('http://192.168.0.103:8000/api/users'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['list'];
      setState(() {
        users = jsonResponse.map((user) => User.fromJson(user)).toList();
        isLoadingUsers = false;
      });
    } else {
      print('Error fetching users: ${response.statusCode}');
      setState(() {
        isLoadingUsers = false;
      });
    }
  } catch (e) {
    print('Error fetching users: $e');
    setState(() {
      isLoadingUsers = false;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cafe["nama"],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.location_pin),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(widget.cafe["alamat"]),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(22)),
                child: Image.asset(
                  'assets/img/coffe4.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Deskripsi Kafe',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                widget.cafe["content"] ?? 'Tidak ada deskripsi',
              ),
              SizedBox(height: 16),
              Text(
                'Rating Kafe',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Rating : ${widget.cafe["averageRating"] ?? 0} / 5',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Row(
                    children: List.generate(
                      (widget.cafe["averageRating"] ?? 0).toInt(),
                      (index) {
                        return Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Ulasan Kafe',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Column(
                children: List.generate(
                  (widget.cafe["reviews"] as List).length,
                  (index) {
                    var review = widget.cafe["reviews"][index];
                    // Find the user corresponding to the review's user_id
                    User? user = users.firstWhere(
                      (user) => user.id == review["user_id"],
                      orElse: () => User(id: -1, name: "Unknown", email: ""),
                    );

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(user.name), // Display user's name
                      subtitle: Text(review["komentar"]), // Display review's comment
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ListMenu(cafeId: widget.cafe['id'],),
                    ),
                  );
                },
                child: Text('Add a Rating'),
              ),
              SizedBox(height: 16),
              Text(
                'Lokasi Kafe',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => MapScreen(
                        latitude: double.parse(widget.cafe["latitude"]),
                        longitude: double.parse(widget.cafe["longitude"]),
                      ),
                    ),
                  );
                },
                child: Text('Go to Maps Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
