import 'package:byte_bank/models/contact.dart';
import 'package:byte_bank/screens/contacts_form.dart';
import 'package:flutter/material.dart';

class ContactsItem extends StatelessWidget {
  final Contact contact;

  const ContactsItem({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.add_card_outlined,
          size: 40.0,
        ),
        title: Text(contact.name.toString()),
        subtitle: Text(contact.account.toString()),
      ),
    );
  }
}

class ContactsList extends StatefulWidget {
  final List<Contact> _contacts = [];

  ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  void _addNewContact(Contact? contact) {
    if (contact != null) {
      setState(() {
        widget._contacts.add(contact);
      });
    }
  }

  void _navigateContactsFormScreen(BuildContext context) {
    Navigator.push<Contact>(context, MaterialPageRoute(builder: (context) {
      return const ContactsForm();
    })).then((contact) => _addNewContact(contact));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Contatos'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: widget._contacts.length,
        itemBuilder: (context, index) {
          final contact = widget._contacts[index];
          return ContactsItem(contact: contact);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _navigateContactsFormScreen(context),
      ),
    );
  }
}
