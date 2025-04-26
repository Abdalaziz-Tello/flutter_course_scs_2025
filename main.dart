
abstract class User {
  String name;
  String jop;
  int brithDate;

  User({required this.brithDate,required this.jop,required this.name});

  // ? This is an Abstarct Method
  calculateAge();

  sayMyName(){
    print("The User name is : "+ name);
  }
}


class Doctor extends User {
  Doctor({required super.name,required super.brithDate,required super.jop});

  

  @override
  calculateAge() {
    print(DateTime.now().year -brithDate + 6);
  }

  @override
  sayMyName() {
    print("The User name is Dr  " + name);
  }
}


class Engi extends User {
  Engi({required super.name,required super.brithDate,required super.jop});

  @override
  calculateAge() {
    print(DateTime.now().year-brithDate + 20);
  }
  // ! If You Did not give the method Behavior 
  // ! it will take The Father Behavio (USER)
  // @override
  // sayMyName() {
  //   print("The User name is En  " + name);
  // }
}



void main() {
  // User admin  = User(brithDate: 2002, jop: "Doctor", name: "Ahmad");
  // admin.sayMyName();

  Doctor doctor = Doctor(name: "Noor", brithDate: 1960, jop: "Doctor");
  doctor.sayMyName();
  doctor.calculateAge();

  User testUser = Doctor(name: "Test", brithDate: 0000, jop: "Test");
  // testUser.sayMyName();

  // tellMeTheTypeOfUser();

}


tellMeTheTypeOfUser(User user){
  if (user.runtimeType == Doctor) {
    print("This is a Doctor");
  }else {
    print("This is An Enginear");

  }
}