import 'package:dashang1/EditProperty.dart';
import 'package:dashang1/propertyList.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dashang1/firebase_options.dart';
import 'package:dashang1/try/signup.dart';



Future<void> main() async {
 // Initialize Firebase
WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.ltr, // Set appropriate text direction
        child: SignUp(),

      ),
    ),
  );
}

// class OnBoarding extends StatefulWidget {
//   @override
//   _OnBoardingState createState() => _OnBoardingState();
// }

// class _OnBoardingState extends State<OnBoarding> {
//   int currentIndex = 0;
//   late PageController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = PageController(initialPage: 0);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Define the custom colors
//     Color backgroundColor = Color(0xFF201B16);
//     Color cardColor = Color(0xFFB1A897);
//     Color fieldColor = Color(0xFFF1EDE9);
//     Color brownColor = Colors.brown; // Define the brown color

//     return Scaffold(
//       backgroundColor: Color(0xFFEFE9DD), // Set the background color
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               controller: _controller,
//               itemCount: contents.length,
//               onPageChanged: (int index) {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//               itemBuilder: (_, i) {
//                 return Padding(
//                   padding: const EdgeInsets.all(40),
//                   child: Column(
//                     children: [
//                       Image.asset(
//                         contents[i].image,
//                         height: 300,
//                       ),
//                       Text(
//                         contents[i].title,
//                         style: TextStyle(
//                           color: Colors.brown,
//                           fontSize: 35,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Salsa',
//                         ),
//                       ),
//                       SizedBox(height: 20.0),
//                       Text(
//                         contents[i].description,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.brown,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 contents.length,
//                     (index) => buildDot(index, context),
//               ),
//             ),
//           ),
//           Container(
//             height: 60,
//             margin: EdgeInsets.all(40),
//             width: double.infinity,
//             child: TextButton(
//               onPressed: () {
//                 if (currentIndex == contents.length - 1) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => SignupPage(),
//                     ),
//                   );
//                 } else {
//                   _controller.nextPage(
//                     duration: Duration(milliseconds: 100),
//                     curve: Curves.bounceIn,
//                   );
//                 }
//               },
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.brown),
//                 foregroundColor: MaterialStateProperty.all(Colors.white),
//                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 ),
//               ),
//               child: Text(currentIndex == contents.length - 1 ? 'Get Started!' : 'Next'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildDot(int index, BuildContext context) {
//     return Container(
//       height: 10,
//       width: currentIndex == index ? 25 : 10,
//       margin: EdgeInsets.only(right: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.0),
//         color: Colors.brown,
//       ),
//     );
//   }
// }