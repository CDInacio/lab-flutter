import 'package:camera/models/user.dart';

class UserBack4AppResponse {
  List<User>? results;

  UserBack4AppResponse({this.results});

  UserBack4AppResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <User>[];
      json['results'].forEach((v) {
        results!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
