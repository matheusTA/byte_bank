import 'package:byte_bank/components/input.dart';
import 'package:byte_bank/database/dao/contact_dao.dart';
import 'package:byte_bank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactsForm extends StatefulWidget {
  const ContactsForm({Key? key}) : super(key: key);

  @override
  State<ContactsForm> createState() => _ContactsFormState();
}

class _ContactsFormState extends State<ContactsForm> {
  final TextEditingController _controllerContactName = TextEditingController();
  final TextEditingController _controllerContactAccount =
      TextEditingController();
  final ContactDao _dao = ContactDao();

  void _createContact(BuildContext context) {
    final String name = _controllerContactName.text;
    final int? account = int.tryParse(_controllerContactAccount.text);

    if (account != null) {
      final contactCreated = Contact(0, name, account);
      _dao.save(contactCreated).then((id) => Navigator.pop(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Criando contato'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Input(
              inputController: _controllerContactName,
              label: 'Nome',
              suffixIcon: Icons.person,
            ),
            Input(
              inputController: _controllerContactAccount,
              label: 'Conta',
              suffixIcon: Icons.add_card_outlined,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0),
              child: ElevatedButton(
                onPressed: () => _createContact(context),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Confirmar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
