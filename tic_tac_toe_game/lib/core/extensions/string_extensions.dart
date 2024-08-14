extension StringExtensions on String {
  String get toPng => 'assets/images/ig_$this.png';

  String get toLottie => 'assets/animations/lottie_$this.json';
}
