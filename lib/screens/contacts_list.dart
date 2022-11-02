import 'package:byte_bank/components/loading.dart';
import 'package:byte_bank/database/dao/contact_dao.dart';
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
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();

  void _navigateContactsFormScreen(BuildContext context) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => const ContactsForm(),
          ),
        )
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Contatos'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: _dao.findAll(),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Loading();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data!;
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return ContactsItem(contact: contact);
                },
              );
          }

          return const Text("Erro ao carregar dados!");
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _navigateContactsFormScreen(context),
      ),
    );
  }
}
