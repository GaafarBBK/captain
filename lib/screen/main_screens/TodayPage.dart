import 'package:captain11/models/exercise_model.dart';
import 'package:captain11/screen/DietDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:captain11/widget/HomePageWidgets.dart';
import 'package:captain11/screen/main_screens/ProfilePage.dart';
import 'package:captain11/screen/workout_screens/WorkoutDetails.dart';

class TodayPage extends StatefulWidget {
  TodayPage({super.key, this.exercises});
  final int weight = 70;
  List <ExerciseModel>? exercises;

  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  int _selectedIndex = 1;

  List<ExerciseModel> exercises = [];
  List <ExerciseModel> finishedExercises = [];

  
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
          MaterialPageRoute(builder: (context) => TodayPage(exercises: widget.exercises,)),
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
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white),
                ),
                height: 200,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Image.asset(
                        "assets/ic_launcher_monochrome.png",
                        height: 75,
                        width: 75,
                      ),
                      DatePicker(
                        DateTime.now(),
                        height: 90,
                        width: 70,
                        initialSelectedDate: DateTime.now(),
                        locale: "ar",
                        selectionColor: Colors.black54,
                        selectedTextColor: Colors.white,
                        dayTextStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        monthTextStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        dateTextStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.blue,
                        tabs: [
                          Text('جدول التمرين '),
                          Text('النظام الغذاء '),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            buildWorkoutCards(context),
                            buildDietCards(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildWorkoutCards(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    isChecked: finishedExercises.contains(exercises[index]),
                    workout: exercises[index],
                    onToggleCheck: (bool isChecked) {
                      setState(() {
                        if (finishedExercises.contains(exercises[index])) {
                                    finishedExercises.remove(exercises[index]);
                                  } else {
                                    finishedExercises
                                        .add(exercises[index]);
                      }});
                    },
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 5),
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
                            exercises[index].name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            exercises[index].difficulty,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Checkbox(
                      value: finishedExercises.contains(exercises[index]),
                      onChanged: (bool? value) {
                        setState(() {
                          if (finishedExercises.contains(exercises[index])) {
                                    finishedExercises.remove(exercises[index]);
                                  } else {
                                    finishedExercises
                                        .add(exercises[index]);
                      }
                        });
                      },
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildDietCards(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                
                MaterialPageRoute(
                  builder: (context) => DetailsDiet(
                    Diet: Diet[index],
                    onToggleCheck: (bool isChecked) {
                      setState(() {
                        Diet[index]['isChecked'] = isChecked;
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
                            Diet[index]['name'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            Diet[index]['sets'],
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Checkbox(
                      value: Diet[index]['isChecked'],
                      onChanged: (bool? value) {
                        setState(() {
                          Diet[index]['isChecked'] = value!;
                        });
                      },
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<Map<String, dynamic>> Diet = [
    {
      'name': '1أسم الوجبة',
      'sets': 'الوزن و العدادت',
      'image': 'assets/cardio.png',
      'date': '2024-10-19',
      'isChecked': false,
    },
    {
      'name': '2أسم الوجبة',
      'sets': 'الوزن و العدادت',
      'image': 'assets/cardio.png',
      'date': '2024-10-19',
      'isChecked': false,
    },
    {
      'name': '1أسم الوجبة',
      'sets': 'الوزن و العدادت',
      'image': 'assets/cardio.png',
      'date': '2024-10-19',
      'isChecked': false,
    },
    {
      'name': '1أسم الوجبة',
      'sets': 'الوزن و العدادت',
      'image': 'assets/cardio.png',
      'date': '2024-10-19',
      'isChecked': false,
    },
    {
      'name': '1أسم الوجبة',
      'sets': 'الوزن و العدادت',
      'image': 'assets/cardio.png',
      'date': '2024-10-19',
      'isChecked': false,
    },
    {
      'name': '1أسم الوجبة',
      'sets': 'الوزن و العدادت',
      'image': 'assets/cardio.png',
      'date': '2024-10-19',
      'isChecked': false,
    },
    {
      'name': '1أسم الوجبة',
      'sets': 'الوزن و العدادت',
      'image': 'assets/cardio.png',
      'date': '2024-10-19',
      'isChecked': false,
    },
    {
      'name': '1أسم الوجبة',
      'sets': 'الوزن و العدادت',
      'image': 'assets/cardio.png',
      'date': '2024-10-19',
      'isChecked': false,
    },
    {
      'name': '1أسم الوجبة',
      'sets': 'الوزن و العدادت',
      'image': 'assets/cardio.png',
      'date': '2024-10-19',
      'isChecked': false,
    },
    {
      'name': '1أسم الوجبة',
      'sets': 'الوزن و العدادت',
      'image': 'assets/cardio.png',
      'date': '2024-10-19',
      'isChecked': false,
    },
    {
      'name': '1أسم الوجبة',
      'sets': 'الوزن و العدادت',
      'image': 'assets/cardio.png',
      'date': '2024-10-19',
      'isChecked': false,
    },
    {
      'name': '1أسم الوجبة',
      'sets': 'الوزن و العدادت',
      'image': 'assets/cardio.png',
      'date': '2024-10-19',
      'isChecked': false,
    },
  ];