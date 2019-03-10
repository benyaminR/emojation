part of emojation;

class Login extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final bloc = LoginBloc();

    //redirect user to main if he is logged in
    FirebaseAuth.
    instance.
    onAuthStateChanged.
    listen((user)=> user!= null ? Navigator.of(context).pushReplacementNamed('/main'):null);

    return Scaffold(
        appBar: AppBar(title: Text('Login'),),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                //calls signInWithGoogle and redirect to main
                onPressed: ()=> bloc.
                loginWithGoogle(null).
                then((user)=>user!=null?Navigator.of(context).pushReplacementNamed('/main'):null),
              )
            ],
          ),
        )
    );

  }
}

