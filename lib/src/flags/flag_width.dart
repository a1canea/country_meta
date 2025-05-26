enum FlagWidth {
  w20(20),
  w40(40),
  w80(80),
  w160(160),
  w320(320),
  w640(640),
  w1280(1280),
  w2560(2560);

  final int pixels;
  const FlagWidth(this.pixels);

  String get path => 'w$pixels';
}
