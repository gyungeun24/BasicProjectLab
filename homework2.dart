import 'dart:convert';
import 'dart:math';

class Student{
  String name ='';
  int kor =0;
  int eng =0;
  int math =0;
  double avg =0.0;
  Student(){
    kor = Random().nextInt(99)+1;
    eng = Random().nextInt(99)+1;
    math = Random().nextInt(99)+1;
  }

}

void main(){

  var aList = List.empty(growable: true);

  for(int i =0;i<5;i++){
    Student a = Student();
    a.name = AsciiDecoder().convert([65 + i]);
    aList.add(a);
  }

  print("이름, 국어, 영어, 수학, 평균");

  for(int i =0; i<5;i++){
    double avg =(aList[i].kor +aList[i].eng +aList[i].math)/3.0;
    aList[i].avg =avg;
    print('${aList[i].name},${aList[i].kor},${aList[i].eng},${aList[i].math},${aList[i].avg.toStringAsFixed(2)}');
  }

  print('평균으로 정렬');

  List newList =List.from(aList);
  newList.sort((a, b)=>a.avg.compareTo(b.avg));
  for(var i in newList){
    print('${i.name},${i.kor},${i.eng},${i.math},${i.avg.toStringAsFixed(2)}');
  }

   print('\n평균의 자릿수 합');
  for (var i in newList) {
    int number = i.avg.toInt();
    int sum = 0;
    
    while (number > 0) {
      int digit = number % 10;
      sum += digit;
      number ~/= 10;
    }

    print('${i.name}의 자릿수 합: $sum');
}
}
