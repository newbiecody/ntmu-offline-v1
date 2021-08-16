import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';

class settingsPage extends StatefulWidget{
  const settingsPage({Key? key}) : super(key:key);

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {

  final _changePasswordForm = GlobalKey<FormState>();

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
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                    color: Color(0X8099DDC8)
                ),
                height: 40,
                child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget> [Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            child: Text('Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                    ]
                )
            ),
            Form(
              key: _changePasswordForm,
              child: Column(
                  children: <Widget> [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: TextFormField(
                        decoration: InputDecoration.collapsed(
                          //border: InputBorder.none,
                          hintText: 'Enter current password',
                        ),
                      )
                    ),
                    Divider(color: Color(0X80000000)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                            //border: InputBorder.none,
                            hintText: 'Enter new password',
                          ),
                          validator: (value){
                            //insert logic to lock change password button below
                          },
                        )
                    ),
                    Divider(color: Color(0X80000000)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                            border: InputBorder.none,
                            hintText: 'Confirm new password',
                          ),
                          validator: (value){
                            //insert logic to lock change password button below
                          },
                        )
                    ),
                    ElevatedButton(
                      onPressed: () {confirmEditPassword();},
                      child: Text('Confirm password change'),
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                          minimumSize: Size(170,35)
                      ),
                    )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}