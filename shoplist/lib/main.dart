import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const APPCOLORS = ColorScheme(
        brightness: Brightness.dark,
        primary: Color.fromRGBO(105, 204, 84, 39), // Forest Green
        onPrimary: Colors.white70,
        secondary: Color.fromRGBO(105, 204, 84, 39),
        onSecondary: onSecondary,
        error: error,
        onError: onError,
        background: background,
        onBackground: onBackground,
        surface: surface,
        onSurface: onSurface)

    return MaterialApp(
      title: 'Shoplist',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: rootColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Shoplist: Modular Shopping List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // State variables

  // Add list items with respect to what section, and allow for consecutive
  // calls before closing out the function
  void _addItems() {
    setState(() {
      // Update the state of the application
    });
  }

  // Create a list section that will be displayed in the app window
  void _createSection() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Main Menu',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Section'),
              onTap: () {
                // Handle Add Section item tap
                Navigator.pop(context);
                // Implement the functionality for Add Section here
              },
            ),
            ListTile(
              leading: Icon(Icons.swap_vert),
              title: Text('Reorder Sections'),
              onTap: () {
                // Handle Reorder Sections item tap
                Navigator.pop(context);
                // Implement the functionality for Reorder Sections here
              },
            ),
            ListTile(
              leading: Icon(Icons.save),
              title: Text('Save Items'),
              onTap: () {
                // Handle Save Items item tap
                Navigator.pop(context);
                // Implement the functionality for Save Items here
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headlineSmall
              )
            );}
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItems,
        tooltip: 'Make new list items',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
