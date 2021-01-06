class User {
  final String id;
  String fullName;
  final String email;
  final String userRole;
  String mobile;
  List<String> myEvents;

  User({
    this.mobile,
    this.id,
    this.fullName,
    this.email,
    this.userRole,
    this.myEvents = const [],
  });

  User.fromData(Map<dynamic, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        userRole = data['userRole'],
        mobile = data['mobile'],
        myEvents = [...data["myEvents"]];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'userRole': userRole,
      'mobile': mobile.toString(),
      'myEvents': myEvents
    };
  }
}
