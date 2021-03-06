part of emojation;

class LoginBloc {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> loginWithGoogle(data)async{
    GoogleSignInAccount currentUser = _googleSignIn.currentUser;
    if(currentUser == null){
      currentUser = await _googleSignIn.signInSilently();
    }
    if(currentUser == null){
      currentUser = await _googleSignIn.signIn();
    }

    //google authentication
    GoogleSignInAuthentication _googleAuthentication = await currentUser.authentication;

    //AuthCredential
    var credential = GoogleAuthProvider.getCredential(
        idToken: _googleAuthentication.idToken,
        accessToken: _googleAuthentication.accessToken
    );

    var firebaseUser = await _firebaseAuth.signInWithCredential(credential);

    var sp = await SharedPreferences.getInstance();
    sp.setString(USER_ID, firebaseUser.uid);

    return firebaseUser;
  }

}