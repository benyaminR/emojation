part of emojation;

class EditBloc extends BlocBase{
  StreamController<Null> _streamController = StreamController<Null>();
  
  Future<Null> add(IconData emoji, String description)async{
    var sp = await SharedPreferences.getInstance();
    var id = sp.get(USER_ID);
    await Firestore
        .instance
        .collection('users')
        .document(id)
        .collection('moods')
        .add({
      'mood':emoji.codePoint,
      'description':description,
      'added':DateTime.now().millisecondsSinceEpoch});
  }
  
  
  @override
  void dispose() {
    _streamController.close();
  }
}