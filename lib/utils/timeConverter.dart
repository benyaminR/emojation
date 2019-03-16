

String convertDate(int unix){
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(unix);
  //add a zero for minuets
  return '${date.day}/${date.month}/${date.year}';

}