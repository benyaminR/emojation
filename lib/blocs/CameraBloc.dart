part of emojation;


class CameraBloc extends BlocBase{
  StreamController<CameraController> _streamController = StreamController<CameraController>();
  Stream<CameraController> get cameraController => _streamController.stream;


  CameraBloc(){
    availableCameras().then((cameras){
      //sink controller for the first camera after initializing
      //cameras[1]  ---> front camera
      //cameras[0]  ---> back camera
      var controller = CameraController(cameras[1], ResolutionPreset.high);
      controller.initialize().then((_){
        _streamController.sink.add(controller);
      });
    });


  }

  @override
  void dispose() {
    _streamController.close();
  }
}