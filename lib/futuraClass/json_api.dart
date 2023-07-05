import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BackendJson extends StatefulWidget {
  const BackendJson({super.key});

  @override
  State<BackendJson> createState() => _BackendJsonState();
}

class _BackendJsonState extends State<BackendJson> {
  var data;
  bool gotData = false;
  bool downLoading = false;

  Future downLoadData() async {
    var response;
    try {
      var url = Uri.parse('https://dummyjson.com/products/1');
      response = await http.get(url);
    } catch (e) {
      print("Error = $e");
      return false;
    }
    print("Data status code = ${response.statusCode}");
    print("Data = ${response.body}");

    data = jsonDecode(response.body);
    print("Json decode= $data");
    print("Title = ${data["title"]}");
    setState(() {});
    return true;
  }

  Future post() async {
    var response;
    var data = {"title": "I am in love with someone.", "userId": "5"};
    try {
      var url = Uri.parse('https://dummyjson.com/posts/add');
      response = await http.post(url, body: data);
    } catch (e) {
      print("Error = $e");
      return false;
    }
    print("Data Status Code = ${response.statusCode}");
    print("Data = ${response.body}");
    return true;
  }

  Future put() async {
    var response;
    var data = {
      "title": "I think I should shift to the moon",
    };
    try {
      var url = Uri.parse("https://dummyjson.com/posts/1");
      response = await http.put(url, body: data);
    } catch (e) {
      print("Error = $e");
      return false;
    }
    print("Data Status Code = ${response.statusCode}");
    print("Data = ${response.body}");
    return true;
  }

  Future delete() async {
    var response;
    // var data = {"title":"I think I should shift to the moon",};
    try {
      var url = Uri.parse("https://dummyjson.com/posts/1");
      response = await http.delete(url);
    } catch (e) {
      print("Error = $e");
      return false;
    }
    print("Data Status Code = ${response.statusCode}");
    print("Data = ${response.body}");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("http Demo"),
      ),
      body: Center(
        child: Column(
          children: [
            downLoading
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.30,
                    color: Colors.grey,
                    margin: EdgeInsets.only(bottom: 30),
                    padding: EdgeInsets.all(30),
                    child: gotData
                        ? Column(
                            children: [
                              Text(
                                "Item = ${data["title"]}",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Id = ${data["Id"]}",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Category = ${data["Category"]}",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Price = ${data["Price"]}",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Brand = ${data["Brand"]}",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: CircularProgressIndicator(),
                            ),
                          ))
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.30,
                    color: Colors.grey,
                    margin: EdgeInsets.only(bottom: 30),
                    padding: EdgeInsets.all(30),
                    child: Text("Tap download button to start download"),
                  ),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    downLoading = true;
                  });
                  gotData = await downLoadData();
                },
                child: Text(
                  "Get",
                  style: TextStyle(fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  post();
                },
                child: Text("Post")),
            ElevatedButton(
                onPressed: () {
                  put();
                },
                child: Text("Put")),
            ElevatedButton(
                onPressed: () {
                  delete();
                },
                child: Text("delete")),
          ],
        ),
      ),
    );
  }
}

class BaseClient {
  static const String baseUrl = "https://dummyjson.com/products/";
}
