import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:one_roof/screens/services/auth_service.dart';
import 'package:one_roof/screens/services/google_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final AuthService _authService = AuthService();

class _SignUpScreenState extends State<SignUpScreen> {
  bool agree = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16), // ✅ 16px padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),

              /// TOP ILLUSTRATION
              Image.asset(
                'assets/images/signup_top.png',
                height: 140,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 16),

              /// TITLE
              const Text(
                "Get Started",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 6),

              const Text(
                "Let’s create account",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 32),

              /// FULL NAME
              customTextField("Full Name", controller: nameController),

              const SizedBox(height: 16),

              /// EMAIL
              customTextField("Email Address", controller: emailController),

              const SizedBox(height: 16),

              /// MOBILE
              customTextField(
                "Mobile number",
                keyboard: TextInputType.phone,
                controller: phoneController,
              ),

              const SizedBox(height: 16),

              /// PASSWORD
              customTextField(
                "Create password",
                obscure: true,
                controller: passwordController,
              ),

              const SizedBox(height: 12),

              /// CONFIRM PASSWORD
              customTextField(
                "Confirm password",
                obscure: true,
                controller: confirmPasswordController,
              ),

              const SizedBox(height: 12),

              /// TERMS CHECKBOX
              Row(
                children: [
                  Checkbox(
                    value: agree,
                    activeColor: const Color(0xFFFF6F61),
                    onChanged: (value) {
                      setState(() => agree = value!);
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        text: "Agree to our ",
                        style: TextStyle(color: Colors.black54),
                        children: [
                          TextSpan(
                            text: "Terms and Conditions.",
                            style: TextStyle(
                              color: Color(0xFFFF6F61),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// SIGN IN BUTTON
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    if (!agree) return;
                    signupUser(); // ✅ backend connected
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB3A7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Text("or"),

              const SizedBox(height: 16),

              /// GOOGLE BUTTON
              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton.icon(
                  onPressed: () async {
                    final user = await GoogleAuthService.signInWithGoogle();
                    if (user != null) {
                      Navigator.pushReplacementNamed(context, '/choose_role');
                    }
                  },
                  icon: Image.asset('assets/images/google.png', height: 22),
                  label: const Text(
                    "Continue with Google",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 54),
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// LOGIN TEXT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have account ? "),
                  GestureDetector(
                    onTap: () {
                      // navigate to login
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xFFFF6F61),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signupUser() async {
    if (!agree) return;

    if (passwordController.text.trim().length < 6) {
      Get.snackbar("Weak Password", "Password must be at least 6 characters");
      return;
    }

    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    try {
      await _authService.signup(
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
      );

      Navigator.pushReplacementNamed(context, '/choose_role');
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Signup Failed", e.message ?? e.code);
    }
  }

  /// REUSABLE TEXTFIELD
  Widget customTextField(
    String hint, {
    bool obscure = false,
    TextInputType keyboard = TextInputType.text,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFFFC1B6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFFF6F61)),
        ),
      ),
    );
  }
}
