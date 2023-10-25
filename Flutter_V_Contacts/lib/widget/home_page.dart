import 'package:flutter/material.dart';

import '../model/contact_book.dart';

class HomePage extends StatelessWidget
{
  const HomePage({Key ? key}):super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(

      ),
      body: ValueListenableBuilder(
        builder: (contact,value,child)
        {
          final contacts = value;
          return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                final contact=contacts[index];
                return Dismissible(
                  onDismissed:(direction) {
                    contacts.remove(contact);
                  },
                  key: ValueKey(contact.id),
                  child: Material(
                    color: Colors.white,
                    elevation: 6.0,
                    child: ListTile(
                      title: Text(contact.name),
                    ),
                  ),
                );
              }
          );
        },
        valueListenable: ContactBook(),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/new-contact');
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}