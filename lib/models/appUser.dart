
class AppUser{

  AppUser({
    required this.uid,
     this.name,
  }

    // required this.email,
    // required this.username,
    // required this.name,

);

  final String uid;
  final String? name;
// String email;
  // String username;
  // String name;

  // AppUser copyWith(
  //   String uid,
  //   String email,
  //   String username,
  //   String name,
  //
  //  ) =>
  //     AppUser(
  //       uid: uid ?? this.uid,
  //       email: email ?? this.email,
  //       username: username ?? this.username,
  //       name: name ?? this.name,
  //     );
  //
  // factory AppUser.fromJson(String str) => AppUser.fromMap(json.decode(str));
  //
  // String toJson() => json.encode(toMap());
  //
  // factory AppUser.fromMap(Map<String, dynamic> json) => AppUser(
  //   uid: json["uid"],
  //   email: json["email"],
  //   username: json["username"],
  //   name: json["name"],
  //
  // );
  //
  // Map<String, dynamic> toMap() => {
  //   "uid": uid,
  //   "email": email,
  //   "username": username,
  //   "name": name,
  // };

}


