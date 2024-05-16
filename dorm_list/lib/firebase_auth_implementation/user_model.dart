class UserModel {
  final String firstname;
  final String surname;
  final String username;
  final String email;
  final String password;

  const UserModel({
    required this.firstname,
    required this.surname,
    required this.username,
    required this.email,
    required this.password,
  });

  toJson(){
    return {
      'FirstName': firstname,
      'SurName': surname,
      'UserName': username,
      'Email': email,
      'Password': password,
    };
  }

}