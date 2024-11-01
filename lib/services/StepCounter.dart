import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

class StepCounterScreen extends StatefulWidget {
  @override
  _StepCounterScreenState createState() => _StepCounterScreenState();
}

class _StepCounterScreenState extends State<StepCounterScreen> {
  String _stepCountValue = '0';
  late Stream<StepCount> _stepCountStream;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pedometer Example')),
      body: Center(
        child: Text('Steps taken: $_stepCountValue',
            style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
