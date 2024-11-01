import 'package:captain11/models/exercise_model.dart';
import 'package:captain11/providers/exercise_provider.dart';
import 'package:flutter/material.dart';
import 'package:captain11/screen/workout_screens/selected_workouts.dart';
import 'package:captain11/screen/workout_screens/WorkoutDetails.dart';
import 'package:provider/provider.dart';

class WorkoutSelectionPage extends StatefulWidget {
  @override
  _WorkoutSelectionPageState createState() => _WorkoutSelectionPageState();
}

class _WorkoutSelectionPageState extends State<WorkoutSelectionPage> {
  String selectedMuscle = 'All';
  List<String> muscle = ['All', 'chest', 'forearms', 'lats', 'triceps', 'abdominals'];
  
  List<ExerciseModel> selectedWorkouts = [];

  @override
  Widget build(BuildContext context) {
    

    return Consumer<ExerciseProvider>(builder: (context, exerciseConsumer, child) {
      List<ExerciseModel> workouts = exerciseConsumer.exercises;

      List<ExerciseModel> filteredWorkouts = selectedMuscle == 'All'
        ? workouts
        : workouts
            .where((workout) => workout.muscle == selectedMuscle)
            .toList();

      return Scaffold(
        appBar: AppBar(
          title: const Text('اختر التدريبات'),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectedWorkoutsPage(
                      selectedWorkouts: selectedWorkouts,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.blueGrey),
                    hintText: 'بحث...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: muscle.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMuscle = muscle[index];
                          if (selectedMuscle == 'All') {
                            Provider.of<ExerciseProvider>(context, listen: false)
                              .getApiExercises(null,null);
                          } else {
                          Provider.of<ExerciseProvider>(context, listen: false)
                              .getApiExercises(selectedMuscle,null);
                        }});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: selectedMuscle == muscle[index]
                              ? Colors.blue
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          muscle[index],
                          style: TextStyle(
                            color: selectedMuscle == muscle[index]
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: filteredWorkouts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            isChecked: selectedWorkouts.contains(filteredWorkouts[index]),
                            workout: filteredWorkouts[index],
                            onToggleCheck: (bool isChecked) {
                              setState(() {
                                if(isChecked) {
                                  selectedWorkouts.add(filteredWorkouts[index]);
                                } else {
                                  selectedWorkouts.remove(filteredWorkouts[index]);
                                }
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
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
                                    filteredWorkouts[index].name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    filteredWorkouts[index].muscle,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                selectedWorkouts.contains(filteredWorkouts[index])
                                    ? Icons.remove
                                    : Icons.add,
                                color: selectedWorkouts.contains(filteredWorkouts[index])
                                    ? Colors.red
                                    : Colors.blue,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (selectedWorkouts.contains(filteredWorkouts[index])) {
                                    selectedWorkouts.remove(filteredWorkouts[index]);
                                  } else {
                                    selectedWorkouts
                                        .add(filteredWorkouts[index]);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
    );
  }
}
