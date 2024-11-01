import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:captain11/widget/test.dart';
import 'package:captain11/helpers/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:captain11/helpers/notifications.dart';
import 'package:captain11/helpers/random_functions.dart';
import 'package:captain11/screen/main_screens/ProfilePage.dart';
import 'package:captain11/screen/main_screens/TodayPage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.weight});

  int weight;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _stepCountValue = '0';
  late Stream<StepCount> _stepCountStream;
  final List<Map<String, String>> trainers = [
    {'name': 'مدرب 1', 'imagePath': 'assets/trainer1.png'},
    {'name': 'مدرب 2', 'imagePath': 'assets/trainer2.png'},
    {'name': 'مدرب 3', 'imagePath': 'assets/trainer3.png'},
    {'name': 'مدرب 3', 'imagePath': 'assets/trainer3.png'},
    {'name': 'مدرب 3', 'imagePath': 'assets/trainer3.png'},
    {'name': 'مدرب 3', 'imagePath': 'assets/trainer3.png'},
    {'name': 'مدرب 3', 'imagePath': 'assets/trainer3.png'},
    {'name': 'مدرب 3', 'imagePath': 'assets/trainer3.png'},
    {'name': 'مدرب 3', 'imagePath': 'assets/trainer3.png'},
    {'name': 'مدرب 3', 'imagePath': 'assets/trainer3.png'},
    {'name': 'مدرب 3', 'imagePath': 'assets/trainer3.png'},
    {'name': 'مدرب 3', 'imagePath': 'assets/trainer3.png'},
  ];
  int _selectedIndex = 0;

  int _currentValue = 3;
  @override
  void initState() {
    super.initState();
    startListening();
  }

  void startListening() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
  }

  void onStepCount(StepCount event) {
    setState(() {
      _stepCountValue = event.steps.toString();
    });
  }

  void onStepCountError(error) {
    setState(() {
      _stepCountValue = 'Error: $error';
    });
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.blue,
                              width: 5.0,
                            ),
                          ),
                          height: 150,
                          width: 150,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.directions_walk,
                                  color: Colors.blue, size: 50),
                              const SizedBox(height: 5),
                              Text(
                                '$_stepCountValue',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.red,
                              width: 5.0,
                            ),
                          ),
                          height: 150,
                          width: 150,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.local_fire_department,
                                  color: Colors.red, size: 50),
                              const SizedBox(height: 5),
                              Text(
                                calculateCaloriesBurned(
                                        int.parse(_stepCountValue),
                                        widget.weight)
                                    .toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 9,
                        offset: Offset(0, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 202, 225, 243)
                        .withOpacity(1.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TodayPage()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1.3),
                              color: Colors.white,
                            ),
                            height: 50,
                            width: 300,
                            alignment: Alignment.center,
                            child: Text(
                              'تدريب اليوم المتبقي',
                              style: GoogleFonts.changa(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TodayPage()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1.3),
                              color: Colors.white,
                            ),
                            height: 50,
                            width: 300,
                            alignment: Alignment.center,
                            child: Text(
                              'وجبة اليوم',
                              style: GoogleFonts.changa(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TodayPage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFFD700), Colors.white],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    height: 150,
                    width: 350,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'تخفيضات خاصة اليوم!',
                            style: GoogleFonts.changa(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'احصل على 20% تخفيض على جميع المنتجات!',
                            style: GoogleFonts.changa(
                              fontSize: 14,
                              color: Colors.blue.shade600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 122, 193, 247),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage('assets/trainer.png'),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'ملاحظة من المدرب',
                                style: GoogleFonts.changa(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'هذه ملاحظة من المدرب حول التمرين أو النظام الغذائي...',
                          style: GoogleFonts.changa(
                              fontSize: 10, color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'اكتب ردك هنا...',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.blue.shade300),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text(
                                  'إرسال',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trainers.length,
                    itemBuilder: (context, index) {
                      final trainer = trainers[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage(trainer['imagePath']!),
                              radius: 40,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              trainer['name']!,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade700,
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

PreferredSizeWidget HomeAppBar() {
  return AppBar(
    centerTitle: true,
    title: Image.asset(
      "assets/ic_launcher_monochrome.png",
      height: 100,
      width: 100,
    ),
    actions: [
      Row(
        children: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationsScreen()),
                );
              },
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ],
    backgroundColor: Colors.blue,
  );
}