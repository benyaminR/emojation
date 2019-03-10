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
    print('build called');
    final bloc = BlocProvider.of<BottomNavBarBloc>(context);
    return StreamBuilder(
      stream: bloc.itemStream,
      initialData: 0,
      builder: (context,index){
        return Scaffold(
          appBar: AppBar(title: Text('main'),),
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
}