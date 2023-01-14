// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TicTacToe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> list = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int turn = 1;
  int px = 0;
  int po = 0;

  late String winner = '';
  late String win = '';

  setColor(String sign) {
    if (sign == 'O') {
      return Color.fromARGB(255, 195, 195, 195);
    } else {
      return Color.fromARGB(255, 90, 144, 188);
    }
  }

  resetGame() {
    setState(() {
      list = [
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
      ];
      turn = 1;
      winner = '';
      win='';
    });
  }

  pressSpot(int index) {
    if (winner == '') {
      ticTac(index);
    }
  }

  ticTac(
    int index,
  ) {
    setState(
      () {
        if (list[index] == '') {
          if (turn % 2 == 0) {
            list[index] = 'O';
          } else {
            list[index] = 'X';
          }
          turn += 1;
        } else {
          return;
        }
        checkWinner();
        score();
      },
    );
  }

  void score() {
    setState(() {
      if (win == 'O') {
        po += 1;
      } else if (win == 'X') {
        px += 1;
      }
    });
  }

  checkWinner() {
    if (list[0] == list[1] && list[0] == list[2] && list[0] != '') {
      win = list[0];
      winner = 'Winner: ${list[0]}';
      return alertBox(context);
    }
    if (list[3] == list[4] && list[3] == list[5] && list[3] != '') {
      win = list[3];
      winner = 'Winner: ${list[3]}';
      return alertBox(context);
    }
    if (list[6] == list[7] && list[6] == list[8] && list[6] != '') {
      win = list[6];
      winner = 'Winner: ${list[6]}';
      return alertBox(context);
    }

    if (list[0] == list[4] && list[0] == list[8] && list[0] != '') {
      win = list[0];
      winner = 'Winner: ${list[0]}';
      return alertBox(context);
    }
    if (list[2] == list[4] && list[2] == list[6] && list[2] != '') {
      win = list[2];
      winner = 'Winner: ${list[2]}';
      return alertBox(context);
    }
    if (list[0] == list[3] && list[0] == list[6] && list[0] != '') {
      win = list[0];
      winner = 'Winner: ${list[0]}';
      return alertBox(context);
    }
    if (list[1] == list[4] && list[1] == list[7] && list[1] != '') {
      win = list[1];
      winner = 'Winner: ${list[1]}';
      return alertBox(context);
    }
    if (list[2] == list[5] && list[2] == list[8] && list[8] != '') {
      win = list[2];
      winner = 'Winner: ${list[2]}';
      return alertBox(context);
    }
    if (turn == 10) {
      winner = 'Draw';
      return alertBox(context);
    }
  }

  alertBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 75, 109, 135),
          title: Center(
              child: Text(
            'Result',
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
          content: GradientText(
            winner,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
            colors: [
              Color.fromARGB(255, 170, 142, 27),
              Colors.amber,
              Color.fromARGB(255, 255, 233, 33),
            ],
          ),
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.restart_alt),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 10, 40, 63),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            //color: Colors.red,
            child: Column(
              children: [
                GradientText(
                  'Tic Tac',
                  colors: [
                    Color.fromARGB(255, 170, 142, 27),
                    Colors.amber,
                    Color.fromARGB(255, 255, 233, 33),
                  ],
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                GradientText(
                  'Toe',
                  colors: [
                    Color.fromARGB(255, 170, 142, 27),
                    Colors.amber,
                    Color.fromARGB(255, 255, 233, 33),
                  ],
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      margin: EdgeInsets.all(10),
                      color: Color.fromARGB(255, 10, 40, 63),
                      shadowColor: Color.fromARGB(255, 167, 167, 167),
                      elevation: 6,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: GradientText(
                              'Player X',
                              colors: [
                                Color.fromARGB(255, 170, 142, 27),
                                Colors.amber,
                                Color.fromARGB(255, 255, 233, 33),
                              ],
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              px.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(10),
                      color: Color.fromARGB(255, 10, 40, 63),
                      shadowColor: Color.fromARGB(255, 167, 167, 167),
                      elevation: 6,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: GradientText(
                              'Player O',
                              colors: [
                                Color.fromARGB(255, 170, 142, 27),
                                Colors.amber,
                                Color.fromARGB(255, 255, 233, 33),
                              ],
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              po.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                    ),
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          pressSpot(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Center(
                            child: Text(
                              list[index],
                              style: TextStyle(
                                  fontSize: 80, color: setColor(list[index])),
                            ),
                          ),
                        ),
                      );
                    }),
                    itemCount: list.length,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: resetGame,
        backgroundColor: Color.fromARGB(255, 170, 142, 27),
        child: Icon(Icons.restart_alt),
      ),
    );
  }
}
