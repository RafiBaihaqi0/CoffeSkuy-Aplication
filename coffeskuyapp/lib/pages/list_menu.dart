import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListMenu extends StatefulWidget {
  final int cafeId;
  List? menus;

  ListMenu({required this.cafeId});

  @override
  _ListMenuState createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  List? menuItems;
  bool isLoading = true;
  final String url = "http://192.168.0.103:8000/api/data";

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
        final List<dynamic> menuList = jsonResponse['list'];

        setState(() {
          widget.menus = menuList;
          menuItems = menuList;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : menuItems == null
              ? Center(child: Text("No menu available"))
              : ListView.builder(
                  itemCount: menuItems!.length,
                  itemBuilder: (context, index) {
                    return MenuItemCard(menu: menuItems![index]);
                  },
                ),
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final Map<String, dynamic> menu;

  MenuItemCard({required this.menu});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              'assets/img/coffe4.jpg',// Replace with the actual field name for the image URL
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menu['nama'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Price: \Rp.${menu['harga']}',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Add your functionality to add menu item
                    },
                    child: Text('Add to Order'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
