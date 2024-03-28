import 'package:flutter/material.dart';

class Property {
  final String name;
  final List<String> imageUrls; // Change imageUrl to a list
  final String location;
  final String city;
  final String pincode;
  final String address;
  final double rating;
  final String category;
  final String details;
  final List<String> amenities;
  final String price;
  final String propertyRules;

  Property({
    required this.name,
    required this.imageUrls, // Change imageUrl to a list
    required this.location,
    required this.city,
    required this.pincode,
    required this.address,
    required this.rating,
    required this.category,
    required this.details,
    required this.amenities,
    required this.price,
    required this.propertyRules,
  });
}

class PropertyDetailScreen extends StatefulWidget {
  final Property property;

  PropertyDetailScreen({required this.property});

  @override
  _PropertyDetailScreenState createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  DateTime? _checkInDate;
  DateTime? _checkOutDate;

  @override
  Widget build(BuildContext context) {
    Color doubledark = Color(0xFF201B16);
    Color darkbeige = Color(0xFFB1A897);
    Color lightbeige = Color(0xFFF1EDE9);

    return Scaffold(
      backgroundColor: lightbeige,
      appBar: AppBar(
        title: Text(
          widget.property.name,
          style: TextStyle(color: Colors.brown, fontFamily: 'Salsa'),
        ),
        backgroundColor: lightbeige,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.property.imageUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        widget.property.imageUrls[index],
                        width: 350, // Adjust width as needed
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(Icons.star, color: Colors.amber, size: 20);
                    }),
                  ),
                  SizedBox(height: 16),
                  Text(widget.property.details,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown)),
                  Text(widget.property.price,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown)),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.property.category),
                        Text(widget.property.address),
                        Text(
                            '${widget.property.location}, ${widget.property.pincode}'),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  for (var amenity in widget.property.amenities)
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(Icons.bolt_rounded, color: Colors.brown),
                          SizedBox(width: 8),
                          Text(amenity),
                        ],
                      ),
                    ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Property Details:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown)),
                        SizedBox(height: 8),
                        Text(widget.property.details),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Property Rules:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown)),
                        SizedBox(height: 8),
                        //Text(widget.property.propertyRules),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _showDateDialog(context);
                      },
                      child: Text(
                        'Book',
                        style: TextStyle(
                          color: lightbeige,
                          fontFamily: 'Salsa',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.brown, // Set the brown background color
                        elevation:
                            8.0, // Adjust the elevation to make the button raised
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12.0), // Make the button round
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Check-in and Check-out Dates'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Check-in Date'),
                onTap: () {
                  _selectCheckInDate(context);
                },
                controller: TextEditingController(
                  text: _checkInDate != null
                      ? '${_checkInDate!.day}/${_checkInDate!.month}/${_checkInDate!.year}'
                      : '',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Check-out Date'),
                onTap: () {
                  _selectCheckOutDate(context);
                },
                controller: TextEditingController(
                  text: _checkOutDate != null
                      ? '${_checkOutDate!.day}/${_checkOutDate!.month}/${_checkOutDate!.year}'
                      : '',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add logic to handle form submission
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Your request has been sent. You will be contacted soon.'),
                  ),
                );
              },
              child: Text(
                'submit',
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
          ],
        );
      },
    );
  }

  Future<void> _selectCheckInDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (pickedDate != null && pickedDate != _checkInDate) {
      setState(() {
        _checkInDate = pickedDate;
      });
    }
  }

  Future<void> _selectCheckOutDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _checkInDate ?? DateTime.now(),
      firstDate: _checkInDate ?? DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (pickedDate != null && pickedDate != _checkOutDate) {
      setState(() {
        _checkOutDate = pickedDate;
      });
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: PropertyDetailScreen(
      property: Property(
        name: 'Hubb',
        imageUrls: [
          'assets/photo0.jpg',
          'assets/photo1.jpg',
          'assets/photo2.jpg', // Add more image paths as needed
        ],
        location: '123 Main Street',
        city: 'Example City',
        pincode: '12345',
        address: 'Beautiful neighborhood',
        rating: 4.5,
        category: 'Residential',
        details: '2 bedrooms, 1 kitchen, with balcony',
        amenities: ['Swimming Pool', 'Gym', 'Parking'],
        price: '\$300,000',
        propertyRules: 'No loud music after 10 PM\nNo smoking indoors',
      ),
    ),
  ));
}