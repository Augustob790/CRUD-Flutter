class Helpers {

  static String imageJoao = 'assets/img/img.png';

  static formatDate(DateTime dateTime) {
    String day = "";
    String month = "";
    String year = "";
    day = dateTime.day.toString();
    month = dateTime.month.toString();
    year = dateTime.year.toString();
    return "${noOneNumber(day)}/${noOneNumber(month)}/$year";
  }


  static formatDateForBR(String dateTime) {
    final date = DateTime.parse(dateTime);
    String day = "";
    String month = "";
    String year = "";
    day = date.day.toString();
    month = date.month.toString();
    year = date.year.toString();
    return "${noOneNumber(day)}/${noOneNumber(month)}/$year";
  }

  static String formatDateForBR2(String dateTime) {
    final date = DateTime.parse(dateTime);

    List<String> months = [
      "jan.",
      "fev.",
      "mar.",
      "abr.",
      "mai.",
      "jun.",
      "jul.",
      "ago.",
      "set.",
      "out.",
      "nov.",
      "dez."
    ];

    String day = date.day.toString();
    String month = months[date.month - 1]; // Adjusting month index
    String year = date.year.toString();

    return "$day de $month de $year";
  }

  static String formatDateForBRDate(DateTime dateTime) {
    List<String> months = [
      "jan.",
      "fev.",
      "mar.",
      "abr.",
      "mai.",
      "jun.",
      "jul.",
      "ago.",
      "set.",
      "out.",
      "nov.",
      "dez."
    ];

    String day = dateTime.day.toString();
    String month = months[dateTime.month - 1]; // Adjusting month index
    String year = dateTime.year.toString();

    return "$day de $month de $year";
  }

  static formatDateOfHour(String value) {
    // 2023-05-26 17:32:12.622331
    String day = "";
    String month = "";
    String year = "";
    if (value == "ERROR") {
      return value;
    } else if (value.length != 24) {
      return "Sem Agenda";
    } else {
      day = value.substring(8, 10);
      month = value.substring(5, 7);
      year = value.substring(0, 4);
      return "$day/$month/$year";
    }
  }

  static formatHour(String value) {
    // 2023-05-26 17:32:12.622331
    String hour;
    if (value == "ERROR") {
      return value;
    } else if (value.length != 24) {
      return "Sem Agenda";
    } else {
      hour = value.substring(11, 16);
      return "${hour}h";
    }
  }

  static noOneNumber(String i) {
    if (i.length == 1) {
      return "0$i";
    } else {
      return i;
    }
  }
}


