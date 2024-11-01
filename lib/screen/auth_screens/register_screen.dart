import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:captain11/providers/auth_provider.dart';
import 'package:captain11/providers/auth_provider.dart';
import 'package:captain11/helpers/random_functions.dart';
import 'package:captain11/helpers/random_functions.dart';
import 'package:captain11/screen/auth_screens/login.dart';


class Regicterscreen extends StatefulWidget {
  final bool isMale;
  final int height;
  final int weight;
  const Regicterscreen(
      {super.key,
      required this.isMale,
      required this.height,
      required this.weight});


  @override
  State<Regicterscreen> createState() => _RegicterscreenState();
}

class _RegicterscreenState extends State<Regicterscreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nemeController = TextEditingController();
  final _batdController = TextEditingController();
  final _pohenController = TextEditingController();

  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF00171F), Color(0xFF003459)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    height: 141,
                    width: 500,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ابدأ الآن",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "أنشئ حساب جديد الآن",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        TextFormField(
                          controller: _nemeController,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: 'إسم كامل',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يجب إدخال كلمة الاسم ';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
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
                              return 'يجب إدخل البريد الإلكتروني';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: _pohenController,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: ' رقم الهاتف',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 10) {
                              return 'يجب إدخال كلمة المرور';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: _batdController,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: ' تاريخ ميلادك',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يجب إدخال تاريخ الميلاد ';
                            }
                            return null;
                          },
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1997),
                                    lastDate: DateTime(2010))
                                .then((selectedDate) {
                              setState(() {
                                _batdController.text = selectedDate!
                                    .toIso8601String()
                                    .substring(0, 10);
                              });
                            });
                          },
                        ),
                        const SizedBox(height: 40),
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
                        const SizedBox(height: 40),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF00A7E1),
                                    Color(0xFF003459)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Provider.of<AuthProvider>(context,
                                        listen: false)

                                    .register({
                                  'email': _emailController.text,
                                  'password': _passwordController.text,
                                  'name': _nemeController.text,
                                  'phone': _pohenController.text,
                                  'birth_date': _batdController.text,
                                  'role': 'athlete',
                                  'gender': widget.isMale ? 'male' : 'female',
                                  'age': calculateAge(
                                      DateTime.parse(_batdController.text)),
                                  'weight': widget.weight,
                                  'height': widget.height,
                                  'ath_lvl': 'Advanced',
                                  'ath_goal': 'Build Muscle',
                                  'ath_body': 'Muscular',
                                }).then((value) {
                                  if (value[0]) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen(
                                                isMale: widget.isMale,
                                                weight: widget.weight,
                                                height: widget.height,
                                              )),
                                    );
                                  } else {

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(value[1]['message']),
                                      ),
                                    );
                                  }
                                });

                                  
                             
                                
                              }
                            },
                            child: const Text(
                              'تسجل',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 40,
                              ),
                              const Text('هل لديك حساب بل فعل؟'),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen(
                                            isMale: widget.isMale,
                                            weight: widget.weight,
                                            height: widget.height)),

      
                                  );
                                },
                                child: const Text(
                                  'سجّل الدخول',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
