1. a) Install Flutter and Dart SDK

Output:a) Install Flutter and Dart SDK.
What is Flutter?
Flutter is an open-source UI software development toolkit created by Google. It is used to build natively compiled applications for:
•	Mobile platforms (Android & iOS),
•	Web browsers, and
•	Desktop operating systems (Windows, macOS, Linux)
… all from a single codebase.
Flutter uses a rich collection of widgets to design responsive and flexible user interfaces. Because Flutter compiles directly to native machine code, it offers high performance and smooth animations across all supported platforms.
What is Dart Programming Language?
Dart is a programming language developed by Google, primarily designed to build applications with Flutter.
•	It is object-oriented, strongly typed, and supports both just-in-time (JIT) and ahead-of-time (AOT) compilation.
•	Dart code can be compiled to native machine code for mobile and desktop apps or to JavaScript for web applications.
•	Dart is the primary language used to write Flutter applications due to its simplicity and performance advantages.
Uses of Flutter and Dart
Flutter is used for:
•	Developing cross-platform applications with native-like performance and appearance.
•	Creating rich and highly customizable user interfaces using a flexible widget system.
•	Rapid development cycles through hot reload, which lets developers see changes in real-time without restarting the app.
•	Building applications for Android, iOS, web, and desktop platforms from a single codebase, significantly reducing development time and effort.
Dart is used for:
•	Writing Flutter applications.
•	Backend and server-side development.
•	Creating command-line tools.
•	Developing web applications by compiling Dart to JavaScript.

Step-by-Step Installation of Flutter and Dart
Note: Flutter comes bundled with the Dart SDK. You do not need to install Dart separately when installing Flutter.
Step 1: System Requirements
For Windows:
•	Operating System: Windows 10 or 11 (64-bit)
•	Available Disk Space: At least 1.64 GB (excluding IDEs and other tools)
•	Additional Tools: Git installed, PowerShell available, and Chrome (required for Flutter web development)
Step 2: Download Flutter SDK
1.	Visit the official Flutter website:
https://flutter.dev/docs/get-started/install
2.	Select your operating system (e.g., Windows).
3.	Download the latest stable release of the Flutter SDK as a .zip archive.
Step 3: Extract Flutter SDK
1.	Extract the downloaded ZIP file to a permanent location on your computer.
Example location: C:\src\flutter
2.	Avoid extracting it to system directories that require administrator permissions, such as C:\Program Files\.
Step 4: Set Environment Variable (Path)
1.	Open System Properties → Environment Variables.
2.	Under System variables, select the Path variable and click Edit.
3.	Add the full path to the Flutter SDK’s bin folder, for example:
4.	C:\src\flutter\bin
5.	Save and close all dialogs.
Step 5: Verify Flutter Installation
1.	Open Command Prompt or PowerShell.
2.	Run the following command to verify Flutter is correctly installed and see what else you need to set up:
3.	flutter doctor
4.	Review the output. The tool will identify missing dependencies or required tools such as Android Studio or device drivers.
Step 6: Install Required Dependencies
•	Install Android Studio to get the Android SDK and emulator.
•	Optionally, install Visual Studio Code for a lightweight development environment.
•	Install Google Chrome if you intend to develop Flutter web applications.
Step 7: Install Flutter Plugins in Your IDE
•	Visual Studio Code:
Open VS Code → Extensions (Ctrl+Shift+X) → Search for and install the Flutter extension (which also installs the Dart extension).
•	Android Studio:
Open Android Studio → Preferences/Settings → Plugins → Search for Flutter → Install the plugin. The Dart plugin will be installed automatically as a dependency.
Step 8: Set Up Android Emulator (Optional)
1.	Open Android Studio and launch the AVD Manager (Android Virtual Device Manager).
2.	Create a new virtual device (e.g., Pixel 5 with API 33).
3.	Start the emulator and ensure it runs properly.
Step 9: Run Your First Flutter Application
1.	Open a terminal and create a new Flutter project:
2.	flutter create my_app
3.	Navigate into your project directory:
4.	cd my_app
5.	Run your Flutter app on the connected device or emulator:
6.	flutter run
Test Installation
To confirm that your Flutter setup is fully functional, run:
flutter doctor
Make sure that all sections have a green checkmark, indicating your environment is correctly configured.



1. b) Write a simple Dart program to understand the language basics.

Code:void main() {
  String name = 'John';
  int age = 20;

  print('Name: $name, Age: $age');

  if (age >= 18) {
    print('$name is an adult.');
  } else {
    print('$name is a minor.');
  }

  for (int i = 1; i <= 3; i++) {
    print('Count: $i');
  }

  greet(name);
}

void greet(String name) {
  print('Hello, $name!');
}
