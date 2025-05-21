


import 'package:auth_dummy/main.dart';
import 'package:dio/dio.dart';


String token = "";
Future<bool> logIn({required String username,required String password})async{
  try {
    
  Dio dio = Dio();

  Response response = await dio.post('https://dummyjson.com/auth/login',data: {
    "username":username,
    "password":password
  });
  print(response.data['accessToken']);
  token=response.data['accessToken'];
  storage.setString('token', token);
  return true;
  } catch (e) {
    print(e);
    return false;
  }
}


dynamic getMyProfile()async{
  Dio dio = Dio();
  Response response = await dio.get('https://dummyjson.com/auth/me',
  options: Options(
    headers: 
      {
    'Authorization': 'Bearer ${storage.getString('token')}', // Pass JWT via Authorization header
  }
    
  )
  );
  print(response.data);
  return response.data;
}