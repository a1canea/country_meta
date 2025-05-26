enum FlagHeight {
  h20(20),
  h24(24),
  h40(40),
  h48(48),
  h60(60),
  h80(80),
  h120(120),
  h160(160),
  h240(240);

  final int pixels;

  const FlagHeight(this.pixels);

  String get path => 'h$pixels';
}
