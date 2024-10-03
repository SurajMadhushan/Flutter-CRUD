class User {
  String username;
  String passwordHash;
  String jobRole;
  String email;

  User({
    required this.username,
    required this.passwordHash,
    required this.jobRole,
    required this.email,
  });

  // Factory constructor to create a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      passwordHash: json['passwordHash'],
      jobRole: json['jobRole'],
      email: json['email'],
    );
  }

  // Method to convert the User object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'userName': username,
      'passWordHash': passwordHash,
      'jobRoleId': jobRole,
      'email': email,
    };
  }
}
