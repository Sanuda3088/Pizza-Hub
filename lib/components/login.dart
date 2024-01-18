
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizza_hub/controllers/auth.dart';
import 'package:pizza_hub/pages/homepage_areg.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future signInWithEmailAndPassword(BuildContext context) async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);

      final user = FirebaseAuth.instance.currentUser;
     /* if (user != null && !user.emailVerified) {
        await FirebaseAuth.instance.signOut();
        throw FirebaseAuthException(
            code: 'email-not-verified',
            message: 'Email verification required.');
      }*/
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const AfterHomePage()));
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              // email Textfield
                          TextFormField(
                        controller: _controllerEmail,
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: const TextStyle(color: Colors.orange),
                            hintText: 'Enter your email',
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.orange, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                        ),
                          ),
                          const SizedBox(
                        height: 10,
                          ),
                          //password field
                          TextFormField(
                        controller: _controllerPassword,
                        validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters in length';
                            }
                            if (value != _controllerPassword.text) {
                              return 'Confirm password doesn\'t match the password';
                            }
                            return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.orange),
                            hintText: 'Enter your password',
                            prefixIcon: const Icon(Icons.lock_open),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.orange, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                        ),
                          ),
                          Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: _errorMessage(),
                          ),
                          ElevatedButton(
                        onPressed: () => signInWithEmailAndPassword(context),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 243, 242, 234),
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.all(20),
                            fixedSize: const Size(600, 50),
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            elevation: 5,
                            side: const BorderSide(
                              color: Color.fromARGB(255, 249, 252, 251),
                              width: 4,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                        ),
                        child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 15),
                        ),
                          ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
