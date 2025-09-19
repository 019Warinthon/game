import 'package:flutter/material.dart';
import 'package:game/model/model_player.dart';
import 'view_board.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Player> players = [];
  TextEditingController nameController = TextEditingController();

  void addPlayer() {
    if (nameController.text.isNotEmpty && players.length < 8) {
      setState(() {
        players.add(Player(name: nameController.text.trim(), position: 0));
        nameController.clear();
      });
    }
  }

  void startGame() {
    if (players.length >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GameBoard(players: players)),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('ข้อผิดพลาด'),
          content: Text('ต้องมีผู้เล่นอย่างน้อย 2 คนเพื่อเริ่มเกม'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('ตกลง'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เกมเศรษฐีวงเหล้า'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ส่วนเพิ่มผู้เล่น
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'เพิ่มผู้เล่น',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: addPlayer,
                          child: Text('เพิ่ม'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // รายชื่อผู้เล่น
            Expanded(
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'รายชื่อผู้เล่น (${players.length})',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: players.isEmpty
                            ? Center(
                                child: Text(
                                  'ยังไม่มีผู้เล่น\nต้องมีอย่างน้อย 2 คน',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            : ListView.builder(
                                itemCount: players.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(players[index].name),
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

            // ปุ่มเริ่มเกม
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: startGame,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.all(16.0),
                ),
                child: Text(
                  'เริ่มเกม',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
