import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState();

}
class _DataScreenState extends State<DataScreen> {
  final String url = "https://65c4a4b8dae2304e92e3021c.mockapi.io/coffeshop/api/coffeshopnames";
  List? data;

  @override
  void initState() {
    _getRefreshDaata();
    super.initState();
  }

  Future<void> _getRefreshDaata() async {
    await getJsonData(context);
  }

  Future<void> getJsonData(BuildContext context) async {
    var response = await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    print(response.body);
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build your yet another screen widget here
    return Scaffold(
      appBar: AppBar(
        title: Text("Caffe List"),
      ),
      body: RefreshIndicator(
        onRefresh: _getRefreshDaata,
        child: data == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: data == null ? 0 : data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print(data![index]["id"]);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  child: Image.network(
                                    data![index]["avatar"],
                                    height: 50,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data![index]["name"]),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          color: Colors.black,
                                        ),
                                        Text(data![index]["address"]),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}