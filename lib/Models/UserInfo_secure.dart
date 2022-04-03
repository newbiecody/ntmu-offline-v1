class UserInfoFlexi_noPassword{
  String? username;
  String? email;
  String? name;
  DateTime? birthday;
  String? gender;
  List<String>? hobbies;
  String? religion;
  String? profile_desc;
  String? course;
  int? year_of_matriculation;
  String? country_of_origin;

  UserInfoFlexi_noPassword({this.username, this.email, this.name, this.birthday, this.gender, this.hobbies, this.religion,
    this.profile_desc, this.course, this.year_of_matriculation, this.country_of_origin
  });

  Map <dynamic, dynamic> toMap(){
    return{
      'username' : username,
      'email' : email,
      'name' : name,
      'birthday' : birthday,
      'gender' : gender,
      'hobbies' : hobbies,
      'religion' : religion,
      'profile_desc' : profile_desc,
      'course' : course,
      'year_of_matriculation' : year_of_matriculation,
      'country_of_origin' : country_of_origin
    };
  }

  fromJson(Map data){
    this.name = data['fullname'];
    this.email = data['email'];
    this.username = data['username'];
    if(data['birthday'] != null){this.birthday = DateTime.parse(data['birthday']);}
    this.gender = data['gender'];
    if(data['hobbies'] != ""){
      List<String> hobbiesList = data['hobbies'].split(",");
      this.hobbies = hobbiesList;
    }
    this.country_of_origin = data['countryOfOrigin'];
    this.religion = data['religion'];
    this.profile_desc = data['profileDesc'];
    this.course = data['course'].replaceAll("\n", "");
    this.year_of_matriculation = int.parse(data['matriculationYear']);
  }
}
