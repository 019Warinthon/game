import 'dart:ui';

class GameCell {
  final String name;
  final String type; // ประเภทช่อง (ปกติ, BATTLE, ทอยคู่)
  final Color color;
  final String action; // กติกาเมื่อเดินมาถึง

  GameCell({
    required this.name,
    required this.type,
    required this.color,
    required this.action,
  });
}
