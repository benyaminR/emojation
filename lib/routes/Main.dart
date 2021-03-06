part of emojation;


class Main extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavBarBloc>(
      child: MainWidget(),
      bloc: BottomNavBarBloc(),
    );
  }
}

class MainWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BottomNavBarBloc>(context);
    return StreamBuilder(
      stream: bloc.itemStream,
      initialData: 0,
      builder: (context,index){
        return Scaffold(
          appBar: index.data == 1?null:AppBar(title: Text('main'),),
          body: _body(index.data,context,bloc),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index)=>bloc.selectItem(index),
              currentIndex: index.data,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(MaterialCommunityIcons.home),
                  title: Text(('home')),
                ),
                BottomNavigationBarItem(
                  icon: Icon(MaterialCommunityIcons.camera),
                  title: Text(('camera')),
                ),
                BottomNavigationBarItem(
                    icon: Icon(MaterialCommunityIcons.chart_bar),
                    title: Text(('statistics'))
                ),
              ]),
        );
      },
    );
  }
  Widget _body(int index,context,bloc){
    switch(index){
      case 0 :
        return Home();
      case 1 :
        return Camera();
      case 2 :
        return Center(child: Text('statsitics'),);
    }
    return Center(child: Text('error'),);
  }

}