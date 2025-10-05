6a) Create custom widgets for specific UI elements.

Code:import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// Root app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Profile App")),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileCard(
                name: "John Doe",
                email: "john.doe@example.com",
              ),
              SizedBox(height: 20),
              ActionButton(
                text: "Follow",
                color: Colors.green,
                onPressed: () {
                  // Example action
                  print("Follow button clicked");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Profile Card Widget
class ProfileCard extends StatelessWidget {
  final String name;
  final String email;

  ProfileCard({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(email),
      ),
    );
  }
}

// Custom Action Button Widget
class ActionButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  ActionButton({required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}


6b) Apply styling using themes and custom styles.

Code:import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(title: Text("Theme Demo")),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Hello Flutter!", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => setState(() => isDark = !isDark),
                child: Text(isDark ? "Switch to Light" : "Switch to Dark"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

