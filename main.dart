
printButAvoidNull(String name){
print(name);
}

void main() async{
  // print(1==2); // ? Mathmatical Operation
  // print(1>20);

int x = 20;
//   if (x>30) {
//     print("object");
//   }else{
//     print("not object");
//   }
  // ? Inline if
print(x>30 ? "Object" : "Not Object");

String? nickName;

await Future.delayed(Duration(seconds: 3));


print(nickName?? "Hello World");

// ! Note : This will accure an Exception
// printButAvoidNull(nickName!);

}
