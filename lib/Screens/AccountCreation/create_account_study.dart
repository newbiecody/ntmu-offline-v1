import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_profileDesc.dart';
import 'package:ntmu/Models/UserInfo.dart';

class create_account_study extends StatelessWidget{

  UserInfo creationData;
  create_account_study({Key? key, required this.creationData}) : super(key: key);
  var yearFormData = 1;
  var courseFormData = 'Accountancy';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('What is your course of study?',
                    style: TextStyle(
                      fontSize: 20
                      ),
                  ),
                  SizedBox(height: 15),
                  CoursePicker(onCourseChanged: (data) {courseFormData = data;}),
                  SizedBox(height:20),
                  Text('Which year of study are you currently in?',
                    style: TextStyle(
                      fontSize: 20
                    )
                  ),
                  SizedBox(height: 15),
                  YearOfStudyPicker(onYearChanged: (data){yearFormData = data;}),
                  SizedBox(height:25),
                  ElevatedButton(
                      onPressed: (){
                        creationData.year_of_matriculation = yearFormData;
                        creationData.course = courseFormData;
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_profileDesc(creationData: creationData,))));
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

class YearOfStudyPicker extends StatefulWidget{
  final ValueChanged <int> onYearChanged;
  YearOfStudyPicker({Key? key, required this.onYearChanged}) : super(key: key);

  @override
  _YearOfStudyPickerWidgetState createState() => _YearOfStudyPickerWidgetState();
}

class _YearOfStudyPickerWidgetState extends State<YearOfStudyPicker>{
  final yearOfStudy = [1,2,3,4];
  int selectedValue = 1;
  showYearPicker(){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return GestureDetector(
            child: CupertinoPicker(
              magnification: 1.1,
              children: const[
                Text('1'),
                Text('2'),
                Text('3'),
                Text('4')
              ],
              itemExtent: 40,
              onSelectedItemChanged: (value) => {
                widget.onYearChanged(yearOfStudy[value]),
                setState( ()=> selectedValue = yearOfStudy[value]
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
        child: Text('${selectedValue}',
          style: TextStyle(
            fontSize: 20
          ),
        )
      ),
    );
  }

}


class CoursePicker extends StatefulWidget{
  final ValueChanged<String> onCourseChanged;
  CoursePicker({Key? key, required this.onCourseChanged}) : super(key: key);

  @override
  _CoursePickerWidgetState createState() => _CoursePickerWidgetState();
}

class _CoursePickerWidgetState extends State<CoursePicker>{

  //final courseList = readByLine_txt('assets/allcourses.txt');
  final courseList = list_allCourses;
  String selectedValue = list_allCourses[0];

  cupertinoOptionsGenerator(List listOfCourses){
    var optionsList = <Text>[];
    listOfCourses.sort();
    listOfCourses.forEach((element){
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
            children: cupertinoOptionsGenerator(courseList),
            itemExtent: 60,
            onSelectedItemChanged: (value) => {
              widget.onCourseChanged(courseList[value]),
              setState( ()=> selectedValue = courseList[value],
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


