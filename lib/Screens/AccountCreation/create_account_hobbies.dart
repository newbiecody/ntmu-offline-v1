import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:intl/intl.dart';

class create_account_hobbies extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('What are some of your hobbies? (Psst don\'t worry, you can share more about your other hobbies in your self-summary!'),
                SelectHobbyWidget(),
                ElevatedButton(
                    onPressed: (){
                      RegisterNewAccountInformation(context);
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

class SelectHobbyWidget extends StatefulWidget{
  SelectHobbyWidget({Key? key}) : super(key: key);

  @override
  _SelectHobbyWidgetState createState() => _SelectHobbyWidgetState();
}

class _SelectHobbyWidgetState extends State<SelectHobbyWidget> {
  final _selections = new List<bool>.generate(4, (i) => false);
  @override
  Widget build(buildContext) {
    return ToggleButtons(
        isSelected: _selections,
        onPressed: (int index) {
          setState(() {
            _selections[index] = !_selections[index];
          });
        },
        children: <Widget>[
          Text('Reading'),
          Text('Sports'),
          Text('Gaming'),
          Text('Star Gazing')
        ]
    );
  }
}

