import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'nameprovider.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int TeamAscore = 0;
  int TeamArounda = 0;
  int TeamBscore = 0;
  int TeamBrounda = 0;
  int Tar7A = 0;
  int Tar7B = 0;

  Color TeamAscoreColor = Colors.black;
  Color TeamBscoreColor = Colors.black;
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.my_library_books_outlined)),
            Container(
                child: Text(
              Provider.of<NameProvider>(context).getTar7A.toString(),
              style: TextStyle(fontSize: 30),
            )),
            Container(
              child: Text('VS'),
            ),
            Container(
                child: Text(
              Provider.of<NameProvider>(context).getTar7B.toString(),
              style: TextStyle(fontSize: 30),
            )),
            IconButton(
                onPressed: () {
                  TeamArounda = 0;
                  TeamBrounda = 0;
                  Provider.of<NameProvider>(context, listen: false)
                      .saveScoreA(TeamArounda);
                  Provider.of<NameProvider>(context, listen: false)
                      .saveScoreB(TeamBrounda);
                },
                icon: Icon(Icons.replay_sharp)),
          ],
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFFfa5f74),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Row(
            children: <Widget>[
              playerInformation(TeamName: "Cuphead"),
              playerInformation(TeamName: "Mugman"),
            ],
          ),
        ),
        Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                TeamArounda += TeamAscore;
                TeamBrounda += TeamBscore;
                TeamAscore = 0;
                TeamBscore = 0;
                _textController2.clear();
                _textController1.clear();
                Provider.of<NameProvider>(context, listen: false)
                    .saveScoreA(TeamArounda);
                Provider.of<NameProvider>(context, listen: false)
                    .saveScoreB(TeamBrounda);
                if (TeamArounda > 2000) {
                  Tar7A++;
                  TeamArounda = 0;
                  TeamBrounda = 0;
                }
                if (TeamBrounda > 2000) {
                  Tar7B++;
                  TeamArounda = 0;
                  TeamBrounda = 0;
                }
                Provider.of<NameProvider>(context, listen: false)
                    .savetar7A(Tar7A);
                Provider.of<NameProvider>(context, listen: false)
                    .savetar7B(Tar7B);
              });
            },
            child: Text('Reka7',
                style: TextStyle(fontSize: 20, fontFamily: 'Poppins')),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFfa5f74),
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  TeamAscore = 0;
                  TeamBscore = 0;
                  _textController2.clear();
                  _textController1.clear();
                });
              },
              child: Text('X', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade500,
                shape: CircleBorder(),
                padding: EdgeInsets.all(6),
              ),
            ),
          )
        ]))
      ]),
    );
  }

  Widget playerInformation({required String TeamName}) {
    List<Color> colors = [
      // Color(0xFFC8E4E1),
      Colors.grey.shade300,
      Colors.teal.shade500,
      Colors.teal.shade600
    ];

    if (TeamName == "Mugman") {
      colors = [];
      // colors.add(Colors.orange.shade100);
      colors.add(Colors.grey.shade200);
      colors.add(Colors.orangeAccent);
      colors.add(Colors.orange.shade500);
    }

    return Expanded(
      flex: 1,
      child: Container(
        decoration: TeamName == "Cuphead"
            ? BoxDecoration(color: Color(0xFFF7ECDE))
            : BoxDecoration(color: Color(0xFFF7ECDE)),
        // color: colors[0],
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            // ESM EL TEAM MEL FOU9
            Padding(
              padding: const EdgeInsets.all(2),
              child: Text(
                "Team2",
                style: TextStyle(
                    color: colors[2],
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            TeamName == "Cuphead"
                ? Container(
                    margin: EdgeInsets.all(0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://robohash.org/${Provider.of<NameProvider>(context).getName1}"),
                                      radius: 25,
                                      backgroundColor: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      Provider.of<NameProvider>(context)
                                          .getName1,
                                      style: TextStyle(
                                          fontSize: 13, fontFamily: 'Poppins'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://robohash.org/${Provider.of<NameProvider>(context).getName3}"),
                                      radius: 25,
                                      backgroundColor: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      Provider.of<NameProvider>(context)
                                          .getName3,
                                      style: TextStyle(
                                          fontSize: 13, fontFamily: 'Poppins'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            child: Consumer<NameProvider>(
                              builder: (context, nameprovider, child) {
                                return Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: TeamArounda < 999
                                        ? Text(
                                            Provider.of<NameProvider>(context)
                                                .getScoreA
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 50),
                                          )
                                        : Column(
                                            children: [
                                              Text(
                                                (Provider.of<NameProvider>(
                                                                context)
                                                            .getScoreA -
                                                        1000)
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 50),
                                              ),
                                              Text('فوق الألف')
                                            ],
                                          ));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.all(0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(child: Consumer<NameProvider>(
                              builder: (context, nameprovider, child) {
                            return Padding(
                                padding: const EdgeInsets.all(12),
                                child: TeamBrounda < 999
                                    ? Text(
                                        Provider.of<NameProvider>(context)
                                            .getScoreB
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 50),
                                      )
                                    : Column(
                                        children: [
                                          Text(
                                            (Provider.of<NameProvider>(context)
                                                        .getScoreB -
                                                    1000)
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 50),
                                          ),
                                          Text('فوق الألف')
                                        ],
                                      ));
                          })),
                          SizedBox(width: 20),
                          Flexible(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://robohash.org/${Provider.of<NameProvider>(context).getName2}"),
                                      radius: 25,
                                      backgroundColor: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      Provider.of<NameProvider>(context)
                                          .getName2,
                                      style: TextStyle(
                                          fontSize: 13, fontFamily: 'Poppins'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://robohash.org/${Provider.of<NameProvider>(context).getName4}"),
                                      radius: 25,
                                      backgroundColor: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      Provider.of<NameProvider>(context)
                                          .getName4,
                                      style: TextStyle(
                                          fontSize: 13, fontFamily: 'Poppins'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            SizedBox(
              height: 50,
            ),
            TeamName == "Cuphead"
                ? Container(
                    margin: EdgeInsets.all(0),
                    child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: _textController1,
                                maxLength: 3,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                  signed: false,
                                ),
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: '    Score',
                                ),
                                onFieldSubmitted: (Text) {
                                  _textController1.text.isNotEmpty
                                      ? TeamAscore =
                                          int.parse(_textController1.text)
                                      : TeamAscore = 0;
                                  print(_textController1.text);
                                  assert(TeamAscore is int);
                                  if (((TeamAscore % 10) < 8) &&
                                      ((TeamAscore % 10) > 4)) {
                                    TeamAscore =
                                        ((TeamAscore / 10).toInt()) * 10 + 10;
                                    TeamBscore = 170 - TeamAscore;
                                  } else if (((TeamAscore % 10) > 7)) {
                                    TeamAscore =
                                        ((TeamAscore / 10).toInt()) * 10 + 10;
                                    TeamBscore = 160 - TeamAscore;
                                  } else {
                                    TeamAscore =
                                        ((TeamAscore / 10).toInt()) * 10;
                                    TeamBscore = 160 - TeamAscore;
                                  }
                                  _textController1.clear();
                                  setState(() {});
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 40, right: 20),
                              child: Text(
                                TeamAscore.toString(),
                                style: TextStyle(
                                    color: TeamAscoreColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 34),
                              ),
                            )
                          ],
                        )),
                  )
                : Container(
                    margin: EdgeInsets.all(0),
                    child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20, right: 40),
                              child: Text(
                                TeamBscore.toString(),
                                style: TextStyle(
                                    color: TeamBscoreColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 34),
                              ),
                            ),
                            Flexible(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: _textController2,
                                maxLength: 3,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                  signed: false,
                                ),
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: '   Score',
                                ),
                                onFieldSubmitted: (Text) {
                                  _textController2.text.isNotEmpty
                                      ? TeamBscore =
                                          int.parse(_textController2.text)
                                      : TeamBscore = 0;
                                  print(TeamAscore);
                                  print(TeamBscore);
                                  if (((TeamBscore % 10) < 8) &&
                                      ((TeamBscore % 10) > 4)) {
                                    TeamBscore =
                                        ((TeamBscore / 10).toInt()) * 10 + 10;
                                    TeamAscore = 170 - TeamBscore;
                                  } else if (((TeamBscore % 10) > 7)) {
                                    TeamBscore =
                                        ((TeamBscore / 10).toInt()) * 10 + 10;
                                    TeamAscore = 160 - TeamBscore;
                                  } else {
                                    TeamBscore =
                                        ((TeamBscore / 10).toInt()) * 10;
                                    TeamAscore = 160 - TeamBscore;
                                  }
                                  _textController2.clear();
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        )),
                  ),

            // DEDANS & KABOOT 3AARBII
            Container(
              margin: EdgeInsets.all(0),
              child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        child: RaisedButton(
                          splashColor: Colors.white,
                          onPressed: TeamName == "Cuphead"
                              ? Dedans_Score
                              : Dedans_Score2,
                          color: colors[1],
                          child: Text(
                            "Dedans",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: RaisedButton(
                          splashColor: Colors.white,
                          onPressed: TeamName == "Cuphead"
                              ? Kaboot_Arabe_Score
                              : Kaboot_Arabe_Score2,
                          color: colors[1],
                          child: Text(
                            "كبوط عربي",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            // CONTREE & KABOOT
            Container(
              margin: EdgeInsets.all(0),
              child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        child: RaisedButton(
                          splashColor: Colors.white,
                          onPressed: TeamName == "Cuphead"
                              ? Contree_Score
                              : Contree_Score2,
                          color: colors[1],
                          child: Container(
                            child: Text(
                              "Contré",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: RaisedButton(
                          splashColor: Colors.white,
                          onPressed: TeamName == "Cuphead"
                              ? Kaboot_Score
                              : Kaboot_Score2,
                          color: colors[1],
                          child: Text(
                            "كبوط ",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            // FEZOUUUZ
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                //height: 30,
                child: RaisedButton(
                  splashColor: Colors.white,
                  onPressed:
                      TeamName == "Cuphead" ? Fezouz_Score : Fezouz_Score2,
                  color: colors[1],
                  child: Text(
                    "في الزوز ",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ),

            // EL BELOTEE
            Container(
              margin: EdgeInsets.all(0),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  splashColor: Colors.white,
                  onPressed:
                      TeamName == "Cuphead" ? Belote_Score : Belote_Score2,
                  color: colors[1],
                  child: Text(
                    "+ BELOTE ",
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
          ],
        ),
      ),
    );
  }

  // W9AYET FONCTIONNEET
  void _showMaterialDialog({required String PicName}) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(milliseconds: 1000), () {
            Navigator.of(context).pop(true);
          });
          return Dialog(
            insetAnimationDuration: const Duration(microseconds: 100),
            backgroundColor: Colors.transparent,
            child: Container(
                alignment: FractionalOffset.center,
                height: 300.0,
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'images/$PicName.png',
                  fit: BoxFit.cover,
                )),
          );
        });
  }

  // 9AYEDLOO DEDANS
  void Dedans_Score() {
    setState(() {
      TeamAscore = 160;
      TeamBscore = 0;
      _scoreHighlighter();
      _showMaterialDialog(PicName: "lolaa-01");
    });
  }

  void Dedans_Score2() {
    setState(() {
      TeamBscore = 160;
      TeamAscore = 0;
      _scoreHighlighter();
      _showMaterialDialog(PicName: "lolaa-01");
    });
  }

  // 9AYEDLOO KABOOT 3AARBII
  void Kaboot_Arabe_Score() {
    setState(() {
      TeamAscore = 250;
      TeamBscore = 0;
      _scoreHighlighter();
      _showMaterialDialog(PicName: "thenyaa-01");
    });
  }

  void Kaboot_Arabe_Score2() {
    setState(() {
      TeamBscore = 250;
      TeamAscore = 0;
      _scoreHighlighter();
      _showMaterialDialog(PicName: "thenyaa-01");
    });
  }

  // 9AYEDLOO CONTREE
  void Contree_Score() {
    setState(() {
      TeamAscore = 300;
      TeamBscore = 0;
      _scoreHighlighter();
      _showMaterialDialog(PicName: "thelthaa-01");
    });
  }

  void Contree_Score2() {
    setState(() {
      TeamBscore = 300;
      TeamAscore = 0;
      _scoreHighlighter();
      _showMaterialDialog(PicName: "thelthaa-01");
    });
  }

  // 9AYEDLOO KABOOT
  void Kaboot_Score() {
    setState(() {
      TeamAscore = 500;
      TeamBscore = 0;
      _scoreHighlighter();
      _showMaterialDialog(PicName: "rab3aa-01");
    });
  }

  void Kaboot_Score2() {
    setState(() {
      TeamBscore = 500;
      TeamAscore = 0;
      _scoreHighlighter();
      _showMaterialDialog(PicName: "rab3aa-01");
    });
  }

  // 9AYEDLOO FEZOUUZ
  void Fezouz_Score() {
    setState(() {
      TeamAscore = 640;
      TeamBscore = 0;
      _scoreHighlighter();
      _showMaterialDialog(PicName: "khamsaa-01");
    });
  }

  void Fezouz_Score2() {
    setState(() {
      TeamBscore = 640;
      TeamAscore = 0;
      _scoreHighlighter();
      _showMaterialDialog(PicName: "khamsaa-01");
    });
  }

  // ZIDOU BELOTE
  void Belote_Score() {
    setState(() {
      TeamAscore += 20;
      _scoreHighlighter();
    });
  }

  void Belote_Score2() {
    setState(() {
      TeamBscore += 20;
      _scoreHighlighter();
    });
  }

  /// Highlights score of leading player with Green and score of lagging player with red otherwise black
  void _scoreHighlighter() {
    if (TeamAscore > TeamBscore) {
      TeamAscoreColor = Colors.green;
      TeamBscoreColor = Colors.red;
    } else if (TeamBscore > TeamAscore) {
      TeamBscoreColor = Colors.green;
      TeamAscoreColor = Colors.red;
    } else {
      TeamAscoreColor = TeamBscoreColor = Colors.black;
    }
  }
}
