part of emojation;

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      child: HomeUI(),
      bloc: HomeBloc(),
    );
  }
}

class HomeUI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);

    return StreamBuilder(
      stream: bloc.moodStream,
      builder: (context,moods){
        if(moods.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        if(moods.data == null)
          return Center(child: Text('error'),);
        return ListView.builder(
            itemCount: moods.data.length,
            itemBuilder: (context,index){
              return ListTile(
                title: Text(moods.data[index]),
              );
            });
      },
    );
  }
}