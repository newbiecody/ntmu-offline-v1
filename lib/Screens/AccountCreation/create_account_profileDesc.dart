import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';

class create_account_profileDesc extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: ()=> uploadPhoto(),
                    child: CircleAvatar(
                      minRadius: 120,
                      maxRadius: 120,
                      backgroundColor: Color(0X3399DDC8),
                      child: Icon(
                        Icons.add_a_photo_rounded,
                        color: Color(0XFF99DDC8),
                        size: 35
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text('Add a description about yourself!',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                        Container(
                          height: 300,
                          child: TextField(
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
                        addHobbies(context);
                      },
                      child: Text(
                          'Next'
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                          minimumSize: Size(170,35)
                      )
                  )
                ]
              ),
            )
        )
    );
  }

}