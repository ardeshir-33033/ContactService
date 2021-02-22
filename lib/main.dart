import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Screens/ContactPagepicker.dart';
import 'Screens/ContactsListPage.dart';
import 'Widget/AddContact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/add': (BuildContext context) => AddContactPage(),
        '/contactsList': (BuildContext context) => ContactListPage(),
        '/nativeContactPicker': (BuildContext context) => ContactPickerPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _askPermissions() async {
    if (await Permission.contacts.request().isGranted) {}
  }

  @override
  void initState() {
    _askPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts Plugin Example')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              child: const Text('Contacts list'),
              onPressed: () => Navigator.pushNamed(context, '/contactsList'),
            ),
            RaisedButton(
              child: const Text('Native Contacts picker'),
              onPressed: () =>
                  Navigator.pushNamed(context, '/nativeContactPicker'),
            ),
          ],
        ),
      ),
    );
  }
}
