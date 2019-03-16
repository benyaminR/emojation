part of emojation;

class HomeBloc extends BlocBase{
  StreamController<QuerySnapshot> _moodStreamController = StreamController<QuerySnapshot>();
  Stream<QuerySnapshot> get moodStream => _moodStreamController.stream;


  HomeBloc(){
    SharedPreferences.getInstance().then((sp){
      var id = sp.get(USER_ID);
      Firestore
          .instance
          .collection('users')
          .document(id)
          .collection('moods')
          .getDocuments()
          .then((snapshot)=>_moodStreamController.sink.add(snapshot));
    });

  }

  delete(String date){
    SharedPreferences.getInstance().then((sp) {
      var id = sp.get(USER_ID);
      Firestore
          .instance
          .collection('users')
          .document(id)
          .collection('moods')
          .document(date)
          .delete();
    });

  }
  @override
  void dispose() {
    _moodStreamController.close();
  }
}