import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashang1/DetailPage.dart';
import 'package:dashang1/propertyList.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: AddPropertyPage(onPropertyAdded: (Property) {}),
  ));
}

class Property {
  final List<File> imageFiles;
  final String title;
  final String location;
  final String price;
  final String amenities;
  final String distance;
  final DateTime date;
  final String type;
  final String houseCategory;
  final String pinCode;
  final String address;
  final String area;
  final List<String> propertyRules;

  Property({
    required this.imageFiles,
    required this.title,
    required this.location,
    required this.price,
    required this.amenities,
    required this.distance,
    required this.date,
    required this.type,
    required this.houseCategory,
    required this.pinCode,
    required this.address,
    required this.area,
    required this.propertyRules,
  });
}

class AddPropertyPage extends StatefulWidget {
  final Function(Property) onPropertyAdded;

  AddPropertyPage({required this.onPropertyAdded});

  @override
  _AddPropertyPageState createState() => _AddPropertyPageState();
}

class _AddPropertyPageState extends State<AddPropertyPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  bool loading = false;
  List<String> _amenities = [];
  List<String> _propertyRules = [];
  DateTime _selectedDate = DateTime.now();
  List<File> _imageFiles = [];
  String _propertyType = 'Swap';
  String _houseCategory = 'House'; // Default value for house category dropdown

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _getImages() async {
    final pickedFiles = await ImagePicker()
        .pickMultiImage(); // Use pickMultiImage instead of pickImage

    setState(() {
      if (pickedFiles != null) {
        _imageFiles = pickedFiles.map((file) => File(file.path)).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EDE9),
        appBar: AppBar(
          backgroundColor: Color(0xFFF1EDE9),
          title: Text(
            'Add Property',
            style: TextStyle(
              color: Colors.brown,
              fontSize: 23.0,
              fontFamily: 'Salsa',
            ),
          ),
        ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _imageFiles.isNotEmpty
                    ? Column(
                  children: _imageFiles.map((file) {
                    return Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: FileImage(file),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              setState(() {
                                _imageFiles.remove(file);
                              });
                            },
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                )
                    : Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.brown[200],
                  ),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 40,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _getImages,
                  child: Text(
                    'Add images',
                    style: TextStyle(
                      color: Color(0xFFF1EDE9),
                      fontFamily: 'Salsa',
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
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _propertyType,
                  onChanged: (value) {
                    setState(() {
                      _propertyType = value!;
                    });
                  },
                  items: ['Swap', 'Rent', 'Both']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'Property Type'),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _houseCategory,
                  onChanged: (value) {
                    setState(() {
                      _houseCategory = value!;
                    });
                  },
                  items: ['House', 'Apartment/Condo', 'Villa', 'Heritage Home', 'Farm house']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'House Category'),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a price';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _pinCodeController,
                  decoration: InputDecoration(
                    labelText: 'Pin Code',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _areaController,
                  decoration: InputDecoration(
                    labelText: 'Area',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    labelText: 'Rules',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter location details';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Wrap(
                  children: [
                    Text(
                      'Select Amenities you provide:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 30,height: 20,),
                    ...[
                      'Wi-Fi',
                      'Parking',
                      'Gym',
                      'Pool',
                      'Security',
                      'Power Backup',
                      'Dishwasher',
                      'Laundry',
                      'Garden'
                    ].map((amenity) {
                      return FilterChip(
                        label: Text(amenity),
                        selected: _amenities.contains(amenity),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _amenities.add(amenity);
                            } else {
                              _amenities.remove(amenity);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _amenities.isNotEmpty) {
                      addProperty();
                    }
                  },
                  child: Text(
                    'Add Property',
                    style: TextStyle(
                      color: Color(0xFFF1EDE9),
                      fontFamily: 'Salsa',
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
                SizedBox(height: 16),
                // ElevatedButton(
                //   onPressed: () => _selectDate(context),
                //   child: Text('Select Date'),
                // ),
                // SizedBox(height: 16),
                // Text(
                //   'Selected Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void _addProperty() {
  //   final property = Property(
  //     imageFiles: _imageFiles,
  //     title: _titleController.text,
  //     location: _locationController.text,
  //     price: _priceController.text,
  //     amenities: _amenities,
  //     distance: "",
  //     date: _selectedDate,
  //     type: _propertyType,
  //     houseCategory: _houseCategory,
  //     pinCode: _pinCodeController.text,
  //     address: _addressController.text,
  //     area: _areaController.text,
  //     propertyRules: _propertyRules,
  //   );
 

// void _addProperty() async {
  // final property = Property(
  //   imageFiles: _imageFiles,
  //   title: _titleController.text,
  //   location: _locationController.text,
  //   price: _priceController.text,
  //   amenities: "", // Convert set to list
  //   distance: "", // You can set this value as per your requirements
  //   date: _selectedDate,
  //   type: _propertyType,
  //   houseCategory: _houseCategory,
  //   pinCode: _pinCodeController.text,
  //   address: _addressController.text,
  //   area: _areaController.text,
  //   propertyRules: _propertyRules,
  // );

  // Get a reference to the Firestore database
//   final firestore = FirebaseFirestore.instance;

//   // Add the property data to Firestore
//   try {
//     await firestore.collection('properties').add({
//       'title': property.title,
//       'location': property.location,
//       'price': property.price,
//       'amenities': property.amenities,
//       'distance': property.distance,
//       'date': property.date,
//       'type': property.type,
//       'houseCategory': property.houseCategory,
//       'pinCode': property.pinCode,
//       'address': property.address,
//       'area': property.area,
//       'propertyRules': property.propertyRules,
//     });

//     // Call the callback function to notify that property has been added
//     widget.onPropertyAdded(property);

//     // Navigate back to the previous page
//     Navigator.pop(context);
//   } catch (e) {
//     // Handle any errors that occur during saving data to Firestore
//     print('Error adding property: $e');
//     // Optionally, you can show a snackbar or dialog to notify the user about the error
//   }
// }

//     widget.onPropertyAdded(property);

//     Navigator.pop(context);
//   }


  void addProperty() {
  setState(() {
    loading = true;
  });

  FirebaseFirestore.instance
    .collection('properties')
    .add({
        'name': _titleController.text.toString(),
        'location': _locationController.text.toString(),
        'Price': _priceController.text.toString(),
        'pincode': _pinCodeController.text.toString(),
        'address': _addressController.text.toString(),
        'amenities': _amenities.toString(),
        'rules': _propertyRules.toString(),
      // Additional user information here
    })
    .then((value) {
      print("Data saved successfully");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => propertyList()),
      );
      setState(() {
        loading = false;
      });
    })
    .catchError((error) {
      print("Error writing to Firestore: $error");
      setState(() {
        loading = false;
      });
    });
}
}


