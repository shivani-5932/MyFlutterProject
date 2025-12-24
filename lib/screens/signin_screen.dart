import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              /// LOGO + APP NAME
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/home_image.png',
                    height: 40,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'One Roof',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFF28B82),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// SIGN IN TITLE
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 35),

              /// EMAIL
              _inputField('Email Address'),

              /// PASSWORD
              _passwordField(),

              /// FORGOT PASSWORD
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFFFF8C94),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// SIGN IN BUTTON
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFFB199),
                      Color(0xFFFF8C94),
                    ],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/choose_role');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              /// SIGN UP REDIRECT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text("Don't have an account ? "),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/signup');
                    },
                  child:Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xFFFF8C94),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// GOOGLE SIGN IN
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png',
                      height: 24,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Continue with Google',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  /// NORMAL INPUT
  Widget _inputField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  /// PASSWORD FIELD
  Widget _passwordField() {
    return TextField(
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword
                ? Icons.visibility_off
                : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
    );
  }
}
