class GeneralAccountInfo{
  int id;
  String fullName;
  String description;
  DateTime dateOfBirth;
  int yearOfMatriculation;
  //avatar image to be added if possible
  int countryOfOriginID;
  int courseOfStudyID;
  int genderID;
  int userID;
  //avatar_full
  //isOnDemanding
  GeneralAccountInfo({required this.id, required this.fullName, required this.description,required this.dateOfBirth, required this.yearOfMatriculation, required this.countryOfOriginID, required this.courseOfStudyID, required this.genderID, required this.userID });
}


//Test accounts
var account1 = GeneralAccountInfo(id: 1, fullName: 'Lim Xiao Ming', description: 'Hi, I\'m user number 1', dateOfBirth:  DateTime.utc(1996, 11,9), yearOfMatriculation: 4, countryOfOriginID: 1, courseOfStudyID: 1, genderID: 1, userID: 1);
var account2 = GeneralAccountInfo(id: 2, fullName: 'Cassandra', description: 'Hi, I\'m user number 2', dateOfBirth:  DateTime.utc(2000, 12,31), yearOfMatriculation: 2, countryOfOriginID: 1, courseOfStudyID: 1, genderID: 2, userID: 2);
var account3 = GeneralAccountInfo(id: 3, fullName: 'Donald Liao', description: 'Hi, I\'m user number 3', dateOfBirth:  DateTime.utc(1999, 1,28), yearOfMatriculation: 1, countryOfOriginID: 1, courseOfStudyID: 1, genderID: 1, userID: 3);
var account4 = GeneralAccountInfo(id: 4, fullName: 'Jacob Lee', description: 'Hi, I\'m user number 4', dateOfBirth:  DateTime.utc(1990, 2,18), yearOfMatriculation: 3, countryOfOriginID: 1, courseOfStudyID: 1, genderID: 2, userID: 4);
var account5 = GeneralAccountInfo(id: 5, fullName: 'Jonathan ong', description: 'Hi, I\'m user number 5', dateOfBirth:  DateTime.utc(1998, 5,3), yearOfMatriculation: 4, countryOfOriginID: 1, courseOfStudyID: 1, genderID: 1, userID: 5);
var account6 = GeneralAccountInfo(id: 6, fullName: 'Tundra Lesley', description: 'Hi, I\'m user number 6', dateOfBirth:  DateTime.utc(1999, 6,4), yearOfMatriculation: 4, countryOfOriginID: 1, courseOfStudyID: 1, genderID: 2, userID: 6);
var account7 = GeneralAccountInfo(id: 7, fullName: 'Veronika Liam', description: 'Hi, I\'m user number 7', dateOfBirth:  DateTime.utc(1996, 8,12), yearOfMatriculation: 2, countryOfOriginID: 1, courseOfStudyID: 1, genderID: 2, userID: 7);
var account8 = GeneralAccountInfo(id: 8, fullName: 'Jason Ong', description: 'Hi, I\'m user number 8', dateOfBirth:  DateTime.utc(2000, 5,15), yearOfMatriculation: 2, countryOfOriginID: 1, courseOfStudyID: 1, genderID: 1, userID: 8);
var account9 = GeneralAccountInfo(id: 9, fullName: 'Jonah Roberto', description: 'Hi, I\'m user number 9', dateOfBirth:  DateTime.utc(1995, 2,26), yearOfMatriculation: 2, countryOfOriginID: 1, courseOfStudyID: 1, genderID: 2, userID: 9);
var account10 = GeneralAccountInfo(id: 10, fullName: 'Abbey Lae', description: 'Hi, I\'m user number 10', dateOfBirth:  DateTime.utc(1994, 7,3), yearOfMatriculation: 2, countryOfOriginID: 1, courseOfStudyID: 1, genderID: 2, userID: 10);
