import 'package:flutter/cupertino.dart';
import 'package:ntmu/api_functions/callLogin.dart';

import 'apiMessageDialog.dart';

Future retrievePassword(BuildContext context) async {
  var token = checkForToken();
  if(token != null){

  }else{
    showApiMessageDialog(context, "Error", "Please log in again.");
  }
}