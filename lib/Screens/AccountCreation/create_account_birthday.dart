import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:intl/intl.dart';

class create_account_birthday extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('When is your birthday?',
                  style: TextStyle(
                    fontSize: 20
                    ),
                ),
                SizedBox(
                  height:25
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0X3399DDC8),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      )],
                  ),
                  child: TimePickerWidget()
                ),
                SizedBox(
                  height: 25
                ),
                ElevatedButton(
                    onPressed: (){
                      askCourseYear(context);
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

class TimePickerWidget extends StatefulWidget{
  TimePickerWidget({Key? key}) : super(key: key);

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget>{
  DateTime selectedDate = DateTime.now();

  Future <void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015,8),
      lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(buildContext){
    final DateFormat formatter = DateFormat('d MMMM y');
    String formattedDate = formatter.format(selectedDate);
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '${formatter.format(selectedDate)}',
          style: TextStyle(
              fontSize: 30,
          ),
          ),
      ),
    );
  }

}

