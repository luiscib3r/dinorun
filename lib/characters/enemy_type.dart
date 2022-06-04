enum EnemyType {
  angryPig(
    assetName: 'AngryPig/Walk (36x30).png',
    width: 36,
    height: 30,
    canFly: false,
    speed: 250,
  ),

  bat(
    assetName: 'Bat/Flying (46x30).png',
    width: 46,
    height: 30,
    canFly: true,
    speed: 300,
  ),

  rino(
    assetName: 'Rino/Run (52x34).png',
    width: 52,
    height: 34,
    canFly: false,
    speed: 350,
  );

  const EnemyType({
    required this.assetName,
    required this.width,
    required this.height,
    required this.canFly,
    required this.speed,
  });

  final String assetName;
  final double width;
  final double height;
  final bool canFly;
  final int speed;
}
