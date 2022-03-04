import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/UserInfo.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_countryOfOrigin.dart';

class create_account_religion extends StatelessWidget{

  UserInfo creationData;
  create_account_religion({Key? key, required this.creationData}) : super(key: key);

  var religionFormData = PopulateSignupFormData.list_allMajorReligions[0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('What is your religion?',
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  SizedBox(height: 15),
                  ReligionPicker(onReligionChanged: (data) {religionFormData = data;}),
                  SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: (){
                        creationData.religion = religionFormData;
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_countryOfOrigin(creationData: creationData))));
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

class ReligionPicker extends StatefulWidget{
  final ValueChanged<String> onReligionChanged;
  ReligionPicker({Key? key, required this.onReligionChanged}) : super(key: key);

  @override
  ReligionPickerWidgetState createState() => ReligionPickerWidgetState();
}

class ReligionPickerWidgetState extends State<ReligionPicker>{

  final listOfReligions = PopulateSignupFormData.list_allMajorReligions;
  String selectedValue = PopulateSignupFormData.list_allMajorReligions[0];

  cupertinoOptionsGenerator(List religions){
    var optionsList = <Text>[];
    religions.sort();
    religions.forEach((element){
      optionsList.add(new Text(element));
    });
    return optionsList;
  }

  showCoursePicker(){       //still requires database to before coding it out properly.
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return GestureDetector(
          child: CupertinoPicker(
            magnification: 0.8,
            children: cupertinoOptionsGenerator(listOfReligions),
            itemExtent: 60,
            onSelectedItemChanged: (value) => {
              widget.onReligionChanged(listOfReligions[value]),
              setState( ()=> selectedValue = listOfReligions[value],
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
          onTap: () => showCoursePicker(),
          child: Text('${selectedValue}',
            style: TextStyle(
                fontSize: 18
            ),
          )
      ),
    );
  }

}


