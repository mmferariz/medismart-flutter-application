class Regex {
  
  static const String name = r"(^([A-ZÁÉÍÓÚÄËïöÜÑ]+[\s]?)+$)";
  static const String nameNoMayus = r"(^([A-ZÁÉÍÓÚÄËïöüÑ]{1}[a-z ñáéíóú]+[\s]?)+$)";
  static const String phone = r"(^[0-9]{10}$)";
  static const String clabe = r"(^[0-9]{18}$)";
  static const String email = r"(^\s*[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]+\s*$)";
  static const String password = r"(^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])\S{6,40}$)";
  static const String rfc = r"(^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])([A-Z]|[0-9]){2}([A]|[0-9]){1})?$)";
  static const String curp = r"(^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$)";
  static const String todo = r".";
  static const String digits = r"(^(\d+)$)";
  static const String digitsOrNull = r"((^(\d+)$)|(^$))";

  static const String mayus = r'^([A-Z Ñ]{1,})$';
  static const notEmpty = r'^(.|\s)*[\S]+(.|\s)*$';
}