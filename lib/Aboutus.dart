import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFFF1EDE9),
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(
            color: Colors.brown,
            fontFamily: 'Salsa',
            fontSize: 30,
          ),
        ),
        backgroundColor: Color(0xFFF1EDE9) ,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Welcome to Swap It!',
            //   style: TextStyle(
            //     color: Colors.brown,
            //     fontSize: 15.0,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            Container(
              height: 150,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/welcome.jpeg'),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'At Swap It, we believe in the transformative power of home exchange. Our mission is to connect people through affordable and authentic travel experiences. With Swap It, explore new destinations, immerse yourself in diverse cultures, and create unforgettable memories.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 24.0),
            Text(
              'Why Choose Swap It?',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.monetization_on, color: Colors.brown),
              title: Text(
                'Save money on accommodation',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_city, color: Colors.brown),
              title: Text(
                'Live like a local',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.eco, color: Colors.brown),
              title: Text(
                'Promote sustainable travel',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.card_travel, color: Colors.brown),
              title: Text(
                'Enjoy variety and flexibility',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Join Our Community',
              style: TextStyle(
                fontSize: 20.0,

                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Swap It is more than just a home exchange platform; it\'s a community of passionate travelers eager to share their homes and experiences. Join our online forums, connect with fellow travelers, and get inspired for your next adventure!',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 24.0),
            Text(
              'Your Journey Awaits',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color : Colors.brown,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'With Swap It, the world is your oyster. Explore new destinations, embrace diverse cultures, and create unforgettable memories. Sign up today and start planning your next home exchange adventure!',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),

            Text(
              'Contact us:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 16.0),
            Icon(Icons.mail,color: Colors.brown,),
            Text(
              'swaphome02@gmail.com',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutUsPage(),
  ));
}