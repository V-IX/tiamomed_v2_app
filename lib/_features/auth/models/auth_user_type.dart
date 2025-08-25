enum UserType  {
  doctor,
  client
}

class AuthUserType {
  AuthUserType({required this.userType});

  final UserType userType;

}
