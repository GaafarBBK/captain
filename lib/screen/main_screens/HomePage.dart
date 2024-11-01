import 'package:captain11/screen/auth_screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:captain11/screen/workout_screens/ManagingSubscriber.dart';
import 'package:captain11/screen/workout_screens/TrainerSelectionPage.dart';
import 'package:captain11/models/user_model.dart';
import 'package:captain11/providers/auth_provider.dart';
import 'package:captain11/screen/workout_screens/workout_selection.dart';
import 'package:captain11/widget/HomePageWidgets.dart';
import 'package:captain11/screen/main_screens/ProfilePage.dart';
import 'package:captain11/screen/main_screens/TodayPage.dart';
import 'package:captain11/screen/auth_screens/login.dart';

class MyHomePage extends StatefulWidget {
  late final bool isMale;
  late final int height;
  late final int weight;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final int weight = 80;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final List<Widget> _pages = [
    HomePage(
      weight: 70,
    ),
    TodayPage(),
    StorePage(),
  ];

  final List<Widget?> _drawer = [Drawer(), null, null];
  final List<PreferredSizeWidget?> appbars = [HomeAppBar(), null, null];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbars[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 142, 192, 233),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/login.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _nameController.text,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text(
                  //   _phoneController.text,
                  //   style: const TextStyle(
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.normal,
                  //       color: Colors.black54),
                  // ),
                  Text(
                    _emailController.text,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
            ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text('مدربي'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrainerSelectionPage()),
                  );
                }),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('الملف الشخصي'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('الإعدادات'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('تسجيل الخروج'),
              onTap: () {
                Provider.of<AuthProvider>(context, listen: false)
                    .logout()
                    .then((logedOut) {
                  if (logedOut) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Regicterscreen(
                              isMale: widget.isMale,
                              weight: widget.weight,
                              height: widget.height)),
                    );
                  }
                });
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range_outlined),
            label: 'اليوم',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'حسابي',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}