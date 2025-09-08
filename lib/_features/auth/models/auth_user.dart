enum UserType {
  doctor('Доктор'),
  client('Пациент'),
  sellerClient('Агент по продвижению');

  const UserType(this.value);

  final String value;



}

class AuthUser {
  AuthUser({required this.fio, required this.userType});

  final String fio;
  final UserType userType;

}
