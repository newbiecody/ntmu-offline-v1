import 'package:flutter/material.dart';
import 'package:ntmu/Models/chatUser.dart';

class openChatPage extends StatefulWidget{
  chatUser individualChat;
  openChatPage({Key? key, required this.individualChat});
  @override
  State<openChatPage> createState() => openChatPageState();
}

class openChatPageState extends State<openChatPage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(builder:
              (BuildContext context){
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () => Navigator.pop(context),
            );
          }
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(backgroundImage: AssetImage(widget.individualChat.imageURL)),
                    SizedBox(width: 10),
                    Text(widget.individualChat.name)
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*.1)
            ]
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: MediaQuery.of(context).size.width*.75,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Text...'
                    ),
                  ),
                ),
                FloatingActionButton(
                    child: Icon(Icons.send_rounded),
                    onPressed: (){
                  //sendMessage()
                  }
                )

              ],
            ),
          )
        ),
      ),
    );
  }

}