import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(DrinkingMonopolyApp());
}

class DrinkingMonopolyApp extends StatelessWidget {
  const DrinkingMonopolyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'วงเหล้าเศรษฐี',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Prompt'),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF6B35), Color(0xFFFF8E53), Color(0xFFFFB347)],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo/Title
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('🏠🍺', style: TextStyle(fontSize: 80)),
                    SizedBox(height: 10),
                    Text(
                      'วงเหล้าเศรษฐี',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'ทอยเต๋า เดิน ดื่ม!',
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),

              // Menu buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    _buildMenuButton(
                      '🎮 เริ่มเกมใหม่',
                      'สร้างห้องเกมและเพิ่มผู้เล่น',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetupGamePage(),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),

                    _buildMenuButton(
                      '📋 กฎเกม',
                      'อ่านวิธีเล่นและกฎกติกา',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RulesPage()),
                      ),
                    ),

                    SizedBox(height: 15),

                    _buildMenuButton(
                      '⚙️ ตั้งค่า',
                      'ปรับแต่งเกมตามใจชอบ',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      ),
                    ),
                  ],
                ),
              ),

              Spacer(),

              // Footer
              Text(
                'เล่นอย่างมีสติ ดื่มอย่างปลอดภัย',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(String title, String subtitle, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF6B35),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SetupGamePage extends StatefulWidget {
  const SetupGamePage({super.key});

  @override
  SetupGamePageState createState() => SetupGamePageState();
}

class SetupGamePageState extends State<SetupGamePage> {
  List<String> players = [];
  TextEditingController nameController = TextEditingController();
  String selectedMode = 'ปกติ';

  final List<String> gameModes = ['ชิลล์', 'ปกติ', 'มันส์', 'สุดขั้ว'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตั้งค่าเกม'),
        backgroundColor: Color(0xFFFF6B35),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF6B35), Colors.white],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // Add player section
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '👥 เพิ่มผู้เล่น',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF6B35),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: 'ชื่อผู้เล่น',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                              ),
                              onSubmitted: (value) => _addPlayer(),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _addPlayer,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFF6B35),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('เพิ่ม'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Game mode selection
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '🎮 โหมดเกม',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF6B35),
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        children: gameModes
                            .map(
                              (mode) => ChoiceChip(
                                label: Text(mode),
                                selected: selectedMode == mode,
                                onSelected: (selected) {
                                  setState(() {
                                    selectedMode = mode;
                                  });
                                },
                                selectedColor: Color(0xFFFF6B35),
                                labelStyle: TextStyle(
                                  color: selectedMode == mode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Players list
              Expanded(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '👨‍👩‍👧‍👦 ผู้เล่น (${players.length})',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF6B35),
                              ),
                            ),
                            Spacer(),
                            if (players.length >= 2)
                              Text(
                                '✅ พร้อมเล่น',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: players.isEmpty
                              ? Center(
                                  child: Text(
                                    'ยังไม่มีผู้เล่น\nต้องมีอย่างน้อย 2 คน',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: players.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: _getPlayerColor(
                                            index,
                                          ),
                                          child: Text(
                                            players[index][0].toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        title: Text(players[index]),
                                        trailing: IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              players.removeAt(index);
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Start game button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: players.length >= 2 ? _startGame : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF6B35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    disabledBackgroundColor: Colors.grey,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      '🎮 เริ่มเกม',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getPlayerColor(int index) {
    final colors = [
      Color(0xFFFF6B35),
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.amber,
      Colors.indigo,
    ];
    return colors[index % colors.length];
  }

  void _addPlayer() {
    if (nameController.text.isNotEmpty && players.length < 8) {
      setState(() {
        players.add(nameController.text.trim());
        nameController.clear();
      });
    }
  }

  void _startGame() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            GameBoardPage(players: players, gameMode: selectedMode),
      ),
    );
  }
}

// Board square types
enum SquareType {
  start, // เริ่มต้น
  drink, // ดื่ม
  playerName, // ช่องชื่อผู้เล่น
  rest, // พักผ่อน
  miniGame, // มินิเกม
  luckDraw, // สุ่มดวง
  special, // พิเศษ
  jail, // คุก
}

class BoardSquare {
  final int id;
  final SquareType type;
  final String title;
  final String description;
  final String emoji;

  BoardSquare({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.emoji,
  });
}

class GameBoardPage extends StatefulWidget {
  final List<String> players;
  final String gameMode;

  const GameBoardPage({
    super.key,
    required this.players,
    required this.gameMode,
  });

  @override
  GameBoardPageState createState() => GameBoardPageState();
}

class GameBoardPageState extends State<GameBoardPage>
    with TickerProviderStateMixin {
  late List<BoardSquare> boardSquares;
  late List<int> playerPositions;
  int currentPlayerIndex = 0;
  int diceValue = 0;
  bool isDiceRolling = false;
  bool isPlayerMoving = false; // เพิ่มตัวแปรสำหรับการเคลื่อนที่
  Random random = Random();

  late AnimationController _diceController;
  late Animation<double> _diceAnimation;

  // Animation controllers สำหรับการเดินของผู้เล่น
  late AnimationController _movementController;
  late Animation<int> _movementAnimation;

  // Stats
  Map<String, int> playerDrinkCount = {};
  int totalRounds = 1;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
    _initializePlayers();

    _diceController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _diceAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _diceController, curve: Curves.easeInOut),
    );

    // สร้าง animation controller สำหรับการเคลื่อนที่
    _movementController = AnimationController(
      duration: Duration(seconds: 2), // ใช้เวลา 2 วินาทีในการเดิน
      vsync: this,
    );
  }

  void _initializeBoard() {
    boardSquares = [
      // Bottom row (0-9) - left to right
      BoardSquare(
        id: 0,
        type: SquareType.start,
        title: 'START',
        description: 'จุดเริ่มต้น/จุดรับเงิน',
        emoji: '🏁',
      ),
      BoardSquare(
        id: 1,
        type: SquareType.drink,
        title: 'เหล้า+โค้ก',
        description: 'ดื่ม 1 แก้ว',
        emoji: '🥃',
      ),
      BoardSquare(
        id: 2,
        type: SquareType.miniGame,
        title: 'MINI GAME',
        description: 'เล่นมินิเกม',
        emoji: '🎮',
      ),
      BoardSquare(
        id: 3,
        type: SquareType.drink,
        title: 'เหล้า+โซดา',
        description: 'ดื่ม 1 แก้ว',
        emoji: '🍹',
      ),
      BoardSquare(
        id: 4,
        type: SquareType.special,
        title: 'ฝ่าขบวน',
        description: 'คิมเกมครั้งที่ 20',
        emoji: '⚔️',
      ),
      BoardSquare(
        id: 5,
        type: SquareType.playerName,
        title: 'สุ่มคน',
        description: 'สุ่มผู้เล่นใหม่',
        emoji: '👤',
      ),
      BoardSquare(
        id: 6,
        type: SquareType.drink,
        title: 'น้ำเปล่า',
        description: 'ดื่ม 1 แก้ว',
        emoji: '💧',
      ),
      BoardSquare(
        id: 7,
        type: SquareType.drink,
        title: 'พัก',
        description: 'ดื่ม 2 แก้ว',
        emoji: '🍺',
      ),

      // Right side (8-17) - bottom to top
      BoardSquare(
        id: 8,
        type: SquareType.drink,
        title: 'โค้ก',
        description: 'ดื่ม 1 แก้ว',
        emoji: '🥤',
      ),
      BoardSquare(
        id: 9,
        type: SquareType.miniGame,
        title: 'MINI GAME',
        description: 'เล่นมินิเกม',
        emoji: '🎮',
      ),
      BoardSquare(
        id: 10,
        type: SquareType.drink,
        title: 'เหล้า+น้ำ',
        description: 'ดื่ม 1 แก้ว',
        emoji: '🥃',
      ),
      BoardSquare(
        id: 11,
        type: SquareType.special,
        title: 'จ่ายค่าเหล้า',
        description: 'จ่าย 20 บาท',
        emoji: '💸',
      ),
      BoardSquare(
        id: 12,
        type: SquareType.special,
        title: 'เล่องดวง',
        description: 'เสี่ยงดวงครั้งแรก',
        emoji: '🎲',
      ),
      BoardSquare(
        id: 13,
        type: SquareType.playerName,
        title: 'สุ่มคน',
        description: 'สุ่มผู้เล่นใหม่',
        emoji: '👤',
      ),
      BoardSquare(
        id: 14,
        type: SquareType.jail,
        title: 'เฝียว',
        description: 'พัก 1 ฝี',
        emoji: '🔒',
      ),

      // Top row (15-24) - right to left
      BoardSquare(
        id: 15,
        type: SquareType.drink,
        title: 'กลับไป',
        description: 'จุดรับเงิน',
        emoji: '🏠',
      ),
      BoardSquare(
        id: 16,
        type: SquareType.drink,
        title: 'เหล้า',
        description: 'โค้ก+ครั้งแล้ว',
        emoji: '🍺',
      ),
      BoardSquare(
        id: 17,
        type: SquareType.miniGame,
        title: 'MINI GAME',
        description: 'เล่นมินิเกม',
        emoji: '🎮',
      ),
      BoardSquare(
        id: 18,
        type: SquareType.drink,
        title: 'เหล้า+โซดา',
        description: 'ดื่ม 1 แก้ว',
        emoji: '🥃',
      ),
      BoardSquare(
        id: 19,
        type: SquareType.drink,
        title: 'น้ำเปล่า',
        description: 'ดื่ม 1 แก้ว',
        emoji: '💧',
      ),
      BoardSquare(
        id: 20,
        type: SquareType.special,
        title: 'BATTLE',
        description: 'ศึกครั้งใหญ่',
        emoji: '⚔️',
      ),
      BoardSquare(
        id: 21,
        type: SquareType.drink,
        title: 'เหล้า+โค้ก',
        description: 'ดื่ม 1 แก้ว',
        emoji: '🥃',
      ),
      BoardSquare(
        id: 22,
        type: SquareType.drink,
        title: 'น้ำแกลบ',
        description: 'ดื่ม 1 แก้ว',
        emoji: '💧',
      ),

      // Left side (23-31) - top to bottom
      BoardSquare(
        id: 23,
        type: SquareType.special,
        title: 'คลี่คลาย',
        description: 'สุ่มเจ้าก่าบ',
        emoji: '🎭',
      ),
      BoardSquare(
        id: 24,
        type: SquareType.miniGame,
        title: 'MINI GAME',
        description: 'เล่นมินิเกม',
        emoji: '🎮',
      ),
      BoardSquare(
        id: 25,
        type: SquareType.playerName,
        title: 'สุ่มคน',
        description: 'สุ่มผู้เล่นใหม่',
        emoji: '👤',
      ),
      BoardSquare(
        id: 26,
        type: SquareType.special,
        title: 'จ่ายค่าบัญชี',
        description: 'จ่าย 10 บาท',
        emoji: '💸',
      ),
      BoardSquare(
        id: 27,
        type: SquareType.drink,
        title: 'เหล้า+น้ำ',
        description: 'ดื่ม 1 แก้ว',
        emoji: '🥃',
      ),
      BoardSquare(
        id: 28,
        type: SquareType.special,
        title: 'เล่องดวง',
        description: 'เสี่ยงดวงครั้งแรก',
        emoji: '🎲',
      ),
      BoardSquare(
        id: 29,
        type: SquareType.drink,
        title: 'เหล้า+โค้ก',
        description: 'ดื่ม 1 แก้ว',
        emoji: '🥃',
      ),
      BoardSquare(
        id: 30,
        type: SquareType.drink,
        title: 'น้ำแกลบ',
        description: 'ดื่ม 1 แก้ว',
        emoji: '💧',
      ),
    ];
  }

  void _initializePlayers() {
    playerPositions = List.filled(widget.players.length, 0);
    for (String player in widget.players) {
      playerDrinkCount[player] = 0;
    }
  }

  @override
  void dispose() {
    _diceController.dispose();
    _movementController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('วงเหล้าเศรษฐี - ${widget.gameMode}'),
        backgroundColor: Color(0xFFFF6B35),
        actions: [
          IconButton(icon: Icon(Icons.bar_chart), onPressed: _showStats),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange[100]!, Colors.white],
          ),
        ),
        child: Column(
          children: [
            // Current player info
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _getPlayerColor(currentPlayerIndex),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      widget.players[currentPlayerIndex][0].toUpperCase(),
                      style: TextStyle(
                        color: _getPlayerColor(currentPlayerIndex),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ตาของ ${widget.players[currentPlayerIndex]}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'รอบที่ $totalRounds',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  if (diceValue > 0)
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '🎲 $diceValue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _getPlayerColor(currentPlayerIndex),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Game board
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      border: Border.all(color: Colors.brown, width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomPaint(
                      painter: BoardPainter(
                        squares: boardSquares,
                        playerPositions: playerPositions,
                        playerColors: widget.players
                            .asMap()
                            .entries
                            .map((entry) => _getPlayerColor(entry.key))
                            .toList(),
                        playerNames: widget.players,
                        movementAnimation: _movementAnimation,
                        currentPlayerIndex: currentPlayerIndex,
                        isPlayerMoving: isPlayerMoving,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Dice and control buttons
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // Dice
                  GestureDetector(
                    onTap: (isDiceRolling || isPlayerMoving) ? null : _rollDice,
                    child: AnimatedBuilder(
                      animation: _diceAnimation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _diceAnimation.value * 4 * pi,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                isDiceRolling
                                    ? '🎲'
                                    : (diceValue > 0
                                          ? diceValue.toString()
                                          : '🎲'),
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 20),

                  // Roll dice button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (isDiceRolling || isPlayerMoving)
                          ? null
                          : _rollDice,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF6B35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        disabledBackgroundColor: Colors.grey,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          isDiceRolling
                              ? 'กำลังทอย...'
                              : isPlayerMoving
                              ? 'กำลังเดิน...'
                              : 'ทอยลูกเต๋า',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getPlayerColor(int index) {
    final colors = [
      Color(0xFFFF6B35),
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.amber,
      Colors.indigo,
    ];
    return colors[index % colors.length];
  }

  void _rollDice() {
    setState(() {
      isDiceRolling = true;
    });

    _diceController.reset();
    _diceController.forward();

    Future.delayed(Duration(seconds: 2), () {
      final newDiceValue = random.nextInt(6) + 1;
      setState(() {
        diceValue = newDiceValue;
        isDiceRolling = false;
      });

      _movePlayer(newDiceValue);
    });
  }

  void _movePlayer(int steps) {
    final oldPosition = playerPositions[currentPlayerIndex];
    final newPosition = (oldPosition + steps) % boardSquares.length;

    setState(() {
      isPlayerMoving = true;
    });

    // สร้าง animation สำหรับการเดินทีละช่อง
    _movementAnimation = IntTween(begin: oldPosition, end: newPosition).animate(
      CurvedAnimation(parent: _movementController, curve: Curves.easeInOut),
    );

    _movementController.reset();
    _movementController.forward().then((_) {
      // อัปเดตตำแหน่งจริงเมื่อแอนิเมชันเสร็จ
      setState(() {
        playerPositions[currentPlayerIndex] = newPosition;
        isPlayerMoving = false;
      });

      // ทำ action ตามประเภทช่อง
      BoardSquare landedSquare = boardSquares[newPosition];
      _handleSquareAction(landedSquare);
    });
  }

  void _handleSquareAction(BoardSquare square) async {
    String message = '';
    switch (square.type) {
      case SquareType.drink:
        int drinkAmount = square.description.contains('1 จิบ')
            ? 1
            : square.description.contains('2 จิบ')
            ? 2
            : square.description.contains('3 จิบ')
            ? 3
            : square.description.contains('4 จิบ')
            ? 4
            : 5;
        playerDrinkCount[widget.players[currentPlayerIndex]] =
            playerDrinkCount[widget.players[currentPlayerIndex]]! + drinkAmount;
        message =
            '${widget.players[currentPlayerIndex]} ต้องดื่ม ${square.description} 🍻';
        break;

      case SquareType.playerName:
        // สุ่มชื่อผู้เล่นใหม่
        int newIndex = random.nextInt(widget.players.length);
        message =
            '${widget.players[currentPlayerIndex]} สลับกับ ${widget.players[newIndex]} 👤';
        setState(() {
          String temp = widget.players[currentPlayerIndex];
          widget.players[currentPlayerIndex] = widget.players[newIndex];
          widget.players[newIndex] = temp;
        });
        break;

      case SquareType.rest:
        message = '${widget.players[currentPlayerIndex]} พักผ่อน 😴';
        break;

      case SquareType.miniGame:
        message = '${widget.players[currentPlayerIndex]} เล่นมินิเกม 🎮';
        break;

      case SquareType.luckDraw:
        int luck = random.nextInt(6) + 1;
        message = '${widget.players[currentPlayerIndex]} จั่วดวงได้: $luck 🎲';
        break;

      case SquareType.special:
        message = '${widget.players[currentPlayerIndex]} เจอกิจกรรมพิเศษ ⭐';
        break;

      case SquareType.jail:
        message = '${widget.players[currentPlayerIndex]} ติดคุก 🔒 พัก 1 รอบ';
        break;

      case SquareType.start:
        message = '${widget.players[currentPlayerIndex]} เริ่มต้น 🏁';
        break;
    }

    // แสดงผลเป็น Dialog
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('ช่อง ${square.title}'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ตกลง'),
          ),
        ],
      ),
    );

    _nextPlayer();
  }

  void _nextPlayer() {
    setState(() {
      currentPlayerIndex = (currentPlayerIndex + 1) % widget.players.length;
      if (currentPlayerIndex == 0) {
        totalRounds += 1;
      }
      diceValue = 0;
    });
  }

  void _showStats() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('สถิติผู้เล่น'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.players.map((player) {
            int drinks = playerDrinkCount[player] ?? 0;
            return ListTile(
              title: Text(player),
              subtitle: Text('ดื่มไปแล้ว $drinks จิบ 🍻'),
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ปิด'),
          ),
        ],
      ),
    );
  }
}

class BoardPainter extends CustomPainter {
  final List<BoardSquare> squares;
  final List<int> playerPositions;
  final List<Color> playerColors;
  final List<String> playerNames;
  final Animation<int>? movementAnimation;
  final int currentPlayerIndex;
  final bool isPlayerMoving;

  BoardPainter({
    required this.squares,
    required this.playerPositions,
    required this.playerColors,
    required this.playerNames,
    this.movementAnimation,
    required this.currentPlayerIndex,
    required this.isPlayerMoving,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black;
    final squareCount = squares.length;
    final double boardSize = min(size.width, size.height);
    final double squareWidth = boardSize / 8; // 8 ช่องต่อด้าน
    final double squareHeight = squareWidth;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // วาดเส้นกรอบ
    canvas.drawRect(Rect.fromLTWH(0, 0, boardSize, boardSize), paint);

    for (int i = 0; i < squareCount; i++) {
      Offset topLeft = _getSquareOffset(i, squareWidth, squareHeight);
      Rect rect = Rect.fromLTWH(
        topLeft.dx,
        topLeft.dy,
        squareWidth,
        squareHeight,
      );
      paint.color = Colors.brown;
      canvas.drawRect(rect, paint);

      // วาด Emoji ของ square
      textPainter.text = TextSpan(
        text: squares[i].emoji,
        style: TextStyle(fontSize: 20),
      );
      textPainter.layout(minWidth: 0, maxWidth: squareWidth);
      textPainter.paint(
        canvas,
        Offset(
          topLeft.dx + (squareWidth - textPainter.width) / 2,
          topLeft.dy + (squareHeight - textPainter.height) / 2,
        ),
      );
    }

    // วาดผู้เล่น
    for (int i = 0; i < playerPositions.length; i++) {
      int pos;

      // ถ้าเป็นผู้เล่นที่กำลังเคลื่อนที่ และมี animation
      if (i == currentPlayerIndex &&
          isPlayerMoving &&
          movementAnimation != null) {
        pos = movementAnimation!.value;
      } else {
        pos = playerPositions[i];
      }

      Offset topLeft = _getSquareOffset(pos, squareWidth, squareHeight);
      double radius = 10;
      paint.color = playerColors[i];
      paint.style = PaintingStyle.fill;

      // เพิ่มเอฟเฟกต์เรืองแสงสำหรับผู้เล่นที่กำลังเคลื่อนที่
      if (i == currentPlayerIndex && isPlayerMoving) {
        paint.color = playerColors[i].withValues(alpha: 0.8);
        canvas.drawCircle(
          Offset(topLeft.dx + squareWidth / 2, topLeft.dy + squareHeight / 2),
          radius + 3,
          paint,
        );
        paint.color = playerColors[i];
      }

      canvas.drawCircle(
        Offset(topLeft.dx + squareWidth / 2, topLeft.dy + squareHeight / 2),
        radius,
        paint,
      );

      // วาดตัวอักษรแรกของผู้เล่น
      textPainter.text = TextSpan(
        text: playerNames[i][0].toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          topLeft.dx + squareWidth / 2 - textPainter.width / 2,
          topLeft.dy + squareHeight / 2 - textPainter.height / 2,
        ),
      );
    }
  }

  Offset _getSquareOffset(int index, double w, double h) {
    if (index >= 0 && index <= 7) {
      return Offset(index * w, 7 * h); // ด้านล่าง
    } else if (index >= 8 && index <= 15) {
      return Offset(7 * w, (15 - index) * h); // ด้านขวา
    } else if (index >= 16 && index <= 23) {
      return Offset((23 - index) * w, 0); // ด้านบน
    } else if (index >= 24 && index <= 31) {
      return Offset(0, (index - 24) * h); // ด้านซ้าย
    }
    return Offset.zero;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('กฎเกม'), backgroundColor: Color(0xFFFF6B35)),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '🎲 กฎเกมวงเหล้าเศรษฐี',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF6B35),
                ),
              ),
              SizedBox(height: 20),
              _buildRuleItem('เริ่มเกม', 'ผู้เล่นต้องมีอย่างน้อย 2 คน'),
              _buildRuleItem('ทอยลูกเต๋า', 'ผลการทอยจะกำหนดจำนวนช่องที่เดิน'),
              _buildRuleItem('ดื่ม', 'ทำตามจำนวนจิบที่ระบุบนช่อง 🍺'),
              _buildRuleItem('พักผ่อน', 'ไม่ต้องทำอะไรในรอบนั้น 😴'),
              _buildRuleItem('มินิเกม', 'เล่นมินิเกมเพื่อความสนุก 🎮'),
              _buildRuleItem('สุ่มดวง', 'จั่วใบโชคและทำตามผล'),
              _buildRuleItem('พิเศษ', 'กิจกรรมพิเศษ ⭐ สามารถกำหนดเอง'),
              _buildRuleItem('คุก', 'พลาด 1 รอบ 🔒'),
              SizedBox(height: 20),
              Text(
                '⚠️ หมายเหตุ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'เล่นอย่างมีสติ ดื่มอย่างปลอดภัย\nหากไม่สามารถดื่มได้ สามารถข้ามช่องดื่มได้',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRuleItem(String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: TextStyle(fontSize: 18)),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: '$title: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: description,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  // ตัวแปรปรับแต่งเกม
  Color selectedColor = Color(0xFFFF6B35);
  int maxRounds = 10;
  int maxDrinksPerSquare = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ตั้งค่าเกม'), backgroundColor: selectedColor),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🎨 สีธีมเกม',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                _colorCircle(Colors.orange),
                _colorCircle(Colors.red),
                _colorCircle(Colors.blue),
                _colorCircle(Colors.green),
                _colorCircle(Colors.purple),
              ],
            ),
            SizedBox(height: 20),

            Text(
              '🔁 จำนวนรอบสูงสุด',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: maxRounds.toDouble(),
              min: 1,
              max: 20,
              divisions: 19,
              label: maxRounds.toString(),
              onChanged: (value) {
                setState(() {
                  maxRounds = value.toInt();
                });
              },
            ),
            SizedBox(height: 10),
            Text('รอบสูงสุด: $maxRounds', style: TextStyle(fontSize: 16)),

            SizedBox(height: 20),
            Text(
              '🍻 จำนวนจิบสูงสุดต่อช่องดื่ม',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: maxDrinksPerSquare.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              label: maxDrinksPerSquare.toString(),
              onChanged: (value) {
                setState(() {
                  maxDrinksPerSquare = value.toInt();
                });
              },
            ),
            SizedBox(height: 10),
            Text(
              'จิบสูงสุดต่อช่อง: $maxDrinksPerSquare',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // กดบันทึกแล้ว Navigator กลับ HomePage
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedColor,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  '💾 บันทึกการตั้งค่า',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorCircle(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: CircleAvatar(
        backgroundColor: color,
        radius: selectedColor == color ? 25 : 20,
        child: selectedColor == color
            ? Icon(Icons.check, color: Colors.white)
            : null,
      ),
    );
  }
}
