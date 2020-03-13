import 'dart:math';
// Challenge 1
// Longest Streak
// Create a function that takes an array of objects with date property and return the
// "longest streak" (i.e. number of consecutive days in a row).
//
// Example
// longestStreak([
//   {
//   "date": "2019-09-18"
//   },
//   {
//   "date": "2019-09-19"
//   },
//   {
//   "date": "2019-09-20"
//   },
//   {
//   "date": "2019-09-26"
//   },
//   {
//   "date": "2019-09-27"
//   },
//   {
//   "date": "2019-09-30"
//   }
// ]) ➞ 3
int longestStreak(List dates){
  if(dates.length==1){
    return 1;
  }
  if(dates.length==0){
    return 0;
  }
  dates.sort((a, b) => a['date'].compareTo(b['date']));
  print(dates);
  int count=1;
  List counts=[];
  List dateTimes=[];
  for(int i=0;i<dates.length;i++){
    DateTime myDatetime = DateTime.parse(dates[i]['date']);
    dateTimes.add(myDatetime);

  }
  for(int i=0;i<dateTimes.length-1;i++){
    final difference = dateTimes[i+1].difference(dateTimes[i]).inDays;

    if(difference==1){
      count++;
    }else{
      counts.add(count);
      count=0;
    }
  }
  return counts.reduce((curr, next) => curr > next? curr: next);
}

// Challenge 2
// This problem was asked by Microsoft.
//
// Given a dictionary as a list of words and a string made up of those words (no spaces),
// return the original sentence in a list. If there is more than one possible
// reconstruction, return any of them. If there is no possible reconstruction,
// then return null.
//
// For example, given the set of words 'quick', 'brown', 'the', 'fox', and the
// string "thequickbrownfox", you should return ['the', 'quick', 'brown', 'fox'].
//
// Given the set of words 'bed', 'bath', 'bedbath', 'and', 'beyond', and the
// string "bedbathandbeyond", return either ['bed', 'bath', 'and', 'beyond] or
// ['bedbath', 'and', 'beyond'].
List<String>Dictionary(List<String> dictionary,String word){
  if(word.isEmpty){
    return [];
  }
  for(int i=1;i<=word.length;i++){
    String testString=word.substring(0,i);
    if(dictionary.contains(testString)){
      var result=Dictionary(dictionary, word.substring(i));
      if(result!=null){
        return result..add(testString);
      }
    }
  }
  return null;
}


void main() {
//  print(longestStreak([
//    {
//      "date": "2019-09-18"
//    },
//    {
//      "date": "2019-09-19"
//    },
//    {
//      "date": "2019-09-20"
//    },
//    {
//      "date": "2019-09-26"
//    },
//    {
//      "date": "2019-09-27"
//    },
//    {
//      "date": "2019-09-30"
//    }
//  ]));
//  print(longestStreak([
//    {
//      "date": "2019-09-18"
//    },
//
//  ]));
//  print(longestStreak([]));
// print(Dictionary(['quick', 'brown', 'the', 'fox'],'thequickbrownfox'));
// print(Dictionary(['bed', 'bath', 'bedbath', 'and', 'beyond'],'bedbathandbeyond'));
// print(Dictionary(['bed', 'bath', 'bedbath', 'and', 'beyond'],'bedbatandbeyond'));
// print(Dictionary(['bedbat','bedbath', 'and', 'beyond'],'bedbathandbeyond'));

 // print(findInDictionary(['quick', 'brown', 'the', 'fox'],'thequickbrownfox'));
  print(findInDictionary(['bed', 'bath', 'bedbath', 'and', 'beyond'],'bedbathandbeyond'));
  print(findInDictionary(['bed', 'bath', 'bedbath', 'and', 'beyond'],'bedbatandbeyond'));
  print(findInDictionary(['bedbat','bedbath', 'and', 'beyond'],'bedbathandbeyond'));
}
List<String>findInDictionary(List<String> dictionary,String word){
  List<List<String>> finalResult=[];
  List<List<String>> result=[];
 for(int i=0;i<dictionary.length;i++){
   print('searching for ${dictionary[i]}');
   List<String>temp=[];
   if(word.startsWith(dictionary[i])){
     temp.add(dictionary[i]);
     print('temp=$temp');
     word=word.replaceRange(0,dictionary[i].length,'');
     print('word=$word');
     temp.add(word);
     print('temp=$temp');
     result.add(temp);
     print('result=$result');
     i=-1;
   }
 }
 List<String> answer=[];
 for(int i=0;i<result.length;i++){
   answer.add(result[i][0]);
 }
 print('answer=$answer');
 finalResult.add(answer);
 print('fianlResult=$finalResult');
 int totalLength=0;
 // code not complete
}
