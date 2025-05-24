


import 'package:auth_dummy/model/photo_model.dart';
import 'package:dio/dio.dart';

Future<PhotoModel> getPhoto()async{
  Response response = await Dio().get("https://jsonplaceholder.typicode.com/photos/5");
  PhotoModel photoModel = PhotoModel.fromMap(response.data);
  return photoModel;
}