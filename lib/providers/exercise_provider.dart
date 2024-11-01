import 'dart:convert';
import 'package:captain11/models/exercise_model.dart';
import 'package:captain11/providers/base_provider.dart';

class ExerciseProvider extends BaseProvider {
  List<ExerciseModel> exercises = [];


  getApiExercises(String? targetMuscle, String? name) async {
    setLoading(true);
      String url = "https://api.api-ninjas.com/v1/exercises?X-Api-Key=yGHrbqXSfraa1dxv5V48RQ==jSyDpvL031ISiu9i";
      if (targetMuscle != null) {
        url += "&muscle=$targetMuscle";
      }
      if (name != null) {
        url += "&name=$name";
      }

      var response = await api.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        exercises = data.map<ExerciseModel>((item) => ExerciseModel.fromJson(item)).toList();
        setFailed(false);
        setLoading(false);
      } else {
        setLoading(false);
        setFailed(true);
        return [false, jsonDecode(response.body)];

      }
    
  }
}
