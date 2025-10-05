9a) Fetch data from a REST API.

Code:import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REST API Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ApiDemoPage(),
    );
  }
}

class ApiDemoPage extends StatelessWidget {
  // Function to fetch data from Advice API
  Future<String> fetchAdvice() async {
    final response =
        await http.get(Uri.parse("https://api.adviceslip.com/advice"));

    if (response.statusCode == 200) {
      // Convert response JSON into a Dart Map
      final data = json.decode(response.body);
      return data["slip"]["advice"]; // Extract the advice text
    } else {
      throw Exception("Failed to load advice");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fetch Data from REST API")),
      body: Center(
        child: FutureBuilder<String>(
          future: fetchAdvice(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // ⏳ Loading
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  snapshot.data!, // Show fetched advice
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
            } else {
              return Text("No data found");
            }
          },
        ),
      ),
    );
  }
}

9b) Display the fetched data in a meaningful way in the UI.

Code:import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REST API Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PostsPage(),
    );
  }
}

class PostsPage extends StatelessWidget {
  // Function to fetch list of posts
  Future<List<dynamic>> fetchPosts() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      return json.decode(response.body); // returns List of posts
    } else {
      throw Exception("Failed to load posts");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts from API")),
      body: FutureBuilder<List<dynamic>>(
        future: fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Loading
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}")); // Error
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;
            // Display posts in a ListView
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      post['title'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(post['body']),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("No data found"));
          }
        },
      ),
    );
  }
}



