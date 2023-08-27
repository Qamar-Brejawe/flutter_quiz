bool isEmail(String value) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(value);
}

bool isPassword(String value) {
  String p = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(value);
}

bool isNumberMobile(String value) {
  String numMobile = r'^\+[1-9]{1}[0-9]{3,14}$';
  RegExp regExp = RegExp(numMobile);

  return regExp.hasMatch(value);
}
