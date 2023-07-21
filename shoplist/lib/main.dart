import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        onSecondary: Colors.white70,
        error: Colors.redAccent,
        onError: Colors.white70,
        background: Colors.white70,
        onBackground: Colors.black87,
        surface: Colors.lightGreen,
        onSurface: Colors.black87);

    return MaterialApp(
      title: 'Shoplist',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: APPCOLORS,
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
  // Add list items with respect to what section, and allow for consecutive
  // calls before closing out the function
  void _addItems() {
    setState(() {
      showDialog(context: context, builder: (BuildContext context) {
        return _AddItemPopup();
      });
    });
  }

  // Create a list section that will be displayed in the app window
  void _createSection() {
    setState(() {

    });
  }

  // Main app screen build call
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ItemModel(),
        child: Scaffold(
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
              children: List.generate(1, (index) {
                return Center(
                  child: Text(
                    'Apples',
                    style: Theme.of(context).textTheme.headlineSmall
                  )
                );}
              )
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addItems();
            },
            tooltip: 'Make new list items',
            child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      )
    );
  }
}

class _AddItemPopup extends StatefulWidget {
  @override
  _AddItemPopupState createState() => _AddItemPopupState();
}

class _AddItemPopupState extends State<_AddItemPopup> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Item Name'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Text'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            _newItem(context);
          },
          child: Text(
              'Confirm & Make Another',
              style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: () {
            _Confirm(context);
          },
          child: Text(
              'Confirm & Exit Menu',
              style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: () {
            _Cancel(context);
          },
          child: Text(
              'Cancel',
              style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

// Class for the Shopping List data object
class ItemModel extends ChangeNotifier {
  List<String> items = [];

  void addItem(String item) {
    items.add(item);
    notifyListeners(); // Notify listeners about the change
  }
}

void _Cancel(BuildContext context) {
  Navigator.of(context).pop();
}

void _Confirm(BuildContext context) {
  Provider.of<ItemModel>(context, listen: false).addItem("New Item"); // --TODO-- Reach the text field and add the text field value
  Navigator.of(context).pop();                                        // to the list
}

void _newItem(BuildContext context) {
  Provider.of<ItemModel>(context, listen: false).addItem("New Item"); // above here too same deal
  // --TODO-- Reach the text field from the given context and clear the text field
}