import 'package:flutter/material.dart';
import 'package:marka_app/GamePage.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'nameprovider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isvisible = false;
  bool isvisiblewalla = false;
  bool wlhvisible = false;
  final playerController0 = TextEditingController();
  final playerController1 = TextEditingController();
  final playerController2 = TextEditingController();
  final playerController3 = TextEditingController();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        isvisible = true;
        wlhvisible = false;
        _controller.reset;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    playerController0.dispose();
    playerController1.dispose();
    playerController2.dispose();
    playerController3.dispose();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 90),
            child: Image.asset('images/hisokaa.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Visibility(
            visible: !isvisible,
            child: Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    wlhvisible = true;
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFfa5f74),
                  ),
                  child: Text(
                    'Launch Game',
                    style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: wlhvisible,
            child: Lottie.asset(
              'assets/belote.json',
              repeat: false,
              controller: _controller,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                _controller
                  ..duration = Duration(seconds: 3)
                  ..forward();
              },
            ),
          ),
          Visibility(
              visible: isvisible,
              child: Wrap(children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            onSubmitted: (text) {
                              isvisiblewalla = true;
                              setState(() {
                                Provider.of<NameProvider>(context,
                                        listen: false)
                                    .saveName1(text);
                              });
                            },
                            controller: playerController0,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                                prefixIconConstraints:
                                    BoxConstraints(minWidth: 45),
                                border: InputBorder.none,
                                hintText: 'Enter Player 1 name',
                                hintStyle: TextStyle(
                                    color: Color(0xFFfa5f74), fontSize: 12),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
                                        .copyWith(
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(0)),
                                    borderSide:
                                        BorderSide(color: Color(0xFFfa5f74))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
                                        .copyWith(
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent.shade700))),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isvisiblewalla,
                      child: Expanded(
                          flex: 1,
                          child: Container(
                              padding: EdgeInsets.only(bottom: 10),
                              width: 65,
                              height: 65,
                              child: playerController0.text.isNotEmpty
                                  ? Image.network(
                                      'https://robohash.org/${playerController0.text}')
                                  : null)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            onSubmitted: (text) {
                              isvisiblewalla = true;
                              setState(() {
                                Provider.of<NameProvider>(context,
                                        listen: false)
                                    .saveName2(text);
                              });
                            },
                            controller: playerController1,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                                prefixIconConstraints:
                                    BoxConstraints(minWidth: 45),
                                border: InputBorder.none,
                                hintText: 'Enter Player 2 name',
                                hintStyle: TextStyle(
                                    color: Color(0xFFfa5f74), fontSize: 12),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
                                        .copyWith(
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(0)),
                                    borderSide:
                                        BorderSide(color: Color(0xFFfa5f74))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
                                        .copyWith(
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent.shade700))),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isvisiblewalla,
                      child: Expanded(
                          flex: 1,
                          child: Container(
                              padding: EdgeInsets.only(bottom: 10),
                              width: 65,
                              height: 65,
                              child: playerController1.text.isNotEmpty
                                  ? Image.network(
                                      'https://robohash.org/${playerController1.text}')
                                  : null)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            onSubmitted: (text) {
                              isvisiblewalla = true;
                              setState(() {
                                Provider.of<NameProvider>(context,
                                        listen: false)
                                    .saveName3(text);
                              });
                            },
                            controller: playerController2,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                                prefixIconConstraints:
                                    BoxConstraints(minWidth: 45),
                                border: InputBorder.none,
                                hintText: 'Enter Player 3 name',
                                hintStyle: TextStyle(
                                    color: Color(0xFFfa5f74), fontSize: 12),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
                                        .copyWith(
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(0)),
                                    borderSide:
                                        BorderSide(color: Color(0xFFfa5f74))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
                                        .copyWith(
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent.shade700))),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isvisiblewalla,
                      child: Expanded(
                          flex: 1,
                          child: Container(
                              padding: EdgeInsets.only(bottom: 10),
                              width: 65,
                              height: 65,
                              child: playerController2.text.isNotEmpty
                                  ? Image.network(
                                      'https://robohash.org/${playerController2.text}')
                                  : null)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            onSubmitted: (text) {
                              isvisiblewalla = true;
                              setState(() {
                                Provider.of<NameProvider>(context,
                                        listen: false)
                                    .saveName4(text);
                              });
                            },
                            controller: playerController3,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                                prefixIconConstraints:
                                    BoxConstraints(minWidth: 45),
                                border: InputBorder.none,
                                hintText: 'Enter Player 4 name',
                                hintStyle: TextStyle(
                                    color: Color(0xFFfa5f74), fontSize: 12),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
                                        .copyWith(
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(0)),
                                    borderSide:
                                        BorderSide(color: Color(0xFFfa5f74))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
                                        .copyWith(
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent.shade700))),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isvisiblewalla,
                      child: Expanded(
                          flex: 1,
                          child: Container(
                              padding: EdgeInsets.only(bottom: 10),
                              width: 65,
                              height: 65,
                              child: playerController3.text.isNotEmpty
                                  ? Image.network(
                                      'https://robohash.org/${playerController3.text}')
                                  : null)),
                    )
                  ],
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        isvisible = true;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GamePage(),
                          ),
                        );
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFfa5f74),
                      ),
                      child: Text(
                        'Start',
                        style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                      )),
                ),
              ]))
        ]));
  }
}
