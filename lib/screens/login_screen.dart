import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              /// BACK
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const SizedBox(height: 8),

              /// TOP ILLUSTRATION
              Image.asset(
                'assets/images/signup_top.png',
                height: 140,
              ),

              const SizedBox(height: 24),

              /// TITLE
              const Text(
                "Welcome Back !",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Sign in to access your account",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 32),

              /// EMAIL
              _inputField(
                controller: emailController,
                hint: "Enter your email id",
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              /// PASSWORD
              _inputField(
                controller: passwordController,
                hint: "Password",
                isPassword: true,
              ),

              const SizedBox(height: 12),

              /// REMEMBER + FORGOT
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    activeColor: const Color(0xFFFF6F61),
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value ?? false;
                      });
                    },
                  ),
                  const Text("Remember me"),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // forgot password
                      Navigator.pushReplacementNamed(context, '/forgotPassword');

                    },
                    child: const Text(
                      "Forgot password ?",
                      style: TextStyle(
                        color: Color(0xFFFF6F61),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// SIGN IN BUTTON
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    // login logic
                    Navigator.pushReplacementNamed(context, '/choose_role');

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB3A7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text("or"),

              const SizedBox(height: 16),

              /// GOOGLE SIGN IN
              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // google sign in
                  },
                  icon: Image.asset(
                    'assets/images/google.png',
                    height: 22,
                  ),
                  label: const Text(
                    "Continue with Google",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: const BorderSide(color: Colors.black12),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// SIGN UP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account ? "),
                  GestureDetector(
                    onTap: () {
                      // navigate to signup
                      Navigator.pushReplacementNamed(context, '/signup');

                    },
                    child: const Text(
                      "Sign up",
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

  /// COMMON INPUT FIELD
  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xFFFFC1B6),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xFFFF6F61),
            width: 2,
          ),
        ),
      ),
    );
  }
}
