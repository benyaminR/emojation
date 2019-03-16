library emojation;

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'consts.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'utils/timeConverter.dart';


part 'routes/Login.dart';
part 'blocs/LoginBloc.dart';
part 'routes/Main.dart';
part 'blocs/BottomNavBarBloc.dart';
part 'routes/Home.dart';
part 'blocs/HomeBloc.dart';
part 'routes/Camera.dart';
part 'blocs/CameraBloc.dart';
part 'utils/emojiUtil.dart';
part 'routes/Edit.dart';
part 'blocs/EditBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>Login(),
        '/main':(context)=>Main(),
        '/main/edit':(context)=>Edit()
      },
    );
  }
}
