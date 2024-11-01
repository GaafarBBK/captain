import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:captain11/screen/Onboarding/height_screen.dart';

class GenderToggleSwitch extends StatefulWidget {
  @override
  _GenderToggleSwitchState createState() => _GenderToggleSwitchState();
}

class _GenderToggleSwitchState extends State<GenderToggleSwitch> {
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'تحدد   جنسك',
          style: TextStyle(
            color: isMale ? Colors.blue : Colors.pink,
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: isMale ? Colors.blue[100] : Colors.pink[100],
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                isMale ? Icons.male : Icons.female,
                size: 150,
                color: isMale ? Colors.blue : Colors.pink,
              ),
            ),
            SizedBox(height: 40),
            Text(
              isMale ? 'ذكر' : 'انثى',
              style: TextStyle(
                  fontSize: 40, color: isMale ? Colors.blue : Colors.pink),
            ),
            const SizedBox(height: 85),
            FlutterSwitch(
              width: 120.0,
              height: 50.0,
              valueFontSize: 18.0,
              toggleSize: 45.0,
              value: isMale,
              borderRadius: 30.0,
              padding: 8.0,
              activeText: "ذكر",
              inactiveText: "أنثى",
              activeColor: Colors.blue,
              inactiveColor: Colors.pink,
              activeToggleColor: Colors.white,
              inactiveToggleColor: Colors.white,
              activeIcon: const Icon(
                Icons.male,
                color: Colors.blue,
              ),
              inactiveIcon: const Icon(
                Icons.female,
                color: Colors.pink,
              ),
              onToggle: (val) {
                setState(() {
                  isMale = val;
                });
              },
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 300,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HeightScreen(isMale: isMale)));
                          
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
