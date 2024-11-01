import 'dart:convert';
import 'base_provider.dart';
import 'package:captain11/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends BaseProvider {


  UserModel? userModel;
  bool auth = false;
  

  

  initilazAuthProvider() async {
    setLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      auth = true;
    }
    setLoading(false);
  }

  Future<List> login(Map body) async {
    setLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await api.post(
        "https://cool-gnu-seemingly.ngrok-free.app/api/login",
        body: body);
    if (response.statusCode == 200) {
      prefs.setString('token', jsonDecode(response.body)['access_token']);
      auth = true;
      setLoading(false);
      setFailed(false);
      return [true, jsonDecode(response.body)['access_token']];
    } else {
      setFailed(true);
      setLoading(false);
      return [false, jsonDecode(response.body)];
    }
  }

  Future<List> register(Map body) async {
    setLoading(true);
    var response = await api.post(
        "https://cool-gnu-seemingly.ngrok-free.app/api/register",
        body: body);
    if (response.statusCode == 201) {
      setLoading(false);
      setFailed(false);
      return [true, jsonDecode(response.body)];
    } else {
      setFailed(true);
      setLoading(false);
      return [false, jsonDecode(response.body)];
    }
  }

  Future<bool> logout() async {
    setLoading(true);
    final response =
        await api.post("https://cool-gnu-seemingly.ngrok-free.app/api/logout");
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.clear();

      auth = false;
      setLoading(false);
      return true;
    } else {
      setFailed(true);
      setLoading(false);
      return false;
    }
  }

  Future<List> updateProfile(UserModel body) async {
    setLoading(true);
    var response = await api.put(
        "https://cool-gnu-seemingly.ngrok-free.app/api/user/update",
        body: body);
    if (response.statusCode == 200) {
      setLoading(false);
      setFailed(false);
      return [true, jsonDecode(response.body)];
    } else {
      setFailed(true);
      setLoading(false);
      return [false, jsonDecode(response.body)];
    }
  }

  Future <UserModel?>getUser() async {
    setLoading(true);
    var response = await api.get(
        "https://cool-gnu-seemingly.ngrok-free.app/api/user/info",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });

    if (response.statusCode == 200) {
      userModel = UserModel.fromJson(jsonDecode(response.body)['user info']);
      print(userModel!.toJson());
      setLoading(false);
      setFailed(false);
      return userModel;
    } else {
      setFailed(true);
      setLoading(false);
      return jsonDecode(response.body);
    }
  }
  
}
Future<bool> logout() async {
  // firebaseAuth.signOut();
  return true;

}