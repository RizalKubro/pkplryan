import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shope/auth_appwrite.dart';
import 'package:pet_shope/login.dart';
import 'package:pet_shope/home.dart'; // Adjust with your home page location

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _isObscure = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUpWithEmailAndPassword() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      bool success = await AuthHelper.instance.signUpEmailPassword(email, password);

      if (success) {
        // If sign-up is successful, navigate to the home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()), // Replace Home with your homepage class
        );
        print('User berhasil sign up');
      }
    } catch (e) {
      // Handle the error during sign-up failure
      print('Sign up gagal: $e');
      // Display feedback to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up failed. Please check your details.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 40, bottom: 70, left: 20, right: 20),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/1.png",
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10),
            Column(
              children: <Widget>[
                Text(
                  "Sign Up",
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Daftar sekarang untuk masuk ke",
                  style: GoogleFonts.lato(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 2),
                Text(
                  "aplikasi PetShop",
                  style: GoogleFonts.lato(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.only(left: 1), // Adjust padding
                  child: Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      Text('Setuju dengan persyaratan yang ada'),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _signUpWithEmailAndPassword,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 156),
                    backgroundColor: Color.fromARGB(255, 167, 83, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sudah punya akun? ",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xFFFFB800),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
