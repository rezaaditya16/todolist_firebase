import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/view/home_page.dart';
import 'package:todolist/view/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void toRegister() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const RegisterPage();
    }));
  }

  void login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final navigator = Navigator.of(context);
      final email = _emailController.text;
      final password = _passwordController.text;

      if (email.isEmpty || password.isEmpty) {
        throw ("Please fill all the fields");
      } else {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        navigator.pushReplacement(MaterialPageRoute(builder: (context) {
          return const HomePage();
        }));
      }
    } catch (e) {
      final snackbar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Welcome',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                      const Text('Back',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      const Text('Sign in to continue',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      const SizedBox(height: 10),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder()))),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: TextField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder()))),
                      const SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Create new account?',
                                style: TextStyle(fontSize: 16)),
                            TextButton(
                                onPressed: toRegister,
                                child: const Text('Sign Up',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)))
                          ]),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15)),
                          onPressed: login,
                          child: const Text('Login',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 10)
                    ])));
  }
}
