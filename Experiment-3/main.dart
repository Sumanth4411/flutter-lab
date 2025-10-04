3. a) Design a responsive UI that adapts to different screen sizes.

Code: import 'package:flutter/material.dart';

void main() => runApp(ResponsiveApp());

class ResponsiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive UI Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Responsive UI Example')),
        body: ResponsiveLayout(),
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Small screen: Mobile layout
          return mobileLayout();
        } else if (constraints.maxWidth < 900) {
          // Medium screen: Tablet layout
          return tabletLayout();
        } else {
          // Large screen: Desktop layout
          return desktopLayout();
        }
      },
    );
  }

  Widget mobileLayout() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          titleText('Mobile Layout'),
          SizedBox(height: 20),
          responsiveBox(Colors.blue, 150),
          SizedBox(height: 20),
          responsiveBox(Colors.green, 150),
        ],
      ),
    );
  }

  Widget tabletLayout() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        children: [
          titleText('Tablet Layout'),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              responsiveBox(Colors.blue, 200),
              responsiveBox(Colors.green, 200),
            ],
          ),
        ],
      ),
    );
  }

  Widget desktopLayout() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 64, vertical: 32),
      child: Column(
        children: [
          titleText('Desktop Layout'),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              responsiveBox(Colors.blue, 250),
              responsiveBox(Colors.green, 250),
              responsiveBox(Colors.orange, 250),
            ],
          ),
        ],
      ),
    );
  }

  Widget titleText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget responsiveBox(Color color, double size) {
    return Container(
      width: size,
      height: size,
      color: color,
      alignment: Alignment.center,
      child: Text(
        'Box',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

3b) Implement media queries and breakpoints for responsiveness.

Code: import 'package:flutter/material.dart';

void main() => runApp(MediaQueryExampleApp());

class MediaQueryExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediaQuery & Breakpoints Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Responsive UI with MediaQuery')),
        body: ResponsiveWidget(),
      ),
    );
  }
}

class ResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width from MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints
    if (screenWidth < 600) {
      return mobileLayout();
    } else if (screenWidth < 900) {
      return tabletLayout();
    } else {
      return desktopLayout();
    }
  }

  Widget mobileLayout() {
    return Center(
      child: Container(
        color: Colors.blue,
        width: 150,
        height: 150,
        child: Center(
          child: Text('Mobile Layout',
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }

  Widget tabletLayout() {
    return Center(
      child: Container(
        color: Colors.green,
        width: 300,
        height: 300,
        child: Center(
          child: Text('Tablet Layout',
              style: TextStyle(color: Colors.white, fontSize: 24)),
        ),
      ),
    );
  }

  Widget desktopLayout() {
    return Center(
      child: Container(
        color: Colors.orange,
        width: 450,
        height: 450,
        child: Center(
          child: Text('Desktop Layout',
              style: TextStyle(color: Colors.white, fontSize: 30)),
        ),
      ),
    );
  }
}


