//used in account creation, possibly reused to retrieve different user data

// class UserInfo{
//   late String email;
//   late String name;
//   late DateTime birthday;
//   late String Gender; //Male, Female or Others
//   late List<String> hobbies;
//   late religion;
//   late String password;
//   late String profile_desc;
//   late String course;
//   late int year;
//
// }


//Testing UserAccount
class UserInfo{
  String email = 'testUser1@e.ntu.edu.sg';
  String name = 'Test User 1';
  DateTime birthday = DateTime(1990, 2, 12);
  String gender = 'Male';
  List<String> hobbies = ['Swimming', 'Dancing', 'Jogging', 'Studying', 'Music', 'Stargazing'];
  String religion = 'Christianity';
  String password = '1234567890';
  String profile_desc = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget elit tempor diam ullamcorper lobortis tempor non nisl. Morbi massa erat, bibendum eu fringilla eu, interdum eget ligula. In pharetra justo tellus, a vehicula sem vestibulum a. Quisque sed sollicitudin.';
  String course = 'Accountancy';
  int year = 1;
}