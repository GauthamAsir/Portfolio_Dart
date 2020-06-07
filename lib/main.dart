import 'package:flutter/material.dart';
import 'dart:js' as js;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Portfolio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<bool> isSelected;
  String text = "HEY";
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    isSelected = [true, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: new AssetImage("assets/floor.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scrollbar(
          controller: _scrollController,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(height: 100),
                Text(
                  'HELLO, WORLD!',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textScaleFactor: 5,
                ),
                Container(
                  height: 520,
                  width: 800,
                  child: Stack(
                    children: [
                      Container(
                        alignment: FractionalOffset.center,
                        height: 120,
                        child: ToggleButtons(
                          color: Colors.grey,
                          selectedColor: Colors.green,
                          fillColor: Colors.transparent,
                          isSelected: isSelected,
                          onPressed: (int index) {
                            setState(() {
                              for (int i = 0; i < isSelected.length; i++) {
                                isSelected[i] = i == index;
                              }
                            });
                          },
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: Card(
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 12),
                                      child: Row(
                                        children: [
                                          Icon(Icons.person),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('ABOUT ME')
                                        ],
                                      )),
                                )),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: Card(
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 12),
                                      child: Row(
                                        children: [
                                          Icon(Icons.insert_drive_file),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('SKILLS')
                                        ],
                                      )),
                                )),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: Card(
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 12),
                                      child: Row(
                                        children: [
                                          Icon(Icons.mail),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('CONTACT')
                                        ],
                                      )),
                                ))
                          ],
                        ),
                      ),
                      Positioned(
                        top: 75,
                        child: isSelected[1]
                            ? skills()
                            : isSelected[2] ? contactMe() : aboutMe(),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    ));
  }

  Widget aboutMe() {
    return Container(
      height: 350,
      width: 800,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: FractionalOffset.center,
                  margin:
                      EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 40),
                  width: 170,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/my_pic.png'))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Divider(
                      height: 60,
                    ),
                    Text(
                      'Gautham',
                      textScaleFactor: 3,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 22),
                      child: Text(
                        'App Developer',
                        textScaleFactor: 1.5,
                        style: TextStyle(
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      height: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 80),
                      child: Text(
                        'Description',
                        textScaleFactor: 1.2,
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Spacer(),
                Image.asset(
                  'assets/gmail.png',
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'gauthamasir@gmail.com',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      height: 6,
                    ),
                    Text(
                      'Email Address',
                      textScaleFactor: 0.8,
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
                Spacer(),
                Image.asset(
                  'assets/instagram.png',
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '__mellow__04',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      height: 6,
                    ),
                    Text(
                      'Instagram',
                      textScaleFactor: 0.8,
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
                Spacer(),
                Image.asset(
                  'assets/twitter.png',
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gautham0412',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      height: 6,
                    ),
                    Text(
                      'Twitter',
                      textScaleFactor: 0.8,
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
                Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget skills() {
    return Container(
      height: 360,
      width: 800,
      child: Card(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Programming',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        textScaleFactor: 2.0,
                      ),
                      Divider(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            'Java',
                            textScaleFactor: 1.3,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 200,
                            height: 20,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: LinearProgressIndicator(
                                  value: 1,
                                  backgroundColor: Colors.transparent,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.green)),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'Kotlin',
                            textScaleFactor: 1.3,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 200,
                            height: 20,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: LinearProgressIndicator(
                                  value: 0.6,
                                  backgroundColor: Colors.transparent,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.green)),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'Dart',
                            textScaleFactor: 1.3,
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          Container(
                            width: 200,
                            height: 20,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: LinearProgressIndicator(
                                  value: 0.5,
                                  backgroundColor: Colors.transparent,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.green)),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'Python',
                            textScaleFactor: 1.3,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                            width: 200,
                            height: 20,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: LinearProgressIndicator(
                                  value: 0.7,
                                  backgroundColor: Colors.transparent,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.green)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Image.asset(
                        'assets/github_logo.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Divider(),
                      RaisedButton(
                        color: Colors.blue[600],
                        child: Text(
                          'Github Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          js.context.callMethod(
                              "open", ["https://github.com/GauthamAsir"]);
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hobbies',
                textScaleFactor: 2,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[700]),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(4)),
                    padding:
                        EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                    alignment: FractionalOffset.center,
                    child: Text(
                      'Android Tweaking',
                      textScaleFactor: 1.0,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(4)),
                    padding:
                        EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                    alignment: FractionalOffset.center,
                    child: Text(
                      'Cricket',
                      textScaleFactor: 1.0,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(4)),
                    padding:
                        EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                    alignment: FractionalOffset.center,
                    child: Text(
                      'Fitness',
                      textScaleFactor: 1.0,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget contactMe() {
    return Container(
      height: 200,
      width: 800,
      child: Card(
          child: Row(
        children: [
          Spacer(),
          Image.asset(
            'assets/gmail.png',
            width: 80,
            height: 80,
          ),
          SizedBox(
            width: 6,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                'gauthamasir@gmail.com',
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Divider(
                height: 6,
              ),
              Text(
                'Email Address',
                textScaleFactor: 1.0,
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              js.context.callMethod(
                  "open", ["https://www.instagram.com/__mellow__04/"]);
            },
            child: Image.asset(
              'assets/instagram.png',
              width: 80,
              height: 80,
            ),
          ),
          SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: () {
              js.context.callMethod(
                  "open", ["https://www.instagram.com/__mellow__04/"]);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '__mellow__04',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Divider(
                  height: 6,
                ),
                Text(
                  'Instagram',
                  textScaleFactor: 1.0,
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              js.context
                  .callMethod("open", ["https://twitter.com/Gautham0412"]);
            },
            child: Image.asset(
              'assets/twitter.png',
              width: 80,
              height: 80,
            ),
          ),
          SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: () {
              js.context
                  .callMethod("open", ["https://twitter.com/Gautham0412"]);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gautham0412',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Divider(
                  height: 6,
                ),
                Text(
                  'Twitter',
                  textScaleFactor: 1.0,
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
          ),
          Spacer()
        ],
      )),
    );
  }
}
