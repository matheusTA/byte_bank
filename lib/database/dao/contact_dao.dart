import 'package:byte_bank/database/app_database.dart';
import 'package:byte_bank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _account = 'account';
  static const String createTableQuery =
      'CREATE TABLE $_tableName($_id INTEGER PRIMARY KEY, $_name TEXT, $_account INTEGER)';

  List<Contact> _toList(List<Map<String, dynamic>> results) {
    final List<Contact> contacts = [];

    for (Map<String, dynamic> map in results) {
      contacts.add(
        Contact(map[_id], map[_name], map[_account]),
      );
    }
    return contacts;
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = {
      _name: contact.name,
      _account: contact.account
    };
    return contactMap;
  }

  Future<int> save(Contact contact) async {
    final Database database = await getDatabase();

    Map<String, dynamic> contactMap = _toMap(contact);

    return database.insert(_tableName, contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> results = await database.query(_tableName);

    List<Contact> contacts = _toList(results);

    return contacts;
  }
}
