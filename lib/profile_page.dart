import 'dart:io';
import 'package:dashang1/Aboutus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import 'EditProperty.dart';

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? _image;

  get userProperty => Property(
    imageFiles: [File('path/to/image')],
    title: 'Sample Property',
    location: 'Sample Location',
    price: '100000',
    amenities: {'Wi-Fi', 'Parking'},
    distance: '5 km',
    date: DateTime.now(),
    type: 'House',
    houseCategory: 'Apartment',
    pinCode: '123456',
    address: 'Sample Address',
    area: '1000 sqft',
    propertyRules: ['No pets allowed', 'No smoking'],
  );
  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery); // or ImageSource.camera for taking a new photo
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EDE9),
      appBar: AppBar(
        title: Text(
          'Your Profile',
          style: TextStyle(
            color: Colors.brown,
            fontFamily: 'Salsa',
            fontSize: 30,
          ),
        ),
        backgroundColor: Color(0xFFF1EDE9),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    backgroundImage: _image != null ? FileImage(File(_image!.path)) as ImageProvider<Object> : AssetImage("assets/profile.jpeg"),
                  ),
                ),
                Positioned(
                  top: -10, // Adjust this value to position the icon as desired
                  right: -10, // Adjust this value to position the icon as desired
                  child: IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {
                      _getImage();
                    },
                  ),
                ),
                if (_image != null)
                  Positioned(
                    top: -10, // Adjust this value to position the icon as desired
                    left: -10, // Adjust this value to position the icon as desired
                    child: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        setState(() {
                          _image = null;
                        });
                      },
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "John Doe", // Replace with user's name
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Your Email: user@example.com", // Replace with user's email
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Divider(),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Preferred Destination',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            buildPropertyCard(), // User's listed property card
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Assuming you have a property object named 'userProperty'
                // Replace 'userProperty' with your actual property object
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditPropertyPage(property: userProperty)),
                );
              },
              child: Text(
                'Edit Property',
                style: TextStyle(
                  color: Color(0xFFF1EDE9),
                  // fontFamily: 'Salsa',
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown, // Set the brown background color
                elevation: 8.0, // Adjust the elevation to make the button raised
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Make the button round
                ),
              ),
            ),

            const SizedBox(height: 20),
            buildProfileMenuList([
              ProfileMenuItem(
                text: "About Us",
                icon: Icons.help_outline,
                press: (item) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()),
                  );
                },
                color: Colors.brown,
                subtitle: "Get to know us",
              ),
              ProfileMenuItem(
                text: "Log Out",
                icon: Icons.logout,
                press: (item) {
                  print("${item.text} pressed");
                },
                color: Colors.brown,
              ),

            ]),
          ],
        ),
      ),
    );
  }


  Widget buildPropertyCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Property:",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 8.0,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Property Image
                Container(
                  height: 150, // Adjust the height as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: AssetImage('assets/photo0.jpg'), // Replace with user's property image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Property Name", // Replace with user's property name
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Address: 123 Main St, City", // Replace with user's property address
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "details: 2 bedrooms, 1 kitchen, with balcony", // Replace with user's property price
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }



  Widget buildProfileMenuList(List<ProfileMenuItem> menuItems) {
    return Column(
      children: menuItems.map((item) => ProfileMenu(item: item)).toList(),
    );
  }
}

class ProfileMenuItem {
  final String text;
  final IconData icon;
  final VoidCallbackWithItem press;
  final Color? color;
  final String? subtitle;

  ProfileMenuItem({
    required this.text,
    required this.icon,
    required this.press,
    this.color,
    this.subtitle,
  });
}

class ProfileMenu extends StatelessWidget {
  final ProfileMenuItem item;

  const ProfileMenu({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.text),
      subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
      leading: Icon(item.icon, color: item.color),
      onTap: () => item.press(item),
    );
  }
}

typedef VoidCallbackWithItem = void Function(ProfileMenuItem);