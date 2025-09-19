class Player {
  final String name;
  int position = 0;
  int money = 10000; // เงินเริ่มต้น

  Player({required this.name, required int position});

  void move(int steps) {
    position = (position + steps) % 40; // 40 ช่อง
  }
}
