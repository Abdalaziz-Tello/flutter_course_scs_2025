class User {
  String name;
  String image;
  int birthDate;
  User({required this.image,required this.name,required this.birthDate});

age(){
  /// ? This is 2025
  print(DateTime.now().year-birthDate);
}
}


class InfluncerUser extends User {
int dollarByView;
InfluncerUser({required this.dollarByView,required super.name,required super.image,required super.birthDate});


paidInSyrianPound(){
  print(dollarByView*11500);
}
}
void main() {
  User account =User(image: "blabla", name: "Noor",birthDate: 1999);
  print(account.name);
  print(account.image);
  User account2 = User(image: "Anouther bla bla", name: "Yaser",birthDate: 2010);
  print(account2.name);
  print(account2.image);
  account.age();
  account2.age();


  InfluncerUser tom = InfluncerUser(dollarByView: 200, name: "Tom Kroz", image: "lorem ipsum", birthDate: 1962);
  print(tom.dollarByView);
  tom.age();
  tom.paidInSyrianPound();
  // calculateNumber(firstNumber:20 ,thirdNumber: 20,secondNumber: 20);



// ! compare const & final keyword
// ? optional assigned before make it constants
// final int temp;
// temp = 300;
// ? must assigned before make it constants
// const int temp1;
// temp1=300;

}
// ? Named Optional Parametar & Named Required Parametars
calculateNumber({required int firstNumber,required int secondNumber,int thirdNumber =1}){
  print(firstNumber*secondNumber*thirdNumber);

}




