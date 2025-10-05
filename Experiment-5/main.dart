5a) Learn about stateful and stateless widgets.

code:import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// Root App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(title: Text("Stateless vs Stateful")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyStatelessWidget(),
            SizedBox(height: 30),
            MyStatefulWidget(),
          ],
        ),
      ),
    );
  }
}

// Stateless Widget
class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange[200],
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "I am Stateless 😎",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Stateful Widget
class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue[100],
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("I am Stateful 🌀\nCounter: $counter",
                style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () => setState(() => counter++),
              child: Text("Add Count"),
            ),
          ],
        ),
      ),
    );
  }
}

5b) Implement state management using set State and Provider.

Code:import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MyApp(),
    ),
  );
}

// Root app with 2 tabs
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Cart Demo"),
            bottom: TabBar(tabs: [
              Tab(text: "setState"),
              Tab(text: "Provider"),
            ]),
          ),
          body: TabBarView(
            children: [LocalCart(), GlobalCart()],
          ),
        ),
      ),
    );
  }
}

/////////////////////////////
// 1. setState (Local Cart) //
/////////////////////////////
class LocalCart extends StatefulWidget {
  @override
  _LocalCartState createState() => _LocalCartState();
}

class _LocalCartState extends State<LocalCart> {
  int apples = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text("Apples: $apples", style: TextStyle(fontSize: 24)),
        ElevatedButton(
          onPressed: () => setState(() => apples++),
          child: Text("Add Apple"),
        ),
      ]),
    );
  }
}

/////////////////////////////
// 2. Provider (Global Cart) //
/////////////////////////////
class CartProvider extends ChangeNotifier {
  int items = 0;
  void add() {
    items++;
    notifyListeners();
  }
}

class GlobalCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text("Cart Items: ${cart.items}", style: TextStyle(fontSize: 24)),
        ElevatedButton(
          onPressed: cart.add,
          child: Text("Add Item"),
        ),
      ]),
    );
  }
}



