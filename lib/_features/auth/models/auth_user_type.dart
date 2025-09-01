enum UserType  {
  doctor,
  client,
  sellerClient
}

class AuthUserType {
  AuthUserType({required this.userType});

  final UserType userType;

}
