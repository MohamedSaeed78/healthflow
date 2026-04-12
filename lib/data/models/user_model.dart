class UserModel {
  final String uid;
  final String password;
  final String email;

  UserModel({
    required this.uid,
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'password': password,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      password: map['password'],
      email: map['email'],
    );
  }
}
