import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dashang1/try/login.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  bool loading = false;
  
  FirebaseAuth _auth= FirebaseAuth.instance;
  //@override
 // Widget build(BuildContext context) {
 
 // Future<void> signUp(BuildContext context) async {
    // try {
    //   // Check if passwords match
    //   if (passwordController.text != confirmpasswordController.text) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('Passwords do not match')),
    //     );
    //     return;
    //   }

      // Create user with email and password
  //     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );

  //     // Store additional user data in Firestore
  //     await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
  //       'username': usernameController.text,
  //       'email': emailController.text,
  //       'password':passwordController.text,
  //       'confirm password':confirmpasswordController.text,
  //       // Add additional user data here if needed
  //     });

  //     // Navigate to home screen or wherever you want to navigate after signup
  //     //Navigator.of(context).pushReplacementNamed('/home');
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => LoginPage()),
  //     );
  //   } catch (e) {
  //     // Handle signup errors
  //     print('Signup error: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Signup failed. Please try again.')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
   
  

    // Define the custom colors
    Color backgroundColor = Color(0xFF201B16);
    Color cardColor = Color(0xFFB1A897);
    Color fieldColor = Color(0xFFF1EDE9);
    Color brownColor = Colors.brown; // Define the brown color

    return Scaffold(
      backgroundColor: Colors.white, // Set the background color

      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/signin.jpeg',
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),

          // Positioned Text (Signup)
          Positioned(
            top: 40.0, // Adjust the top position as needed
            left: 16.0,
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.brown,
                fontSize: 24.0, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
                fontFamily: 'Salsa',
              ),
            ),
          ),

          // Positioned Card
          Positioned(
            left: 16.0,
            right: 16.0,
            bottom: 0.0,
            child: Card(
              elevation: 16.0, // Adjust the elevation to make the card more raised
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                side: BorderSide.none, // Remove side borders
              ),
              color: cardColor, // Set the card color
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 55.0, // Adjust the vertical padding to increase the card height
                  horizontal: 20.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Text fields for user input with rounded corners and decreased opacity
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        filled: true,
                        fillColor: Colors.white, // Decrease opacity
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0), // Rounded corners
                        ),
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Make the text bold
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white, // Decrease opacity
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0), // Rounded corners
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white, // Decrease opacity
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0), // Rounded corners
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: confirmpasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        filled: true,
                        fillColor: Colors.white, // Decrease opacity
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0), // Rounded corners
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                
                    // Round Signup button with brown background
                    ElevatedButton(
                      onPressed: () {
                       // if(_formKey.currentState!.validate()){
                         // _auth.createUserWithEmailAndPassword(
                           // email : emailController.text.toString(),
                           // password : passwordController.text.toString());
                            signUp();
                        //}
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: fieldColor,
                          fontFamily: 'Salsa',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: brownColor, // Set the brown background color
                        elevation: 8.0, // Adjust the elevation to make the button raised
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0), // Make the button round
                        ),
                      ),
                    ),
                
                    // Center-aligned Already have an account? Login
                    const SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                       // onTap: () {
                        //   print('Login tapped');
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => LoginPage()),
                        //   );
                        // },
                        child: Text.rich(
  TextSpan(
    text: 'Already have an account? ',
    style: TextStyle(color: Colors.black),
    children: [
      TextSpan(
        text: 'Login',
        style: TextStyle(
          color: brownColor,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            // Perform the onTap operation (e.g., navigate to the login screen)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
      ),
    ],
  ),
),

                      ),
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
//   void signUp() {
//     setState(() {
//       loading = true;
//     });
//     _auth
//         .createUserWithEmailAndPassword(
//             email: emailController.text.toString(),
//             password: passwordController.text.toString())
//         .then((authResult) {
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc(authResult.user?.uid)
//           .set({
//         'name': usernameController.text.toString(),
//         'email': emailController.text.toString(),
//         'password': passwordController.text.toString(),
//         'confirmpassword': confirmpasswordController.text.toString()

//         // You may want to store additional user information here
//       }).then((value) {
//         Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => LoginPage()),
//     );
//        // Get.toNamed('/Users');

//         setState(() {
//           loading = false;
//         });
//       }).onError((error, stackTrace) {
//        // Utils().toastMessage(error.toString());
//         setState(() {
//           loading = false;
//         });
//       });
//     }).catchError((error) {
//       print("Error creating user");
//       // Handle Firebase Authentication error
//       //Utils().toastMessage("Error creating user: $error");
//       setState(() {
//         loading = false;
//       });
//     });
//   }

void signUp() {
  setState(() {
    loading = true;
  });

  _auth
      .createUserWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString())
      .then((authResult) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(authResult.user?.uid)
        .set({
          'name': usernameController.text.toString(),
          'email': emailController.text.toString(),
          'password': passwordController.text.toString(),
          'confirmpassword': confirmpasswordController.text.toString(),
          // Additional user information here
        })
        .then((value) {
          print("User created and data saved successfully");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
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
  })
  .catchError((error) {
    print("Error creating user: $error");
    setState(() {
      loading = false;
    });
  });
}

 }

  