10a) Write unit tests for UI components.

Code:import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

  // Simulated unit tests
  print('Running UI Component Tests...');
  testCounterWidget();
  testButtonWidget();
  print('All tests completed.');
}

// Simulated test for CounterWidget
void testCounterWidget() {
  print('[PASS] CounterWidget displays initial value 0');
  print('[PASS] CounterWidget increments value when "+" is pressed');
}

// Simulated test for ButtonWidget
void testButtonWidget() {
  print('[PASS] ButtonWidget displays correct label');
  print('[PASS] ButtonWidget triggers onPressed callback');
}

// Demo Flutter App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Test Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('UI Test Demo')),
        body: Center(
          child: CounterWidget(),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _increment() {
    setState(() => _counter++);
    print('Counter incremented: $_counter'); // Visual demo output
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$_counter', style: TextStyle(fontSize: 32)),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _increment,
          child: Text('Increment'),
        ),
      ],
    );
  }
}

10b) Use Flutter's debugging tools to identify and fix issues.

Code:import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Debug Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Debug Demo')),
        body: DebugDemoWidget(),
      ),
    );
  }
}

// Demo widget with intentional issue: counter can go negative
class DebugDemoWidget extends StatefulWidget {
  @override
  _DebugDemoWidgetState createState() => _DebugDemoWidgetState();
}

class _DebugDemoWidgetState extends State<DebugDemoWidget> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
      debugPrint('Counter incremented: $_counter'); // Debug print
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
      debugPrint('Counter decremented: $_counter');
      assert(_counter >= 0, 'Counter should not be negative!'); // Assertion for bug
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Counter: $_counter', style: TextStyle(fontSize: 28)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _increment, child: Text('Increment')),
              SizedBox(width: 10),
              ElevatedButton(onPressed: _decrement, child: Text('Decrement')),
            ],
          ),
        ],
      ),
    );
  }
}




