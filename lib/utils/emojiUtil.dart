part of emojation;

///return an Icon for the corresponding selfie
Future<IconData> analyzeImage(String filePath) async{
  var image = File(filePath);
  //convert to Firebase vision file
  var mlFile = FirebaseVisionImage.fromFile(image);
  //options
  var options = FaceDetectorOptions(enableLandmarks: true,enableClassification: true,);
  //list of faces
  List<Face> faces = await FirebaseVision.instance.faceDetector(options).processImage(mlFile);
  if(faces.isNotEmpty)
    return _findEmoji(faces[0]);
  return Future.value(IconData(000000));
}

IconData _findEmoji(Face face){
  var smile = face.smilingProbability;
  var leftEye = face.leftEyeOpenProbability;
  var rightEye = face.rightEyeOpenProbability;
  print('smile : $smile \n left : $leftEye \n right : $rightEye');
  var icon;
  if(smile > 0.3 && leftEye > 0.6 && rightEye > 0.6){
    icon = MaterialCommunityIcons.emoticon_happy;
  }else if(smile > 0.6 && leftEye < 0.8 && rightEye < 0.8){
    icon = MaterialCommunityIcons.emoticon_excited;
  }else if(leftEye < 0.6 || rightEye < 0.6){
    icon = MaterialCommunityIcons.emoticon_wink;
  }else if(smile < 0.3){
    icon = MaterialCommunityIcons.emoticon_sad;
  }else {
    icon = MaterialCommunityIcons.emoticon_neutral;
  }
  return icon;

}

