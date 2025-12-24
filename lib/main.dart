import 'package:flutter/material.dart';
import 'package:one_roof/screens/choose_role_screen.dart';
import 'package:one_roof/screens/onboarding_screen.dart';
import 'package:one_roof/screens/signin_screen.dart';
import 'package:one_roof/screens/signup_screen.dart';
import 'package:one_roof/screens/splash_screen.dart';
import 'package:one_roof/screens/welcome_screen.dart';
// import 'splash_screen.dart';
// import 'onboarding_screen.dart';
// import 'welcome_screen.dart';
// import 'signup_screen.dart';
// import 'signin_screen.dart';
// import 'choose_role_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/signup': (context) => SignUpScreen(),
        '/signin': (context) => SignInScreen(),
        '/choose_role': (context) => ChooseRoleScreen(),
      },
    );
  }
}
