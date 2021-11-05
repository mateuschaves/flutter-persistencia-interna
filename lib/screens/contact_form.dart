import 'package:bytebank/database/dao/contact.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactForm extends StatefulWidget {
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _accountNumber = TextEditingController();

  final ContactDao _contactDao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  labelText: 'Full name',
                ),
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _accountNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Account number',
                ),
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () async {
                      final String name = _name.text;
                      final int accountNumber =
                          int.tryParse(_accountNumber.text);

                      final Contact newContact =
                          Contact(0, name, accountNumber);

                      await _contactDao.save(newContact);
                      Navigator.pop(context);
                    },
                    child: Text('Create')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
