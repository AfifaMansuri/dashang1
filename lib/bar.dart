import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Function() onHomePressed;
  final Function() onSearchPressed;
  final Function() onAddPropertyPressed;
  final Function() onInboxPressed;
  final Function() onProfilePressed;

  const BottomNavBar({
    required this.onHomePressed,
    required this.onSearchPressed,
    required this.onAddPropertyPressed,
    required this.onInboxPressed,
    required this.onProfilePressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFFF1EDE9),
      elevation: 0,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 20.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButton(Icons.home_outlined, onHomePressed),
            _buildButton(Icons.search_outlined, onSearchPressed),
            _buildButton(Icons.add_outlined, onAddPropertyPressed),
            _buildButton(Icons.message_outlined, onInboxPressed),
            _buildButton(Icons.person_outlined, onProfilePressed),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, Function() onPressed) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(
          icon,
          size: 30.0,
          color: Colors.brown,
        ),
      ),
    );
  }
}