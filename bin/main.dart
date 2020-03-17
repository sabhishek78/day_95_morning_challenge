//import 'dart:math';
//// Challenge 1
//// Longest Streak
//// Create a function that takes an array of objects with date property and return the
//// "longest streak" (i.e. number of consecutive days in a row).
////
//// Example
//// longestStreak([
////   {
////   "date": "2019-09-18"
////   },
////   {
////   "date": "2019-09-19"
////   },
////   {
////   "date": "2019-09-20"
////   },
////   {
////   "date": "2019-09-26"
////   },
////   {
////   "date": "2019-09-27"
////   },
////   {
////   "date": "2019-09-30"
////   }
//// ]) ➞ 3
//int longestStreak(List dates){
//  if(dates.length==1){
//    return 1;
//  }
//  if(dates.length==0){
//    return 0;
//  }
//  dates.sort((a, b) => a['date'].compareTo(b['date']));
//  print(dates);
//  int count=1;
//  List counts=[];
//  List dateTimes=[];
//  for(int i=0;i<dates.length;i++){
//    DateTime myDatetime = DateTime.parse(dates[i]['date']);
//    dateTimes.add(myDatetime);
//
//  }
//  for(int i=0;i<dateTimes.length-1;i++){
//    final difference = dateTimes[i+1].difference(dateTimes[i]).inDays;
//
//    if(difference==1){
//      count++;
//    }else{
//      counts.add(count);
//      count=0;
//    }
//  }
//  return counts.reduce((curr, next) => curr > next? curr: next);
//}
//
//// Challenge 2
//// This problem was asked by Microsoft.
////
//// Given a dictionary as a list of words and a string made up of those words (no spaces),
//// return the original sentence in a list. If there is more than one possible
//// reconstruction, return any of them. If there is no possible reconstruction,
//// then return null.
////
//// For example, given the set of words 'quick', 'brown', 'the', 'fox', and the
//// string "thequickbrownfox", you should return ['the', 'quick', 'brown', 'fox'].
////
//// Given the set of words 'bed', 'bath', 'bedbath', 'and', 'beyond', and the
//// string "bedbathandbeyond", return either ['bed', 'bath', 'and', 'beyond] or
//// ['bedbath', 'and', 'beyond'].
//List<String>Dictionary(List<String> dictionary,String word){
//  if(word.isEmpty){
//    return [];
//  }
//  for(int i=1;i<=word.length;i++){
//    String testString=word.substring(0,i);
//    if(dictionary.contains(testString)){
//      var result=Dictionary(dictionary, word.substring(i));
//      if(result!=null){
//        return result..add(testString);
//      }
//    }
//  }
//  return null;
//}
//
//
//void main() {
////  print(longestStreak([
////    {
////      "date": "2019-09-18"
////    },
////    {
////      "date": "2019-09-19"
////    },
////    {
////      "date": "2019-09-20"
////    },
////    {
////      "date": "2019-09-26"
////    },
////    {
////      "date": "2019-09-27"
////    },
////    {
////      "date": "2019-09-30"
////    }
////  ]));
////  print(longestStreak([
////    {
////      "date": "2019-09-18"
////    },
////
////  ]));
////  print(longestStreak([]));
//// print(Dictionary(['quick', 'brown', 'the', 'fox'],'thequickbrownfox'));
//// print(Dictionary(['bed', 'bath', 'bedbath', 'and', 'beyond'],'bedbathandbeyond'));
//// print(Dictionary(['bed', 'bath', 'bedbath', 'and', 'beyond'],'bedbatandbeyond'));
//// print(Dictionary(['bedbat','bedbath', 'and', 'beyond'],'bedbathandbeyond'));
//
//  print(findInDictionary(['quick', 'brown', 'the', 'fox'],'thequickbrownfox'));
//  print(findInDictionary(['bed', 'bath', 'bedbath', 'and', 'beyond'],'bedbathandbeyond'));
//  print(findInDictionary(['bed', 'bath', 'bedbath', 'and', 'beyond'],'bedbatandbeyond'));
//  print(findInDictionary(['bedbat','bedbath', 'and', 'beyond'],'bedbathandbeyond'));
//}
Dictionary(List<String> dictionary, String text) {
  List<List<String>> list = [];
  List<List<String>> mainList= [];
  for (int i = 0; i < dictionary.length; i++) {
    if (text.startsWith(dictionary[i])) {
      List<String> temp = [];
      temp.add(dictionary[i]);
      temp.add(text.substring(dictionary[i].length));
      list.add(temp);
    }
  }
 // print(list);
  mainList=list;
  bool wordFound = false;
  String wordInDictionary;
  for (int i = 0; i < list.length; i++) {
   // print("Now we are starting with ${list[i]}");
    while (list[i][list[i].length - 1] != '') {//last element of list
      wordFound = false;
     // print('last word in list[i]=${list[i][list[i].length - 1]}');
      for (int j = 0; j < dictionary.length; j++) {
      //  print("Now we are comparing ${dictionary[j]} with ${list[i][list[i].length - 1]}");
        if (list[i][list[i].length - 1].startsWith(dictionary[j])) {
          wordFound = true;
          wordInDictionary = dictionary[j];
        }
      }
      if (wordFound) {
      //  print('${list[i][list[i].length - 1]}  found in dictionary   }');
        String temp = list[i][list[i].length - 1];
        list[i].removeLast();
        list[i].add(wordInDictionary);
       // print(list[i]);
        list[i].add(temp.substring(wordInDictionary.length));
       // print(list[i]);
      }
      if (!wordFound) {
      //  print('${list[i][list[i].length - 1]} NOT found in dictionary ');
     //   print('so now the present list is invalid . So it has to be deleted');
     //   print('list=${list}');
        list[i].add("INVALID");
        break;
        print('list=${list}');
      }
    }
  }
 // print("FINAL list=${list}");
  List<List<String>>result=[];
  for(int i=0;i<list.length;i++){
    if(!list[i].contains("INVALID")){
      result.add(list[i]);
    }
    }

//  print("FINAL list=${result}");
  if(result.isEmpty){
    return null;
  }
  else{
    result[0].removeLast();
    return result[0];
  }
}



void main() {
print(Dictionary(['a', 'bc', 'ab'], 'abcabf'));
 print(Dictionary(['a', 'bc', 'ab'], 'abcab'));
print(Dictionary(['quick', 'brown', 'the', 'fox'],'thequickbrownfox'));
print(Dictionary(['bed', 'bath', 'bedbath', 'and', 'beyond'],'bedbathandbeyond'));
print(Dictionary(['bed', 'bath', 'bedbath', 'and', 'beyond'],'bedbatandbeyond'));
print(Dictionary(['bedbat','bedbath', 'and', 'beyond'],'bedbathandbeyond'));
}
