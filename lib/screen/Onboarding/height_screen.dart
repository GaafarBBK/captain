import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:captain11/screen/Onboarding/weight_screen.dart';

class HeightScreen extends StatefulWidget {
  final bool isMale;
  const HeightScreen({super.key, required this.isMale});
  

  

  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  int height = 175;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              height: 141,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "سجل ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "طولك",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'الطول: $height سم',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NumberPicker(
                          value: height,
                          minValue: 100,
                          maxValue: 250,
                          step: 1,
                          itemHeight: 100,
                          axis: Axis.vertical,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          },
                          selectedTextStyle: const TextStyle(
                            color: Colors.blue,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                width: 280,
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
                              builder: (context) => WeightScreen(height: height, isMale: widget.isMale)));
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
    );
  }
}
