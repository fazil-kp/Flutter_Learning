import 'package:counterapp/futuraClass/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPageTwo extends StatefulWidget {
  const ProviderPageTwo({super.key});

  @override
  State<ProviderPageTwo> createState() => _ProviderPageTwoState();
}

class _ProviderPageTwoState extends State<ProviderPageTwo> {
  @override
  Widget build(BuildContext context) {
    var myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Fav'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: myList.length,
                  itemBuilder: (context, index) {
                    final currentMovie = myList[index];
                    return Card(
                      color: Colors.blue,
                      child: ListTile(
                        title: Text(myList[index].title),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            context
                                .read<MovieProvider>()
                                .removeFromList(currentMovie);
                          },
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
