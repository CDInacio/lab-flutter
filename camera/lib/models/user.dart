class User {
  String? name;
  String? email;
  String? password;
  String? profileImage;

  User({this.name, this.email, this.password, this.profileImage});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
