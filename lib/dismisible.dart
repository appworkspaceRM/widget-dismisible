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
