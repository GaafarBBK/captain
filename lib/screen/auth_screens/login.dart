import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:captain11/screen/main_screens/HomePage.dart';
import 'package:captain11/providers/auth_provider.dart';
import 'package:captain11/screen/auth_screens/forgot_password.dart';
import 'package:captain11/screen/auth_screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  final bool isMale;
  final int weight;
  final int height;

  const LoginScreen(
      {super.key,
      required this.isMale,
      required this.weight,
      required this.height});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isPasswordVisible = false;

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    "assets/login.png",
                    width: 240,
                    height: 191,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  ' مرحبا بيك',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 50.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'البريد الإلكتروني',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يجب إدخال البريد الإلكتروني';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'يجب إدخال البريد الإلكتروني';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'كلمة المرور',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        obscureText: !isPasswordVisible,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return 'يجب إدخال كلمة المرور';
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registerscreen()));
                          },
                          child: const Text(
                            'هل نسيت كلمة المرور؟',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [Color(0xFF00A7E1), Color(0xFF003459)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _showLoadingDialog(context);

                              Provider.of<AuthProvider>(context, listen: false)
                                  .login({
                                'email': _emailController.text,
                                'password': _passwordController.text,
                              }).then((value) {
                                Navigator.pop(context); 
                                if (value[0] == true) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage()),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(value[1]['message']),
                                    ),
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen(
                                            isMale: widget.isMale,
                                            weight: widget.weight,
                                            height: widget.height)),
                                  );
                                }
                              });
                            }
                          },
                          child: const Text(
                            'الدخول',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      const Text('أو سجل دخول عبر'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.white)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.asset(
                                "assets/apple_uu.png",
                                height: 70,
                                width: 70,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.white)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.asset(
                                "assets/google_oo.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 70,
                            ),
                            const Text('ليس لديك حسابًا بالفعل؟'),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Regicterscreen(isMale: widget.isMale, height: widget.height, weight: widget.weight,)),
                                );
                              },
                              child: const Text(
                                'سجّل الآن',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text("يرجى الانتظار...",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
