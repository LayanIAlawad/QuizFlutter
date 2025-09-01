class Questions {
  const Questions(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffle() {
    final shuffledAnswer = List.of(answers);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}

const question = [
  Questions("Witch programming lanquage is used for Flutter?",
      ["Dart", "Java", "Python", "Kotlin"]),
  Questions("What is the main widget that holds the whole Flutter app?",
      ["MaterialApp", "Scaffold", "Container", "Text"]),
  Questions("Whitch widget is used to display text in Flutter?",
      ["Text", "Image", "Icon", "Column"]),
  Questions("What is the default directory for images in a Flutter project?",
      ["/assets", "/images", "/src", "/lib"]),
  Questions("What is the default extension for Dart files?",
      [".dart", ".txt", ".js", ".java"]),
];
