class Token {
  static final Token _instance = Token._internal();

  String? token;  // Cambiado de userId a token

  factory Token() {
    return _instance;
  }

  Token._internal();
}
