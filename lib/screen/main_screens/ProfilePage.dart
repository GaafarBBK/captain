import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:captain11/providers/auth_provider.dart';
import 'package:captain11/screen/workout_screens/workout_selection.dart';
import 'package:captain11/widget/HomePageWidgets.dart';
import 'package:captain11/screen/main_screens/TodayPage.dart';
// Import the auth provider

class StorePage extends StatefulWidget {
  const StorePage({super.key});
  final int weight = 70;
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  int _selectedIndex = 2;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // final TextEditingController _genderController = TextEditingController();
  // final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false)
        .getUser()
        .then((userdata) {
      if (userdata != null) {
        _nameController.text = userdata!.name;
        if (userdata!.phoneNumber != null) {
          _phoneController.text = userdata!.phoneNumber!;
        } else {
          _phoneController.text = '';
        }
        ;
        // _ageController.text = userdata.age.toString();
        // _genderController.text = userdata.gender;
        _emailController.text = userdata.email;

        setState(() {});
      }
    });
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    weight: widget.weight,
                  )),
        );
      }
      if (_selectedIndex == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TodayPage()),
        );
      }
      if (_selectedIndex == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StorePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Container(
                      width: 400,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                      child: Image.asset(
                        "assets/ic_launcher_foreground.png",
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/login.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _nameController.text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              _emailController.text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 129, 191, 241),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'تعديل',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget StoreAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text(
      '',
      style: GoogleFonts.changa(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    ),
    actions: [
      Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
        ],
      )
    ],
    backgroundColor: Colors.blue,
  );
}