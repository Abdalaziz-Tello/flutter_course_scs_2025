import 'package:dio/dio.dart';

String baseUrl = "https://682b3419d29df7a95be27be0.mockapi.io/product/";

Dio dio= Dio();

// ! This Method return Map becaue I will use Dio Decoder
dynamic getOneProduct(String id)async{
Response response = await dio.get(baseUrl+"$id");
print(response.data);
print(response.statusCode);
return response.data;
}

dynamic getAllProduct()async{
Response response = await dio.get(baseUrl);
print(response.data);
print(response.statusCode);
// ? This . operation will decode the json to List of Map
return response.data;
}


deleteOneProduct(String id)async{
  Response response = await dio.delete(baseUrl+id);
  return true;
}


createNewProduct({required Map<String,dynamic> reqData})async{
Response response = await dio.post(baseUrl,data: reqData);
}

updateProduct({required Map<String,dynamic> updatedData,required String id})
async{
Response response = await dio.put(baseUrl+id,data: updatedData);
}