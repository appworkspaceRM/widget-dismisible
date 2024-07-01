# flutter_application_19

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Dismissible

merupakan fungsi yang dapat melakukan aksi dengan cara menggeser sebuah wiget. dismissible menghapus sebuah list view dari tumpukan childern dengan menggesernya. dismissible mempunyai required properti atau named argument yang harus diisi seperti key yang memerlukan Widget Key.

dismissible bisa dimodifikasi dengan menggunakan beberapa properti sehingga mengubah behavior defaultnya seperti:

- direction : memerlukan DismissDirection dengan enum
- background : memerlukan sebuah widget untuk menandakan background dari dismissible.
- onDismiss : yang mengembalikan sebuah function.
- confirmDismiss : yang mengembalikan sebuah function yang membawa direction dan merupakan sebuah Future. saat melakukan pop pada dialog (Navigator.of(context).pop(true or false). agar onDismiss dapat membaca kembalian true atau false. jika false onDismiss tidak bekerja jika true onDismiss bekerja.

```dart
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class MyDismissible extends StatelessWidget {
  final Faker faker = Faker();
  MyDismissible({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dismissible'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Dismissible(
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {}
              },
              confirmDismiss: (direction) {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text('This action cannot be undone.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.red,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              key: Key(index.toString()),
              child: ListTile(
                leading: CircleAvatar(
                  child: Center(
                    child: Text('${index + 1}'),
                  ),
                ),
                title: Text(faker.person.name()),
                subtitle: Text(faker.lorem.sentence()),
              ),
            );
          },
        ));
  }
}
```
![code-snapshot](https://github.com/appworkspaceRM/widget-dismisible/assets/135511281/90199930-16b1-415c-979c-50ae44d6554a)

