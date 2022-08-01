import 'package:flutter/material.dart';
import 'package:thenetworkapp/login/login.dart';
import 'package:thenetworkapp/services/auth.dart';
import 'package:thenetworkapp/shared/shared.dart';
import 'package:thenetworkapp/entry/entry.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: ErrorMessage(),
          );
        } else if (snapshot.hasData) {
          return const EntryScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
