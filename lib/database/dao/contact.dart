import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bytebank/database/app_database.dart';

class ContactDao {
  static const String _tableName = 'contacts';

  static const String tableSql = 'CREATE TABLE $_tableName ('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account_number INTEGER '
      ')';

  Future<int> save(Contact contact) async {
    final Database db = await createDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    List<Contact> contacts = _toList(maps);

    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> maps) {
    final List<Contact> contacts = List.empty(growable: true);

    for (Map<String, dynamic> map in maps) {
      final Contact contact =
          Contact(map['id'], map['name'], map['account_number']);
      contacts.add(contact);
    }
    return contacts;
  }
}
