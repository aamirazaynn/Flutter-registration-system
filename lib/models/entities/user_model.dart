class User {
  String email;
  String password;
  String phone;
  String gender;
  String grade;
  String uni;

  String? id;
  User(
      {required this.email,
      required this.password,
      required this.phone,
      required this.gender,
      required this.grade,
      required this.uni,
      this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json["email"],
      password: json["password"],
      phone: json["phone"],
      gender: json["gender"],
      grade: json["grade"],
      uni: json["uni"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "phone": phone,
      "gender": gender,
      "grade": grade,
      "uni": uni,
    };
  }
}
