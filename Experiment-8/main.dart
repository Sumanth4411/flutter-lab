8a) Add animations to UI elements using Flutter's animation framework.

Code:import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimationPage(),
    );
  }
}

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool _big = false;
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Animations")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _big = !_big;
                });
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: _big ? 200 : 100,
                height: _big ? 200 : 100,
                color: _big ? Colors.blue : Colors.red,
                child: Center(
                  child: Text("Tap Me",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
              child: Text("Toggle Text"),
            ),
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Text("Hello Flutter!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

8b) Experiment with different types of animations (fade, slide, etc.).

Code:import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiple Animations',
      home: AnimationExample(),
    );
  }
}
class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}
class _AnimationExampleState extends State<AnimationExample> {
  bool _visible = true;
  bool _moved = false;
  bool _scaled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fade, Slide & Scale Animations')),
      body: Stack(
        children: [
          // Slide Animation
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            top: _moved ? 300 : 100,
            left: 100,
            child: AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _visible ? 1.0 : 0.0,
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: _scaled ? 150 : 100,
                height: _scaled ? 150 : 100,
                color: Colors.teal,
                child: Center(
                  child: Text(
                    'Animate Me',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            _visible = !_visible;  // Fade
            _moved = !_moved;      // Slide
            _scaled = !_scaled;    // Scale
          });
        },
      ),
    );
  }
}



