class UserModel {
  String username;
  String password;

  UserModel({required this.password,required this.username});

  Map<String,dynamic> toMap(){
    return {
      "username":username,
      "password":password
    };
  }
}