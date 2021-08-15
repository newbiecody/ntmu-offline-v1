import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';

class feedbackPage extends StatefulWidget{
  const feedbackPage({Key? key}) : super(key:key);

  @override
  State<feedbackPage> createState() => _feedbackPageState();
}

class _feedbackPageState extends State<feedbackPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder:
            (BuildContext context){
          return IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () => Navigator.pop(context),
          );
        }
        ),
        title: Text('Feedback'),
        centerTitle: true,
      ),
    );
  }
}