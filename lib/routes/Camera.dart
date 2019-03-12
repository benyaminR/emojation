part of emojation;


class Camera extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CameraBloc>(
      child: CameraUI(),
      bloc: CameraBloc(),
    );
  }
}

class CameraUI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CameraBloc>(context);
    var size = MediaQuery.of(context).size;
    return StreamBuilder<CameraController>(
        stream: bloc.cameraController,
        builder: (context,snapshot){
          if(!snapshot.hasData)
            return Container(decoration: BoxDecoration(color: Colors.black),);
          if(snapshot.data.value.isInitialized)
            return Container(
              width: size.width,
              height: size.height,
              child: AspectRatio(
                aspectRatio:snapshot.data.value.aspectRatio,
                child: CameraPreview(snapshot.data),
              ),
            );
        },
    );

  }
}