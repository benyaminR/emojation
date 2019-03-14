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
          return Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio:snapshot.data.value.aspectRatio,
                child: CameraPreview(snapshot.data),
              ),
              Positioned(
                child: Container(
                  child: FloatingActionButton(
                    onPressed:()=> bloc.capture().then((emoji)=> Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Edit(emoji:emoji ,)))),
                    child: Icon(MaterialCommunityIcons.camera),
                  ),
                  width: 60.0,
                  height: 60.0,
                ),
                bottom: 8.0,
                left: (size.width / 2) - 30.0,
              )
            ],
          );
      },
    );

  }
}