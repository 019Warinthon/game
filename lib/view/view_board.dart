import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game/model/model_player.dart';

class GameBoard extends StatefulWidget {
  final List<Player> players;

  const GameBoard({super.key, required this.players});

  @override
  GameBoardState createState() => GameBoardState();
}

class GameBoardState extends State<GameBoard> {
  final Random _random = Random();
  late List<Player> players;
  int currentPlayerIndex = 0;

  @override
  void initState() {
    super.initState();
    players = widget.players;
  }

  void handleSquareAction(int squareIndex) {
    final boardData = [
      {'emoji': '🏁', 'title': 'จุดเริ่มต้น', 'action': 'start'},
      {'emoji': '🥃', 'title': 'เหล้า+โค้ก\n1 แก้ว', 'action': 'drink'},
      {'emoji': '🎮', 'title': 'MINI GAME', 'action': 'mini_game'},
      {'emoji': '🍹', 'title': 'เหล้า+โซดา\n1 แก้ว', 'action': 'drink'},
      {'emoji': '⚔️', 'title': 'BATTLE', 'action': 'battle'},
      {'emoji': '👤', 'title': 'สุ่มคนมาโดน', 'action': 'random_player'},
      {'emoji': '💧', 'title': 'น้ำเปล่า\n1 แก้ว', 'action': 'drink'},
      {'emoji': '🍺', 'title': 'พัก 2 ตา', 'action': 'rest'},
      {'emoji': '🥤', 'title': 'โค้ก\n1 แก้ว', 'action': 'drink'},
      {'emoji': '🎮', 'title': 'MINI GAME', 'action': 'mini_game'},
      {'emoji': '🥃', 'title': 'เหล้า+น้ำ\n1 แก้ว', 'action': 'drink'},
      {'emoji': '💸', 'title': 'จ่ายค่าเหล้า\n20 บาท', 'action': 'pay'},
      {'emoji': '🎲', 'title': 'เสี่ยงดวง', 'action': 'luck_draw'},
      {'emoji': '👤', 'title': 'สุ่มคนมาโดน', 'action': 'random_player'},
      {'emoji': '🔒', 'title': 'คุก\nพัก 1 ตา', 'action': 'jail'},
      {'emoji': '🏠', 'title': 'กลับไปจุดเริ่มต้น', 'action': 'start'},
      // เพิ่มช่องอื่น ๆ ตามต้องการ...
    ];

    final square = boardData[squareIndex % boardData.length];
    String action = square['action']!;

    switch (action) {
      case 'start':
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('จุดเริ่มต้น'),
            content: Text('คุณอยู่ที่จุดเริ่มต้น 🏁'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ตกลง'),
              ),
            ],
          ),
        );
        break;

      case 'drink':
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('ดื่ม!'),
            content: Text('คุณต้องดื่ม 1 แก้ว 🍺'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ตกลง'),
              ),
            ],
          ),
        );
        break;

      case 'mini_game':
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('MINI GAME'),
            content: Text('เล่นมินิเกมเพื่อความสนุก 🎮'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ตกลง'),
              ),
            ],
          ),
        );
        break;

      case 'battle':
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('BATTLE'),
            content: Text('เริ่มการต่อสู้ระหว่างผู้เล่น ⚔️'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ตกลง'),
              ),
            ],
          ),
        );
        break;

      case 'random_player':
        int randomPlayerIndex = _random.nextInt(players.length);
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('สุ่มคนมาโดน'),
            content: Text(
              'ผู้เล่นที่โดนคือ ${players[randomPlayerIndex].name} 👤',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ตกลง'),
              ),
            ],
          ),
        );
        break;

      case 'rest':
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('พัก'),
            content: Text('คุณต้องพัก 2 ตา 😴'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ตกลง'),
              ),
            ],
          ),
        );
        break;

      case 'pay':
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('จ่ายค่าเหล้า'),
            content: Text('คุณต้องจ่ายค่าเหล้า 20 บาท 💸'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ตกลง'),
              ),
            ],
          ),
        );
        break;

      case 'luck_draw':
        int luck = _random.nextInt(6) + 1;
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('เสี่ยงดวง'),
            content: Text('คุณจั่วดวงได้: $luck 🎲'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ตกลง'),
              ),
            ],
          ),
        );
        break;

      case 'jail':
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('คุก'),
            content: Text('คุณติดคุก 🔒 พัก 1 ตา'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ตกลง'),
              ),
            ],
          ),
        );
        break;

      default:
        break;
    }
  }

  void rollDice() {
    setState(() {
      int steps = _random.nextInt(6) + 1;
      players[currentPlayerIndex].move(steps);
      handleSquareAction(
        players[currentPlayerIndex].position,
      ); // เรียก Action ตามช่องที่ตก
      currentPlayerIndex = (currentPlayerIndex + 1) % players.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('เกมเศรษฐีวงเหล่า')),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemCount: 40,
              itemBuilder: (context, index) => buildGameCell(index),
            ),
          ),
          buildControlPanel(),
        ],
      ),
    );
  }

  Widget buildControlPanel() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: rollDice, child: Text('ทอยลูกเต๋า')),
          ElevatedButton(
            onPressed: () {
              // BATTLE system
            },
            child: Text('BATTLE'),
          ),
        ],
      ),
    );
  }
}

