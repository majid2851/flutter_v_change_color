
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class Contact{
  final String id;
  final String name;

  Contact({required this.name}):id=const Uuid().v4();
}

class ContactBook extends ValueNotifier<List<Contact>>
{
  //This is the way to create Singleton object in flutter

  ContactBook._sharedInstance():super([]);//it's because valueNotifier has to
  //have at least empty constructor
  static final ContactBook _shared=ContactBook._sharedInstance();
  factory ContactBook() => _shared; // return _shared


  final List<Contact> _contacts = [];
  int get length => value.length;//return contacts length

  void add({required Contact contact}){
    final contacts=value;
    value.add(contact);
    value=contacts;
    notifyListeners();

  }
  void remove({required Contact contact})
  {
    final contacts=value;
    if(contacts.contains(contact))
    {
      contacts.remove(contact);
      notifyListeners();
    }


    value.remove(contact);
  }

  Contact ? contact({required int atIndex}) =>
      value.length > atIndex ? value [atIndex] : null;


}
