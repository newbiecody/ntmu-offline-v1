import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ntmu/Models/UserInfo.dart';

import 'create_account_religion.dart';

class create_account_birthday extends StatelessWidget{

  // UserInfo creationData = new UserInfo();
  UserInfo creationData;
  DateTime _selectedDate = DateTime.now();
  create_account_birthday({Key? key, required this.creationData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    child: TimePickerWidget(onDateChanged: (newDateTime) {
                      _selectedDate = newDateTime;
                    },)
                  ),
                  SizedBox(
                    height: 25
                  ),
                  ElevatedButton(
                      onPressed: (){
                        if(DateTime.now().year - _selectedDate.year < 17){
                          showDialog<String>(context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Error'),
                                content: Text('Please enter a valid birthday.' ),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('Ok')
                                  )
                                ],
                              )
                          );
                        }else{
                          creationData.birthday = _selectedDate;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_religion(creationData: creationData))));
                        }
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

class TimePickerWidget extends StatefulWidget{
  final ValueChanged<DateTime> onDateChanged;
  TimePickerWidget({Key? key, required this.onDateChanged}) : super(key: key);

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget>{
  DateTime selectedDate = DateTime.now();

  Future <void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970,8),
      lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        widget.onDateChanged(picked);
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
              fontSize: 18,
          ),
          ),
      ),
    );
  }

}

