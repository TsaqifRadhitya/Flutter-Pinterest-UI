
class User {
  final int id;
  final String email;
  final String phoneNumber;
  final String username;
  final String fullName; 

  User({required this.id,required this.email,required this.phoneNumber,required this.username,required this.fullName});

  factory User.fromJson(Map<String,dynamic> json){

    return User(id: json[''], email: json[''], phoneNumber: json[''], username: json[''], fullName: json['']);

  }
}
