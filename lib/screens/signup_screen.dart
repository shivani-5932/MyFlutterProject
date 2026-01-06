import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agree = false;

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
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Let’s create account",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 32),

              /// FULL NAME
              customTextField("Full Name"),

              const SizedBox(height: 16),

              /// EMAIL
              customTextField("Email Address"),

              const SizedBox(height: 16),

              /// MOBILE
              customTextField("Mobile number", keyboard: TextInputType.phone),

              const SizedBox(height: 16),

              /// PASSWORD
              customTextField(
                "Create password",
                obscure: true,
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
                  )
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
                    // signup logic
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

              const SizedBox(height: 16),

              const Text("or"),

              const SizedBox(height: 16),

              /// GOOGLE BUTTON
              OutlinedButton.icon(
                onPressed: () {
                  // google auth
                },
                icon: Image.asset(
                  'assets/images/google.png',
                  height: 22,
                ),
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// REUSABLE TEXTFIELD
  Widget customTextField(
      String hint, {
        bool obscure = false,
        TextInputType keyboard = TextInputType.text,
      }) {
    return TextField(
      obscureText: obscure,
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
