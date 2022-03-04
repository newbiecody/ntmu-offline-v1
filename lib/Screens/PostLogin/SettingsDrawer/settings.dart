import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/UserInfo.dart';

import '../../../Models/UserInfo_secure.dart';

class settingsPage extends StatefulWidget{
  UserInfoFlexi_noPassword userData;
  settingsPage({Key? key, required this.userData}) : super(key:key);

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {

  final _changePasswordForm = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController1 = TextEditingController();
  final newPasswordController2 = TextEditingController();

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
            // Form(
            //   key: _changePasswordForm,
            //   child: Column(
            //       children: <Widget> [
            //         Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            //             child: TextFormField(
            //             controller: currentPasswordController,
            //             decoration: InputDecoration.collapsed(
            //               //border: InputBorder.none,
            //               hintText: 'Enter current password',
            //             ),
            //           )
            //         ),
            //         Divider(color: Color(0X80000000)),
            //         Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            //             child: TextFormField(
            //               autovalidateMode: AutovalidateMode.always,
            //               validator: (value){
            //                 (value!.isEmpty || value == '')? 'Please enter a new password.' : null;
            //               },
            //               controller: newPasswordController1,
            //               decoration: InputDecoration.collapsed(
            //                 //border: InputBorder.none,
            //                 hintText: 'Enter new password',
            //               ),
            //             )
            //         ),
            //         Divider(color: Colors.black),
            //         Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            //             child: TextFormField(
            //               autovalidateMode: AutovalidateMode.always,
            //               validator: (value){
            //                 if (newPasswordController1.text != value){
            //                   return 'Your new passwords don\'t match. Please try again...';
            //                 }
            //                 (value!.isEmpty || value == '')? 'Please confirm your new password.' : null;
            //               },
            //               controller: newPasswordController2,
            //               decoration: InputDecoration.collapsed(
            //                 border: InputBorder.none,
            //                 hintText: 'Confirm new password',
            //               ),
            //             )
            //         ),
            //         SizedBox(height: 15),
            //         ElevatedButton(
            //           onPressed: (){
            //             //Check if current password equals to new password
            //             if(widget.userData.password != currentPasswordController.text.trim()){
            //               showDialog<String>(
            //                   context: context,
            //                   builder: (BuildContext context) => AlertDialog(
            //                 title: const Text('Error'),
            //                 content: const Text('The entered \'Current Password\' is incorrect. Please try again.'),
            //                 actions: <Widget>[
            //                   TextButton(
            //                     onPressed: () => Navigator.pop(context, 'OK'),
            //                     child: const Text('OK'),
            //                   ),
            //                 ],
            //               ));
            //             }else{
            //               showDialog<String>(
            //                   context: context,
            //                   builder: (BuildContext context) => AlertDialog(
            //                 title: const Text('Confirmation'),
            //                 content: const Text('Are you sure that you want to change your password?'),
            //                 actions: <Widget>[
            //                   TextButton(
            //                     onPressed: () => Navigator.pop(context, 'No'),
            //                     child: const Text('No'),
            //                   ),
            //                   TextButton(
            //                     onPressed: () => Navigator.pop(context, 'Yes'),
            //                     child: const Text('Yes'),
            //                   ),
            //                 ],
            //               ));
            //             }
            //           }
            //           ,
            //           child: Text('Confirm password change'),
            //           style: ElevatedButton.styleFrom(
            //               shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
            //               minimumSize: Size(170,35)
            //           ),
            //         )
            //     ]
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}