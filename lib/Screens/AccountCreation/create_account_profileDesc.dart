import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ntmu/Screens/AccountCreation/create_account_hobbies.dart';
import 'package:ntmu/Models/UserInfo.dart';



class create_account_profileDesc extends StatelessWidget{

  final description = new TextEditingController();
  var profileImage;
  var awaitingImageParent = true;
  UserInfo creationData;
  create_account_profileDesc({Key? key, required this.creationData}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height:40),
                    Text('Select a profile picture!',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    SelectProfileImageWidget(onImageChanged: (image) => {UserInfoStatic.profilePicture = image}, awaitingImage: awaitingImageParent),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(height:25),
                          Text('Add a description about yourself!',
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                          Container(
                            height: 300,
                            child: TextFormField(
                              controller: description,
                              autovalidateMode: AutovalidateMode.always,
                              validator: (value){
                                if(value == null || value == ''){
                                  return 'Please enter a short description about yourself.';
                                }else{
                                  return null;
                                }
                              },
                              maxLines: 15,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                filled: true,
                                fillColor: Color(0X3399DDC8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          if(description.text == null || description.text == ''){
                            showDialog<String>(context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Error'),
                                  content: Text('Please provide us with a little bit of description about yourself.'),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () => Navigator.pop(context, 'OK'),
                                        child: const Text('Ok')
                                    )
                                  ],
                                )
                            );
                          }else{
                            convertToBase64Image();
                            creationData.profile_desc = description.text.trim();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_hobbies(creationData: creationData))));
                          }
                          //addHobbies(context);
                        },
                        child: Text(
                            'Next'
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                            minimumSize: Size(170,35)
                        )
                    ),
                    SizedBox(height:25)
                  ]
                ),
              )
          )
      ),
    );
  }

}

class SelectProfileImageWidget extends StatefulWidget {
  var onImageChanged;
  var awaitingImage;
  SelectProfileImageWidget({Key? key, required this.onImageChanged, required this.awaitingImage}) : super(key:key);

  @override
  SelectProfileImageWidgetState createState() => SelectProfileImageWidgetState();
}

class SelectProfileImageWidgetState extends State<SelectProfileImageWidget> {

  late File _image;
  final imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
          if(pickedFile != null){
            setState(() {
              _image = File(pickedFile.path);
              widget.awaitingImage = false;
              UserInfoStatic.profilePicture = _image;
              convertToBase64Image();
            });
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: (widget.awaitingImage ? AssetImage("images/blank-profile-picture-973460.png") : FileImage(UserInfoStatic.profilePicture)) as ImageProvider
              )
          ),
        )
    );

  }
}

Future convertToBase64Image () async {
  if(UserInfoStatic.profilePicture is AssetImage){

    ByteData bytes = await rootBundle.load("images/blank-profile-picture-973460.png");
    var buffer = bytes.buffer;
    var base64ImageString = base64.encode(Uint8List.view(buffer));
    UserInfoStatic.profilePictureBase64String = base64ImageString;
  }else{

    List <int> imageBytes = await UserInfoStatic.profilePicture.readAsBytesSync();
    String base64ImageString = base64Encode(imageBytes);
    UserInfoStatic.profilePictureBase64String = base64ImageString;
  }
}