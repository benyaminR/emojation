part of emojation;

class HomeBloc extends BlocBase{
  StreamController<dynamic> _moodStreamController = StreamController<dynamic>();
  Stream<dynamic> get moodStream => _moodStreamController.stream;


  HomeBloc(){
    _moodStreamController.sink.add(List.generate(100, (index)=>'$index'));
  }


  @override
  void dispose() {
    _moodStreamController.close();
  }
}