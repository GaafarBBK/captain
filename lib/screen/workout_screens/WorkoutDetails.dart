import 'package:captain11/models/exercise_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final ExerciseModel workout;
  final Function(bool isChecked) onToggleCheck;
  final bool isChecked;

  DetailsPage({required this.workout, required this.onToggleCheck, required this.isChecked});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool? isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  void toggleCheck() {
    setState(() {
      isChecked = !isChecked!;
      widget.onToggleCheck(isChecked!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.workout.name),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue)),
                child: Image.asset(
                  "assets/login.png",
                  width: 400,
                  height: 400,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.workout.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.workout.instructions,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'التاريخ: 2024-10-31',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 70),
              Row(
                children: [
                  const SizedBox(width: 70),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF00A7E1),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        toggleCheck();
                      },
                      child: const Text(
                        'تم',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
