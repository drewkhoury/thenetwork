import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thenetworkapp/shared/shared.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.circleUser,
              color: Colors.pink[200],
            ),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          )
        ],
      ),
      body: const Center(
        child: Text("Welcome to The Network."),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
