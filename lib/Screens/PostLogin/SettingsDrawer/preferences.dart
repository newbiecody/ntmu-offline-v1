import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';

class preferencePage extends StatefulWidget{
  const preferencePage({Key? key}) : super(key:key);

  @override
  State<preferencePage> createState() => _preferencePageState();
}

class _preferencePageState extends State<preferencePage> {

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
        title: Text('Preferences for matches'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget> [

          ],
        ),
      )
    );
  }
}