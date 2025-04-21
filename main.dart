main(){
  // delcration التصريح
  int counter;
  // print(counter);
  // initlaztion الاسناد
  counter =0;
  print(counter.runtimeType);
  // ? int 

  String name;
  name="Ahmad";
  print(name.runtimeType);
  // ? String

  bool isFavorite =true;
  print(isFavorite.runtimeType);
  // ? Bool
  num degree = 88.6;
  print(degree.runtimeType);
  degree=200;

  // ! Can't Assigend double to Integar
  // int poeplation = 20.3;

  // ! Can't Modify the Type of Varaible
  // var marks=20.4;
  // marks="Hello";
  // ? var is KeyWord to Detect the Type
  var anything=  "Hello Wolrd";

  var suprise;
  suprise=20;
  suprise="Hello";

  
  // marks="Hello";
  dynamic data="Jkk";
  data=20;
  data=true;
  data = null;


  Null empty =null;
  print(empty);

  int? age=90;
  print(age.runtimeType);
  String? nickName;
  print(nickName);

}