import 'dart:math';
import 'package:dashang1/AddProperty.dart';
import 'package:dashang1/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/painting/box_shadow.dart';
import 'package:get/get.dart';
import 'package:dashang1/propertyList.dart';
import 'package:dashang1/bar.dart';
import 'DetailPage.dart';
import 'dimensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  double _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 0.0;
  late String _username;

  @override
  void initState() {
    super.initState();
    _getUsername();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    double currTrans = _height * (1 - _scaleFactor) / 2;

    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale = _scaleFactor - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix =Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/photo0.jpg'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer(context),
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hub',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          spacing:
                          0, // Adjust the spacing between stars as needed
                          children: List.generate(
                            5,
                                (index) => Transform.scale(
                              scale: 0.8, // Adjust the scale factor as needed
                              child: Icon(Icons.star, color: Colors.amber),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('4.5',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            )),
                        SizedBox(
                          width: 12,
                        ),
                        Text('128 reviews',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.brown,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Ahmedabad',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(viewportFraction: 0.8);
    _height = Dimensions.pageViewContainer(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.brown),
                  prefixIcon: const Icon(Icons.search, color: Colors.brown),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Greeting Text and Username
              Text(
                'Hello,',
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Salsa',
                ),
              ),
              Text(
                _username,
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 18.0,
                  fontFamily: 'Salsa',
                ),
              ),

              SizedBox(height: 16.0),

              Container(height: 70.0,
                margin: EdgeInsets.only(bottom: 30),
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          image: DecorationImage(
                            image: AssetImage('assets/photo$index.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              Container(
                height: 360,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: Text(
                        'Popular:',
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 18.0,
                          fontFamily: 'Salsa',
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(
                      height: 300, // Limiting the height of the PageView
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: 7,
                        itemBuilder: (context, position) {
                          if (position == 6) {
                            // If it's the last item, return the "More" button
                            return Stack(
                              children: [
                                _buildPageItem(position), // Render the last card
                                Align(alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Text('More'), // Render the "More" button
                                  ),
                                ),
                              ],
                            );
                          } else {
                            // Otherwise, render the regular card
                            return _buildPageItem(position);
                          }
                        },
                      ),
                    ),

                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.brown,
                        thickness: 2.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Explore',
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Salsa',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.brown,
                        thickness: 2.0,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: 150.0,
                child: PageView.builder(
                  controller: PageController(
                    initialPage: 1, // Start from the second item
                    viewportFraction: 0.3,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the desired page
                        // You can replace thiswith your navigation logic
                        print('Card $index tapped!');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 8.0,
                        margin: EdgeInsets.symmetric(
                            horizontal:
                            5.0), // Adjust margin between cards if needed
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: DecorationImage(
                              image: AssetImage('assets/city$index.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // SizedBox(height: 8),
              // SingleChildScrollView(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text('Agra'),
              //       SizedBox(width: 20),
              //       Text('Ahmedabad'),
              //       SizedBox(width: 20),
              //       Text('Mumbai'),
              //       SizedBox(width: 20),
              //       Text('Kolkata'),
              //       SizedBox(width: 20),
              //       Text('Delhi'),
              //       SizedBox(width: 20),
              //       Text('Pune'),
              //       SizedBox(width: 20),
              //       Text('Hyderabad'),
              //       SizedBox(width: 20),
              //       Text('Chennai'),
              //       SizedBox(width: 20),
              //       Text('Jaipur'),
              //       SizedBox(width: 20),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
        bottomNavigationBar: BottomNavBar(
          onHomePressed: () {
            // Handle home button pressed
          },
          onSearchPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => propertyList()));
          },
          onAddPropertyPressed: () {
               Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddPropertyPage(onPropertyAdded: (Property ) {  },)));
            // Handle add property button pressed
          },
          onInboxPressed: () {
           
          },
          onProfilePressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
            // Handle profile button pressed
          },
        )
    );
  }

  Future<void> _getUsername() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
       // _username = user.displayName ?? '';
        _username = 'Dashang';
      });
    } else {
      // If the user is not signed in, set _username to an empty string or handle the case as needed
      setState(() {
        _username = 'Dashang';

      });
    }
    print('\n\n\n\n$_username');
  }
}

class Dimensions {
  static double pageViewContainer(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.6;
  }

  static double pageViewTextContainer(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.15;
  }
}