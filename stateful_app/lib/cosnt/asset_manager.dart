class Assets {
  static const String creed = "lib/assets/images/creed_bratton.jpeg";
  static const String michael = "lib/assets/images/michael_scott.jpeg";
  static const String jim = "lib/assets/images/jim_halpert.jpeg";

  static String getAsset(String input) {
    switch (input) {
      case "creed":
      case "Creed":
        return creed;
      case "michael":
      case "Michael":
        return michael;
      case "Jim":
      case "jim":
        return jim;
      default:
        return jim;
    }
  }
}
