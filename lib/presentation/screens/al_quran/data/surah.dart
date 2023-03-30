class Surah {
  final String entitle;
  final String arbtitle;
  final String enTranslation;
  final String mmTranslation;
  final int totalVerses;
  final int toPage;

  Surah({
    required this.toPage,
    required this.entitle,
    required this.arbtitle,
    required this.totalVerses,
    required this.mmTranslation,
    required this.enTranslation,
  });
}
