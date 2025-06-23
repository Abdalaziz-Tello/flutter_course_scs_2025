

enum Grade{
  EXCELLENT,VERYGOOD,GOOD,BAD
}


bool checkStudentStatus({required int allQuestion,required int correctQustion,required Grade grade}){
  if (allQuestion <0 || correctQustion < 0  ) {
    throw Exception();
  }else {
int threshold =grade==Grade.EXCELLENT ? 100 : grade==Grade.VERYGOOD ? 90 :grade==Grade.GOOD?70 : 50;
  if ((correctQustion/allQuestion)*100>=threshold) {
    return true;
  } else {
    return false;
  }
  }

}