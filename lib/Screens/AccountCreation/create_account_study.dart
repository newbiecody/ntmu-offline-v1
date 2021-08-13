import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ntmu/Components/functs.dart';

class create_account_study extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
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
                CoursePicker(),
                SizedBox(height:20),
                Text('Which year of study are you currently in?',
                  style: TextStyle(
                    fontSize: 20
                  )
                ),
                YearOfStudyPicker(),
                SizedBox(height:25),
                ElevatedButton(
                    onPressed: (){
                      uploadProfileDescription(context);
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
    );
  }

}

class YearOfStudyPicker extends StatefulWidget{
  YearOfStudyPicker({Key? key}) : super(key: key);

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
                setState( ()=> selectedValue = yearOfStudy[value],
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
            fontSize: 25
          ),
        )
      ),
    );
  }

}


class CoursePicker extends StatefulWidget{
  CoursePicker({Key? key}) : super(key: key);

  @override
  _CoursePickerWidgetState createState() => _CoursePickerWidgetState();
}

class _CoursePickerWidgetState extends State<CoursePicker>{
  final courseList = ['Computer Science','Chemical Engineering','Humanities','Psychology'];
  String selectedValue = '-Please Select a course-';

  showCoursePicker(){       //still requires database to before coding it out properly.
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return GestureDetector(
          child: CupertinoPicker(
            magnification: 1.1,
            children: const[
              Text('Computer Science'),
              Text('Chemical Engineering'),
              Text('Humanities'),
              Text('Psychology')
            ],
            itemExtent: 40,
            onSelectedItemChanged: (value) => {
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
                fontSize: 25
            ),
          )
      ),
    );
  }

}


