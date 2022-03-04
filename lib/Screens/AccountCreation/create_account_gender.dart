import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ntmu/Models/UserInfo.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_study.dart';

class create_account_gender extends StatelessWidget{

  UserInfo creationData;
  create_account_gender({Key? key, required this.creationData}) : super(key: key);
  var genderFormData = 'Male';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('What is your gender?',
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  SizedBox(height: 15),
                  GenderPicker(onGenderChanged: (data) {genderFormData = data;}),
                  SizedBox(height:25),
                  ElevatedButton(
                      onPressed: (){
                        creationData.gender = genderFormData;
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_study(creationData: creationData,))));
                      },
                      child: Text(
                          'Next'
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                          minimumSize: Size(170,35)
                      )
                  )
                ],

              )
          )
      ),
    );
  }

}

class GenderPicker extends StatefulWidget{
  final ValueChanged <String> onGenderChanged;
  GenderPicker({Key? key, required this.onGenderChanged}) : super(key: key);

  @override
  GenderPickerState createState() => GenderPickerState();
}

class GenderPickerState extends State<GenderPicker>{
  final genders = ['Male', 'Female', 'Others'];
  int selectedValue = 0;
  showYearPicker(){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return GestureDetector(
          child: CupertinoPicker(
            magnification: 1.1,
            children: const[
              Text('Male'),
              Text('Female'),
              Text('Others')
            ],
            itemExtent: 40,
            onSelectedItemChanged: (value) => {
              widget.onGenderChanged(genders[value]),
              setState( ()=> selectedValue = value
              ),
            },
          ),
          onTap: ()=>{Navigator.pop(context)},
        );
      },
    );
  }

  @override
  Widget build(buildContext){
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(
              color: Color(0X3399DDC8),
              spreadRadius: 3,
              blurRadius: 2,
              offset: Offset(0, 3)
          )
          ]
      ),
      child: GestureDetector(
          onTap: () => showYearPicker(),
          child: Text(genders[selectedValue],
            style: TextStyle(
                fontSize: 20
            ),
          )
      ),
    );
  }

}

