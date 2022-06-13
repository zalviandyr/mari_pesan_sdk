enum UserProvider {
  email('email'),
  phone('phone'),
  google('google');

  final String value;
  const UserProvider(this.value);
}
