
 int signFunc(int product){
  if (product>0) {
    return 1;
  }else if(product<0){
    return -1;
  }else {
    throw Exception();
  }
 }

 String sayMyName(dynamic name){
  try {
    name / 5 ;
    return name;
  } catch (e) {
    return "There is A problem";
  }
 }


void main() {
  // ? Start The Solutaion
  List<int> nums =[1,2,5,9,-1,0];
  int result= 1;
  for (var i = 0; i < nums.length; i++) {
    result=result*nums[i];
  }
  // print(result);
  try {
    int output = signFunc(result);
  } catch (e) {
    print("Hello From Catch");
  }
  print("Here I am Out the Catch ,  So >_< Hello");
  try {
  print(nums[10]);
    
  } catch (e) {
    print(e);
  }

  print(sayMyName("Ahmad"));



  // ! Here The Begain of Session // 
  // List names = ["Hello", 123, true];
  // for (var i = 0; i < names.length; i++) {
  //   print(names[i]);
  // }
  // print("object;");

  // Map marks = {"Math 3": 59, "English": 100, "Computer Arch": 20};
  // print(marks["Hello"]);
  // print(marks.keys.elementAt(1));

  // List<Map<String, int>> nestedMap = [
  //   {
      
  //     "Physics": 123,
  //     "Arabic": 222,
  //     "Music": 1000,},


  //   {"Physics": 101, "Arabic": 0, "Music": 321,},
  // ];

  // print(nestedMap[1].keys.elementAt(1));


  // List<Map<String,int>> tabel =[
  //   {
  //     "Ahmad":100,
  //     "Yaser":90
  //   }
  // ];
  // print(tabel[0].keys.elementAt(1));
  // print(tabel[0]["Yaser"]);
}
