import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:coffeskuyapp/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null){
      print(auth.currentUser!.email);
    }
    return Scaffold(
      body: PageStorage(
        bucket: PageStorageBucket(),
        child: currentScreen(),
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
              style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.transparent, foregroundColor: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    color:  Colors.brown,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.brown,
                    ),
                  ),
                ],
              ) ,
              ),
              ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteName.data_screen);
              },
              style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.transparent, foregroundColor: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.coffee,
                    color:  Colors.grey,
                  ),
                  Text(
                    'Caffe',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ) ,
              ),
              ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteName.profile_screen);
              },
              style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.transparent, foregroundColor: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color:  Colors.grey,
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ) ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


final List<Container> containerList = [
  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/img/coffe1.jpg'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(
                    Radius.circular(22),
                  ), 
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 70,
              color: Colors.black.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bagi Kopi',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.white,
                      ),
                      Text(
                        'Jl. Buah Batu',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  ),
  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/img/coffe2.jpg'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(
                    Radius.circular(22),
                  ), 
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 70,
              color: Colors.black.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kopi Bawah Pohon',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.white,
                      ),
                      Text(
                        'Jl. Dago Pakar',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  ),
  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/img/coffe3.jpg'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(
                    Radius.circular(22),
                  ), 
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 70,
              color: Colors.black.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kopi Toko Djawa',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.white,
                      ),
                      Text(
                        'Jl. Braga',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  ),
];

final List<Widget> containerSliders = containerList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(22.0)),
                child: Stack(
                  children: <Widget>[
                    item,
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

Container near_item(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(5),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/coffe4.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                              Radius.circular(22),
                            ), 
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 165.3,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(22),
                          )
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rustic',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/coffe3.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                              Radius.circular(22),
                            ), 
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 165.3,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(22),
                          )
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Modern',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/coffe5.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                              Radius.circular(22),
                            ), 
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 165.3,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(22),
                          )
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Industrial',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/coffe6.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                              Radius.circular(22),
                            ), 
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 165.3,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(22),
                          )
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cute',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
  TextStyle positionText(){
    return TextStyle(color: Colors.grey, fontWeight: FontWeight.w400);
  }
  TextStyle titleStyle(){
    return TextStyle(fontSize: 15, fontWeight: FontWeight.w400);
  }
  TextStyle subTitle() => TextStyle(fontWeight: FontWeight.w500);

class currentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.white,
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 70, left: 100), //apply padding to all four sides
                    child: Text(
                    "COFFESKUY",
                    style: GoogleFonts.jaldi(
                      textStyle: TextStyle(fontSize: 32, 
                          fontWeight: FontWeight.w600,
                          color: Colors.brown,),
                    ),
                    ),
                  ),
                  Icon(
                    Icons.notifications,
                    color: Colors.brown,
                    size: 32.0,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 20,
                height: 50.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: 
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'search caffe of coffeshop',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                    prefixIcon: Icon(Icons.search),  
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recommended for you",
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(fontSize: 19, 
                          fontWeight: FontWeight.w500,
                          color: Colors.brown,),
                    ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CarouselSlider(
                    options: CarouselOptions(
                    aspectRatio: 16/9,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: false,
                    initialPage: 1,
                    autoPlay: true,
                    padEnds : false,
                    ),
                  items: containerSliders,
                  )
                )
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pick your own Theme",
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(fontSize: 19, 
                          fontWeight: FontWeight.w500,
                          color: Colors.brown,),
                    ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              near_item(context)
            ],
          ),
        ),
      ),
    );
  }
}

// Place jobs_item, positionText, and titleStyle functions here
