


import 'package:auth_dummy/main.dart';
import 'package:auth_dummy/model/profile_model.dart';
import 'package:auth_dummy/model/user_model.dart';
import 'package:dio/dio.dart';


String token = "";
Future<bool> logIn({required UserModel user})async{
  try {
    
  Dio dio = Dio();

  Response response = await dio.post('https://dummyjson.com/auth/login',data: user.toMap());
  print(response.data['accessToken']);
  token=response.data['accessToken'];
  storage.setString('token', token);
  return true;
  } catch (e) {
    print(e);
    return false;
  }
}


Future<ProfileModel> getMyProfile()async{
  Dio dio = Dio();
  Response response = await dio.get('https://dummyjson.com/auth/me',
  options: Options(
    headers: 
      {
    'Authorization': 'Bearer ${storage.getString('token')}', // Pass JWT via Authorization header
  }
    
  )
  );
  print(response);
  ProfileModel profile = ProfileModel.fromJson(response.data);
  return profile
  ;
}