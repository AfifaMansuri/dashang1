import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashang1/propertyList.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Property {
  final List<File> imageFiles;
  final String title;
  final String location;
  final String price;
  final Set<String> amenities;
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

class EditPropertyPage extends StatefulWidget {
  final Property property;

  EditPropertyPage({required this.property});

  @override
  _EditPropertyPageState createState() => _EditPropertyPageState();
}

class _EditPropertyPageState extends State<EditPropertyPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  bool loading = false;
  Set<String> _amenities = {};
  List<File> _imageFiles = [];
  List<String> _propertyRules = [];
  DateTime _selectedDate = DateTime.now();
  String _propertyType = 'Swap';
  String _houseCategory = 'House';

  @override
  void initState() {
    super.initState();
    _initForm();
  }

  void _initForm() {
    _titleController.text = widget.property.title;
    _locationController.text = widget.property.location;
    _priceController.text = widget.property.price;
    _pinCodeController.text = widget.property.pinCode;
    _addressController.text = widget.property.address;
    _areaController.text = widget.property.area;
    _amenities = widget.property.amenities;
    _imageFiles = List.from(widget.property.imageFiles);
    _selectedDate = widget.property.date;
    _propertyType = widget.property.type;
    _houseCategory = widget.property.houseCategory;
  }

  Future<void> _getImages() async {
    final pickedFiles = await ImagePicker().pickMultiImage();

    setState(() {
      if (pickedFiles != null) {
        _imageFiles = pickedFiles.map((file) => File(file.path)).toList();
      }
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EDE9),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1EDE9),
        title: Text(
          'Edit your property',
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
                Column(
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
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _getImages,
                  child: Text(
                    'Change Images',
                    style: TextStyle(
                      color: Color(0xFFF1EDE9),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a location';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(labelText: 'Price'),
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
                  decoration: InputDecoration(labelText: 'Pin Code'),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _areaController,
                  decoration: InputDecoration(labelText: 'Area'),
                ),
                SizedBox(height: 16),
                Wrap(
                  children: [
                    Text(
                      'Select Amenities:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
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
                    ]
                        .map((amenity) => FilterChip(
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
                            ))
                        .toList(),
                  ],
                ),
                // SizedBox(height: 16),
                // DropdownButtonFormField<String>(
                //   value: _propertyType,
                //   onChanged: (value) {
                //     setState(() {
                //       _propertyType = value!;
                //     });
                //   },
                //   items: ['Swap', 'Rent', 'Both']
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   decoration: InputDecoration(labelText: 'Property Type'),
                // ),
                // SizedBox(height: 16),
                // DropdownButtonFormField<String>(
                //   value: _houseCategory,
                //   onChanged: (value) {
                //     setState(() {
                //       _houseCategory = value!;
                //     });
                //   },
                //   items: [
                //     'House',
                //     'Apartment/Condo',
                //     'Villa',
                //     'Heritage Home',
                //     'Farm'
                //   ].map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   decoration: InputDecoration(labelText: 'House Category'),
                // ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _saveChanges();
                    }
                  },
                  child: Text(
                    'Save changes',
                    style: TextStyle(
                      color: Color(0xFFF1EDE9),
                      fontFamily: 'Salsa',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveChanges() {
    final property = Property(
      imageFiles: _imageFiles,
      title: _titleController.text,
      location: _locationController.text,
      price: _priceController.text,
      amenities: _amenities,
      distance: '',
      date: _selectedDate,
      type: _propertyType,
      houseCategory: _houseCategory,
      pinCode: _pinCodeController.text,
      address: _addressController.text,
      area: _areaController.text,
      propertyRules: _propertyRules,
    );

    // Send the updated property back

    print(property);

    Navigator.pop(context);
  }

  
void editProperty() {
  setState(() {
    loading = true;
  });

  FirebaseFirestore.instance
      .collection('properties')
      .doc() // Specify the document ID of the property to edit
      .update({
        'name': _titleController.text.toString(),
        'location': _locationController.text.toString(),
        'Price': _priceController.text.toString(),
        'pincode': _pinCodeController.text.toString(),
        'address': _addressController.text.toString(),
        // Additional user information here
      })
      .then((value) {
        print("Data updated successfully");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => propertyList()),
        );
        setState(() {
           loading = false;
        });
      })
      .catchError((error) {
        print("Error updating Firestore data: $error");
        setState(() {
          loading = false;
        });
      });
}


}
