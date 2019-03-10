part of emojation;

class BottomNavBarBloc extends BlocBase{
  StreamController<int> _itemStreamController = StreamController<int>();
  Stream<int> get itemStream => _itemStreamController.stream;


  void selectItem(int index){
    //update item
    _itemStreamController.sink.add(index);
  }

  @override
  void dispose() {
    _itemStreamController.close();
  }
}