class Quiz {
  const Quiz(
      {required this.title,
      required this.total,
      required this.progress,
      required this.image});

  final String title;
  final String image;
  final int total;
  final int progress;

  double get percentProgress => total > 0 ? (progress * 100) / total : 0;
}
