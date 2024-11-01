import 'dart:convert';

import 'package:captain11/models/exercise_model.dart';
import 'package:captain11/models/set_model.dart';
import 'package:captain11/models/workout_model.dart';
import 'package:captain11/providers/base_provider.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorkoutProvider extends BaseProvider
{
  List<WorkoutModel> workouts = [];
  List<ExerciseModel> workoutExercises = [];
  List<SetModel> exerciseSet = [];

  getWorkoutExercises(DateFormat selectedDate) async {
    setLoading(true);
    var response = await api.get("https://cool-gnu-seemingly.ngrok-free.app/api/workout/showExercises?date=$selectedDate");
    
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['exercises'];

      for (var item in data) 
      {
        workoutExercises.add(ExerciseModel.fromJson(item));
      }
      
      setLoading(false);
      setFailed(false);
      
    } else {
      setFailed(true);
      setLoading(false);
      return [false, jsonDecode(response.body)];
    }
  }

  getExerciseSet(DateFormat selectedDate, String exerciseName) async {
    setLoading(true);
    var response = await api.get("https://cool-gnu-seemingly.ngrok-free.app/api/workout/set/show?date=$selectedDate&exercises_name=$exerciseName");
    
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['sets'];

      for (var item in data) 
      {
        exerciseSet.add(SetModel.fromJson(item));
      }

      setLoading(false);
      setFailed(false);
      
    } else {
      setFailed(true);
      setLoading(false);
      return [false, jsonDecode(response.body)];
    }
  }


  Future <Response> createWorkout(String title) async {
    setLoading(true);

    var response = await api.post("https://cool-gnu-seemingly.ngrok-free.app/api/workout/create", body: {
      "date": DateFormat('yyyy-MM-dd').format(DateTime.now()),
      "title": title
    });

    if (response.statusCode == 201) {
      setLoading(false);
      setFailed(false);
      return response;
    } else {

      setLoading(false);
      setFailed(true);
      return response;
    }
  }
}