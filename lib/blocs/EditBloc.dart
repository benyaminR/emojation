part of emojation;

class EditBloc extends BlocBase{
  StreamController<Null> _streamController = StreamController<Null>();
  
  Future<Null> add(IconData emoji, String description)async{
    var sp = await SharedPreferences.getInstance();
    var id = sp.get(USER_ID);
    var date = DateTime.now().millisecondsSinceEpoch;
    await Firestore
        .instance
        .collection('users')
        .document(id)
        .collection('moods')
        .document(date.toString())
        .setData(
        {
          'mood':emoji.codePoint,
          'description':description,
          'added':date}
    );
  }
  
  
  @override
  void dispose() {
    _streamController.close();
  }
}