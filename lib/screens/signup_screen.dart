import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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

              const SizedBox(height: 30),

              /// SIGN UP TITLE
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              _inputField('Full Name'),
              _inputField('Email Address'),
              _inputField('Mobile Number'),

              _passwordField(
                'Password',
                _obscurePassword,
                    () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),

              _passwordField(
                'Confirm Password',
                _obscureConfirmPassword,
                    () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),

              const SizedBox(height: 25),

              /// SIGN UP BUTTON
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
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// LOGIN TEXT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text('Already have an account ? '),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/signin');
                    },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFFFF8C94),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

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

  /// NORMAL INPUT FIELD
  Widget _inputField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
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
  Widget _passwordField(
      String hint, bool obscure, VoidCallback toggle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: toggle,
          ),
        ),
      ),
    );
  }
}
