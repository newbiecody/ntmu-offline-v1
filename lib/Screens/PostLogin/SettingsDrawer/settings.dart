import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';

class settingsPage extends StatefulWidget{
  const settingsPage({Key? key}) : super(key:key);

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {

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
        title: Text('Settings'),
        centerTitle: true,
      ),
    );
  }
}