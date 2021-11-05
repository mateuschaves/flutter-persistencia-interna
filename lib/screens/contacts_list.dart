import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('Alex', style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              subtitle: Text('1000', style: TextStyle(fontSize: 16.0)),
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator
            .of(context)
            .push(MaterialPageRoute(
                builder: (context) => ContactForm()
              )
            ).then((value) => debugPrint(value.name.toString()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}