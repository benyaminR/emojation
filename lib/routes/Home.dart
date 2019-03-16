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
    //access to HomeBloc
    final bloc = BlocProvider.of<HomeBloc>(context);

    return StreamBuilder<QuerySnapshot>(
      stream: bloc.moodStream,//stream of moods
      builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> moods){
        //show a progressIndicator
        if(moods.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        //error
        if(moods.data == null)
          return Center(child: Text('add'),);
        //show moods
        return ListView.builder(
            itemCount:moods.data.documents.length,
            itemBuilder: (context,index){
              return ListTile(
                leading: Icon(IconData(
                    moods.data.documents[index]['mood'],
                    fontFamily: "MaterialCommunityIcons",
                    fontPackage: "flutter_vector_icons")
                    ,size: 50.0,
                ),
                title: Text(moods.data.documents[index]['description'],),
                subtitle: Text(convertDate(moods.data.documents[index]['added'])),
              );
            }
        );
      },
    );
  }
}