part of emojation;

class Main extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('main'),),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(MaterialCommunityIcons.home),
              title: Text(('home'))
            ),
            BottomNavigationBarItem(
              icon: Icon(MaterialCommunityIcons.camera),
                title: Text(('camera'))
            ),
            BottomNavigationBarItem(
                icon: Icon(MaterialCommunityIcons.chart_bar),
                title: Text(('statistics'))
            ),
          ]),
    );
  }
}