class DateTimeConverter{

  static const List months = [
    "",
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre"
  ];

  static const List daysOfWeek = [
    "",
    "Lunes",
    "Martes",
    "Miércoles",
    "Jueves",
    "Viernes",
    "Sábado",
    "Domingo"
  ];

  static String toJson(DateTime date) => "${date.toIso8601String().substring(0, 19)}Z";

  static String twoDigitConversion(int digit) => digit < 10 ? "0$digit" : "$digit";
  
  static String twoDigitHourConversion(int digit) => digit == 0 ? "12" : digit < 10 ? "0$digit" : "$digit";

  static String longDateConversion(DateTime date) => "${DateTimeConverter.daysOfWeek[date.weekday]}, ${DateTimeConverter.twoDigitConversion(date.day)} de ${DateTimeConverter.months[date.month]} de ${date.year}";
  
  static String mediumDateConversion(DateTime date) => "${DateTimeConverter.twoDigitConversion(date.day)} de ${DateTimeConverter.months[date.month]}";

}