import 'package:counterapp/futuraClass/provider/movie_provider.dart';
import 'package:counterapp/futuraClass/provider/provider_page2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderHomePage extends StatefulWidget {
  const ProviderHomePage({super.key});

  @override
  State<ProviderHomePage> createState() => _ProviderHomePageState();
}

class _ProviderHomePageState extends State<ProviderHomePage> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text("provider"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Card(
                color: Colors.red,
                child: ListTile(
                  title: Text(
                    "My Favorite = ${myList.length}",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  trailing: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const ProviderPageTwo();
                        }),
                      );
                    },
                    child: Text(
                      "View",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView.builder(itemBuilder: (context, index) {
                final currentMovie = movies[index];
                return Card(
                  color: Colors.blue,
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      currentMovie.title,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: myList.contains(currentMovie)
                            ? Colors.red
                            : Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        if (myList.contains(currentMovie)) {
                          context
                              .read<MovieProvider>()
                              .removeFromList(currentMovie);
                        } else {
                          context.read<MovieProvider>().addToList(currentMovie);
                          print(
                              "current movie in else = ${currentMovie.title}");
                        }
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
