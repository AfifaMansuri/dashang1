import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'DetailPage.dart';

class propertyList extends StatefulWidget {
  @override
  State<propertyList> createState() => _propertyListState();
}

var price;
//var area;
var address;
//var houseCategory;
var location;
var name;
//var type;
var pinCode;

class _propertyListState extends State<propertyList> {
  @override
  Widget build(BuildContext context) {
    // var price;
    // //var area;
    // var address;
    // //var houseCategory;
    // var location;
    // var name;
    // //var type;
    // var pinCode;
    Color doubledark = Color(0xFF201B16);
    Color darkbeige = Color(0xFFB1A897);
    Color lightbeige = Color(0xFFF1EDE9);

    return Scaffold(
      backgroundColor: lightbeige,
      appBar: AppBar(
        backgroundColor: lightbeige,
        title: Text(
          'Search Listings',
          style: TextStyle(
            color: Colors.brown,
            fontSize: 23.0,
            fontFamily: 'Salsa',
          ),
        ),
      ),
      body: FutureBuilder(
        // Assume you have a Firebase collection called 'carousel_items'
        future: FirebaseFirestore.instance.collection('properties').get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<DocumentSnapshot> data = snapshot.data!.docs;
            print("data my" + data.toString());

            return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length.toInt(),
                            itemBuilder: (context, index) {
                              address = data[index].get('address');
                              print("address"+address);
                              //area = data[index].get('area');
                             // houseCategory = data[index].get('houseCategory');
                              location = data[index].get('location');
                              print("location"+location);
                              pinCode = data[index].get('pinCode');
                              print("poincode"+pinCode);
                              price = data[index].get('price');
                              print("price"+price);
                              name = data[index].get('title');
                              print("name"+name);
                             // type = data[index].get('type');
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.asset(
                                        'widget.property.imageUrls[index]',
                                        width: 350, // Adjust width as needed
                                        height: 300,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(5, (index) {
                                      return Icon(Icons.star,
                                          color: Colors.amber, size: 20);
                                    }),
                                  ),
                                  SizedBox(height: 16),
                                  // Text(widget.property.details,
                                  //     style: TextStyle(
                                  //         fontSize: 18,
                                  //         fontWeight: FontWeight.bold,
                                  //         color: Colors.brown)),
                                  Text(price.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.brown)),
                                  SizedBox(height: 16),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                       // Text(houseCategory),
                                        Text(address.toString()),
                                        Text('${location}, ${pinCode}'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  // for (var amenity in widget.property.amenities)
                                  //   Container(
                                  //     padding: EdgeInsets.all(8),
                                  //     child: Row(
                                  //       children: [
                                  //         Icon(Icons.bolt_rounded,
                                  //             color: Colors.brown),
                                  //         SizedBox(width: 8),
                                  // //         Text(amenity),
                                  //       ],
                                  //     ),
                                  //   ),
                                  SizedBox(height: 16),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Property Details:',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.brown)),
                                        SizedBox(height: 8),
                                        //Text(details),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        // _showDateDialog(context);
                                      },
                                      child: Text(
                                        'Book',
                                        style: TextStyle(
                                          color: lightbeige,
                                          fontFamily: 'Salsa',
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .brown, // Set the brown background color
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
                              );
                            }))
                  ]

                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Row(
                  //         children: List.generate(5, (index) {
                  //           return Icon(Icons.star, color: Colors.amber, size: 20);
                  //         }),
                  //       ),
                  //       SizedBox(height: 16),
                  //       // Text(widget.property.details,
                  //       //     style: TextStyle(
                  //       //         fontSize: 18,
                  //       //         fontWeight: FontWeight.bold,
                  //       //         color: Colors.brown)),
                  //       // Text(price.toString(),
                  //       //     style: TextStyle(
                  //       //         fontSize: 18,
                  //       //         fontWeight: FontWeight.bold,
                  //       //         color: Colors.brown)),
                  //       SizedBox(height: 16),
                  //       Container(
                  //         padding: EdgeInsets.all(8),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             //Text(houseCategory),
                  //             Text(address.toString()),
                  //             //  Text(
                  //             //      '${location}, ${pinCode}'),
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(height: 16),
                  //       // for (var amenity in widget.property.amenities)
                  //       //   Container(
                  //       //     padding: EdgeInsets.all(8),
                  //       //     child: Row(
                  //       //       children: [
                  //       //         Icon(Icons.bolt_rounded, color: Colors.brown),
                  //       //         SizedBox(width: 8),
                  //       //         Text(amenity),
                  //       //       ],
                  //       //     ),
                  //       //   ),
                  //       SizedBox(height: 16),
                  //       Container(
                  //         padding: EdgeInsets.all(8),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text('Property Details:',
                  //                 style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.brown)),
                  //             SizedBox(height: 8),
                  //             //Text(details),
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(height: 16),
                  //       Container(
                  //         padding: EdgeInsets.all(8),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text('Property Rules:',
                  //                 style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.brown)),
                  //             SizedBox(height: 8),
                  //             //Text(widget.property.propertyRules),
                  //           ],
                  //         ),
                  //       ),
                  //       Center(
                  //         child: ElevatedButton(
                  //           onPressed: () {
                  //            // _showDateDialog(context);
                  //           },
                  //           child: Text(
                  //             'Book',
                  //             style: TextStyle(
                  //               color: lightbeige,
                  //               fontFamily: 'Salsa',
                  //             ),
                  //           ),
                  //           style: ElevatedButton.styleFrom(
                  //             backgroundColor:
                  //                 Colors.brown, // Set the brown background color
                  //             elevation:
                  //                 8.0, // Adjust the elevation to make the button raised
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(
                  //                   12.0), // Make the button round
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  ),
            );
          }
        },
      ),
    );
  }

  Widget _buildListing(
    String assetImagePath,
    String location,
    String price,
    String distance,
    String rating,
    BuildContext context, // Add the BuildContext parameter
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PropertyDetailScreen(
              property: _getProperty(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFFF1EDE9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3.0,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Color(0xFFF1EDE9),
              offset: Offset(-5, 0),
            ),
            BoxShadow(
              color: Color(0xFFF1EDE9),
              offset: Offset(5, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                assetImagePath,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(location),
                  Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(distance)),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(rating),
                  ),
                  Icon(Icons.star_rounded, size: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Property _getProperty() {
    return Property(
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
      propertyRules: ' - No loud music after 10 PM\n - No smoking indoors',
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: propertyList(),
  ));
}