Widget buildGameCell(int index) {
  // ข้อมูลช่องในกระดานเกม
  final boardData = [
    {'emoji': '🏁', 'title': 'จุดเริ่มต้น'},
    {'emoji': '🥃', 'title': 'เหล้า+โค้ก\n1 แก้ว'},
    {'emoji': '🎮', 'title': 'MINI GAME'},
    {'emoji': '🍹', 'title': 'เหล้า+โซดา\n1 แก้ว'},
    {'emoji': '⚔️', 'title': 'BATTLE'},
    {'emoji': '👤', 'title': 'สุ่มคนมาโดน'},
    {'emoji': '💧', 'title': 'น้ำเปล่า\n1 แก้ว'},
    {'emoji': '🍺', 'title': 'พัก 2 ตา'},
    {'emoji': '🥤', 'title': 'โค้ก\n1 แก้ว'},
    {'emoji': '🎮', 'title': 'MINI GAME'},
    {'emoji': '🥃', 'title': 'เหล้า+น้ำ\n1 แก้ว'},
    {'emoji': '💸', 'title': 'จ่ายค่าเหล้า\n20 บาท'},
    {'emoji': '🎲', 'title': 'เสี่ยงดวง'},
    {'emoji': '👤', 'title': 'สุ่มคนมาโดน'},
    {'emoji': '🔒', 'title': 'คุก\nพัก 1 ตา'},
    {'emoji': '🏠', 'title': 'กลับไปจุดเริ่มต้น'},
    {'emoji': '🍺', 'title': 'เหล้า+โค้ก\n1 แก้ว'},
    {'emoji': '🎮', 'title': 'MINI GAME'},
    {'emoji': '🍹', 'title': 'เหล้า+โซดา\n1 แก้ว'},
    {'emoji': '💧', 'title': 'น้ำเปล่า\n1 แก้ว'},
    {'emoji': '⚔️', 'title': 'BATTLE'},
    {'emoji': '🥃', 'title': 'เหล้า+โค้ก\n1 แก้ว'},
    {'emoji': '💧', 'title': 'น้ำแกลบ\n1 แก้ว'},
    {'emoji': '🎭', 'title': 'คลี่คลาย'},
    {'emoji': '🎮', 'title': 'MINI GAME'},
    {'emoji': '👤', 'title': 'สุ่มคนมาโดน'},
    {'emoji': '💸', 'title': 'จ่ายค่ามิกซ์\n10 บาท'},
    {'emoji': '🥃', 'title': 'เหล้า+น้ำ\nครึ่งแก้ว'},
    {'emoji': '🎲', 'title': 'เสี่ยงดวง'},
    {'emoji': '🥃', 'title': 'เหล้า+โค้ก\n1 แก้ว'},
    {'emoji': '💧', 'title': 'น้ำแกลบ\n1 แก้ว'},
  ];

  // ดึงข้อมูลช่องตาม index
  final cellData = boardData[index % boardData.length];

  return Card(
    elevation: 4,
    margin: EdgeInsets.all(4),
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(cellData['emoji']!, style: TextStyle(fontSize: 24)),
          SizedBox(height: 8),
          Text(
            cellData['title']!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
