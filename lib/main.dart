// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/Starry_Night.png'),
            ),
          ),
          child: SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: 10.0),
                  Text(
                    "The World Greatest Artists",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                      child: Row(
                        children: [
                          buildArtistPicture("Leonardo_da_Vinci"),
                          SizedBox(width: 10),
                          buildArtistPicture("Raffaello_Sanzio"),
                          SizedBox(width: 10),
                          buildArtistPicture("Miguel_Angel"),
                          SizedBox(width: 10),
                          buildArtistPicture("Giorgio_Vasari"),
                          SizedBox(width: 10),
                          buildArtistPicture("Tiziano_Vecellio"),
                        ],
                      )),
                  Divider(
                    thickness: 2,
                    height: 10,
                    indent: 30,
                    endIndent: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.panorama,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("ArtWorks",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.panorama,
                        size: 20.0,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
                      child: Column(
                        children: [
                          ArtWorkStack(
                            artwork: "The Birth of Venus",
                            artworkFilename: "The_Birth_of_Venus"
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ArtWorkStack(
                            artwork: "The Creation of Adam",
                            artworkFilename: "The_Creation_of_Adam"
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ArtWorkStack(
                            artwork: "The Gleaners",
                            artworkFilename: "The_Gleaners"
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ArtWorkStack(
                            artwork: "Last Supper", 
                            artworkFilename: "Last_Supper"
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

StatelessWidget buildArtistPicture(String name) {
  return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/$name.jpg'),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle)
  );
}

class ArtWorkStack extends StatelessWidget {
  const ArtWorkStack({super.key, required this.artwork, required this.artworkFilename});

  final String artwork;
  final String artworkFilename;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$artworkFilename.jpg'),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 5,
              color: Colors.brown.shade700,
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          child: Text(
            artwork,
            style: TextStyle(
              fontSize: 15,
              color: Colors.yellow.shade300,
            ),
          ),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
