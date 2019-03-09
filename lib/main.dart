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
import 'package:rxdart/rxdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'routes/Login.dart';
part 'blocs/LoginBloc.dart';
part 'routes/Main.dart';

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
        '/main':(context)=>Main()
      },
    );
  }
}
