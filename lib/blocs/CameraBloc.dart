part of emojation;


class CameraBloc extends BlocBase{
  StreamController<CameraController> _streamController = StreamController<CameraController>();
  Stream<CameraController> get cameraController => _streamController.stream;

  CameraController _controller;

  CameraBloc(){
    //sink controller for the front camera after initializing
    //cameras[1]  ---> front camera
    //cameras[0]  ---> back camera
    availableCameras().then((cameras){
      _controller = CameraController(cameras[1], ResolutionPreset.high);
      _controller.initialize().then((_){
        _streamController.sink.add(_controller);
      });
    });
  }

  Future<IconData> capture()async{
    var tempDir = await getTemporaryDirectory();
    var tempFile = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    await _controller.takePicture(tempFile);
    return analyzeImage(tempFile);
  }


  @override
  void dispose() {
    _streamController.close();
  }
}