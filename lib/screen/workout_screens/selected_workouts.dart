import 'package:captain11/models/exercise_model.dart';
import 'package:captain11/providers/exercise_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedWorkoutsPage extends StatelessWidget {
  final List<ExerciseModel> selectedWorkouts;

  const SelectedWorkoutsPage({super.key, required this.selectedWorkouts});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseProvider>(builder: (context, exerciseConsumer, child) {

      return Scaffold(
        appBar: AppBar(
          title: const Text('التمارين المختارة'),
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _createWorkout();
          },
          child: const Icon(Icons.arrow_back),
          backgroundColor: Colors.blue,
        ),
        body: selectedWorkouts.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: selectedWorkouts.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/login.png",
                            width: 70,
                            height: 70,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedWorkouts[index].name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  selectedWorkouts[index].muscle,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Text(
                  'لم يتم اختيار أي تمارين بعد.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
      );
  });
  }
  }


void _createWorkout() {

}
