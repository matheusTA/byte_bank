import 'package:byte_bank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String createTableQuery =
    'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, account INTEGER)';

Future<Database> createDatabase() {
  return getDatabasesPath().then((databasePath) {
    final String path = join(databasePath, 'bytebank.db');

    return openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(createTableQuery);
    });
  });
}

Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = {
      "name": contact.name,
      "account": contact.account
    };

    return db.insert('contacts', contactMap);
  });
}

Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((contactsMaps) {
      final List<Contact> contacts = [];

      for (Map<String, dynamic> map in contactsMaps) {
        contacts.add(
          Contact(map['id'], map['name'], map['account']),
        );
      }

      return contacts;
    });
  });
}
