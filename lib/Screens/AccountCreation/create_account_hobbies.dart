import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_confirmInformation.dart';
import 'package:ntmu/Models/UserInfo.dart';

class create_account_hobbies extends StatefulWidget{
  LoggedUserInfo creationData;
  create_account_hobbies({Key? key, required this.creationData}) : super(key:key);
  @override
  State<create_account_hobbies> createState() => create_account_hobbies_State();
}

class create_account_hobbies_State extends State<create_account_hobbies>{
  var listOfHobbies = ['Travel', 'Gardening', 'Gaming', 'Golf', 'Swimming', 'Caring for animals', 'Learning languages', 'Working out', 'Eating', 'Shopping',
    'Surfing', 'Cycling', 'Reading', 'Netflix', 'Drinking','Volunteering', 'Baking', ' Vlogging', 'Running', 'Filming','Hiking',
    'Fashion', 'Outdoors', 'Yoga', 'Photography', 'Walking', 'Football', 'Writing' , 'Politics', 'Climbing', 'Museum hopping', 'Caring for the environment',
    'Board Games', 'Art', 'E-sports', 'Dancing', 'Spirituality'];

  final _selections = List<bool>.generate(37, (i) => false);
  createOptionButtons(List hobbies){
    hobbies.sort();
    int indexNum = 0;
    var buttonList = <OutlinedButton>[];

    hobbies.forEach((element) {
      buttonList.add(new OutlinedButton(
          key: ValueKey(hobbies.indexOf(element)),
          onPressed: () {
            setState(() {
              _selections[hobbies.indexOf(element)] = !_selections[hobbies.indexOf(element)];
              //print(_selections[hobbies.indexOf(element)]);
            });
          },
          child: Text(element),
          style: OutlinedButton.styleFrom(
              backgroundColor: _selections[hobbies.indexOf(element)]? Color(0X3399DDC8) : Color(0X00000000),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          )
      ),
      );
      indexNum ++;
    });
    return buttonList;

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 60),
                    Align(
                      alignment: Alignment.center,
                      child: Text('What are some of your hobbies?',
                        style: TextStyle(
                          fontSize: 20
                        )
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(children: createOptionButtons(listOfHobbies)),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: (){
                          var counter = 0;
                          var submitHobbies = <String>[];
                          listOfHobbies.forEach((hobby) {
                            if(_selections[counter] == true){
                              submitHobbies.add(hobby);
                            }
                            counter+=1;
                          });
                          widget.creationData.hobbies = submitHobbies;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_confirmation(creationData: widget.creationData))));
                        },
                        child: Text(
                            'Next'
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                            minimumSize: Size(170,35)
                        )
                    ),
                    SizedBox(height: 20)
                  ],

                ),
              )
          )
      ),
    );
  }

}
