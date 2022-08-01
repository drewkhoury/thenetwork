import 'package:thenetworkapp/about/about.dart';
import 'package:thenetworkapp/profile/profile.dart';
import 'package:thenetworkapp/login/login.dart';
import 'package:thenetworkapp/entry/entry.dart';
import 'package:thenetworkapp/home/home.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/entry': (context) => const EntryScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
