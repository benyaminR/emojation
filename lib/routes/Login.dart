part of emojation;

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>LoginState();
}

class LoginState extends State<Login>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  ///appBar
  Widget _appBar(){
    return AppBar(
      title: Text('Login'),
    );
  }
  ///mainBody
  Widget _body(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Logo
          Container(
            margin: EdgeInsets.only(bottom: 100.0),
            child:Text('Emojation',style: TextStyle(fontSize: 32.0,),),
          ),
          //LoginButton
          RaisedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //icon
                Container(
                  child: Icon(MaterialCommunityIcons.google,),
                  margin: EdgeInsets.only(right: 8.0) ,
                ),
                //text
                Text('Login')
              ],
            ),
            //TODO handel login
            onPressed: (){},
          )
        ],
      ),
    );
  }
}