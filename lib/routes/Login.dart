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
        children: <Widget>[
          //Logo
          Text('Emojation',style: TextStyle(fontSize: 32.0,),),
          //LoginButton
          RaisedButton(
            child: Row(
              children: <Widget>[
                Text('Google')
              ],
            ),
            //TODO handel login
            onPressed: null,
          )
        ],
      ),
    );
  }
}