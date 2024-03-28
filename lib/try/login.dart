import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dashang1/home.dart';
import 'package:dashang1/try/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
   final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

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

          // Positioned Text (Login)
          Positioned(
            top: 40.0, // Adjust the top position as needed
            left: 16.0,
            child: Text(
              'Login',
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
                      controller: emailController,
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
                    SizedBox(height: 10.0),
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
                    SizedBox(height: 20.0),

                    // Round Login button with brown background
                    ElevatedButton(
                      onPressed: () {
                        login();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => HomePage()),
                        // );
                        // Handle login logic
                      },
                      child: Text(
                        'Login',
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

                    // Center-aligned Don't have an account? Sign up
                    SizedBox(height: 10.0),
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
                            text: 'Dont have an account? ',
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'SignUp',
                                style: TextStyle(
                                  color: brownColor,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Perform the onTap operation (e.g., navigate to the login screen)
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const SignUp()),
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

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text.toString())
        .then((value) {
           Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );

     // Utils().toastMessage(value.user!.email.toString());
      // Get.toNamed('/Home');
       setState(() {
       loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
     // Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }
}
