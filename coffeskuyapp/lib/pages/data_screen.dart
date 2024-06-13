import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coffeskuyapp/pages/items_screen/detail_screen.dart';
import 'package:get/get.dart';
import 'package:coffeskuyapp/routes/route_name.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final String url = "http://192.168.0.103:8000/api/cafes";
  List? cafes;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getRefreshData();
  }

  Future<void> _getRefreshData() async {
    await fetchCafes();
  }

  Future<void> fetchCafes() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> cafeList = jsonResponse['list'];

        setState(() {
          cafes = cafeList;
          isLoading = false;
        });
      } else {
        print('Error fetching cafes: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching cafes: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void _navigateToDetailScreen(Map<String, dynamic> cafe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(cafe: cafe),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cafe List"),
      ),
      body: RefreshIndicator(
        onRefresh: _getRefreshData,
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : cafes == null
                ? Center(child: Text("No data available"))
                : ListView.builder(
                    itemCount: cafes!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _navigateToDetailScreen(cafes![index]);
                        },
                        child: Material(
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/img/coffe4.jpg',
                                          height: 50,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cafes![index]["nama"],
                                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_pin,
                                                color: Colors.black,
                                              ),
                                              Text(cafes![index]["alamat"]),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteName.home_screen);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.grey,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteName.data_screen);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.coffee,
                      color: Colors.brown,
                    ),
                    Text(
                      'Caffe',
                      style: TextStyle(
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteName.profile_screen);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    Text(
                      'Account',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
