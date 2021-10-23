import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/store_model.dart';

class BookListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List book"),),
      body: Consumer<StoreModel>(
        builder: (context, store, child) => ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemCount: store.books.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Book",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        IconButton(
                            onPressed: () {
                              Provider.of<StoreModel>(context,
                                  listen: false)
                                  .deleteBook(index);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                    const Divider(thickness: 1, color: Colors.blueAccent,),
                    Text("Id: ${store.books[index].id}",
                        style: const TextStyle(fontSize: 15)),
                    Text("Name: ${store.books[index].name}",
                        style: const TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
