import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/UserInfo.dart';

import 'create_account_gender.dart';

class create_account_countryOfOrigin extends StatelessWidget{

  UserInfo creationData;
  create_account_countryOfOrigin({Key? key, required this.creationData}) : super(key: key);

  var countryFormData = PopulateSignupFormData.list_allCountries[0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('What is your country of origin?',
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  SizedBox(height: 15),
                  CountryPicker(onCountryChanged: (data) {countryFormData = data;}),
                  SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: (){
                        creationData.country_of_origin = countryFormData;
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_gender(creationData: creationData))));
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

class CountryPicker extends StatefulWidget{
  final ValueChanged<String> onCountryChanged;
  CountryPicker({Key? key, required this.onCountryChanged}) : super(key: key);

  @override
  CountryPickerWidgetState createState() => CountryPickerWidgetState();
}

class CountryPickerWidgetState extends State<CountryPicker>{

  final listOfCountries = PopulateSignupFormData.list_allCountries;
  String selectedValue = PopulateSignupFormData.list_allCountries[0];

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
            children: cupertinoOptionsGenerator(listOfCountries),
            itemExtent: 60,
            onSelectedItemChanged: (value) => {
              widget.onCountryChanged(listOfCountries[value]),
              setState( ()=> selectedValue = listOfCountries[value],
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


