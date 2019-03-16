part of emojation;


class Edit extends StatelessWidget{

  final IconData emoji;
  Edit({@required this.emoji});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditBloc>(
      child: EditUI(emoji),
      bloc: EditBloc(),
    );
  }

}

class EditUI extends StatelessWidget{
  final IconData emoji;
  EditUI(this.emoji);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    var bloc = BlocProvider.of<EditBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('edit'),),
      body: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8.0),
            child:Icon(emoji,size: 60.0,),
          ),
          Flexible(
            child:Container(
              margin: EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                maxLength: 100,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'describe your emojation ...',
                ),
              ),
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> bloc.add(emoji, textEditingController.value.text).then((_)=>Navigator.pop(context)),
        child: Icon(MaterialCommunityIcons.check),
      ),
    );
  }
}