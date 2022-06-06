import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, String? id}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? usersData;
  List? filterData;

  bool isLoading = true;
  bool isSearching = false;
  final String url = "https://akabab.github.io/superhero-api/api/all.json";

  Future getData() async {
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    List data = jsonDecode(response.body);
    setState(() {
      usersData = filterData = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  void _filterHero(value) {
    setState(() {
      filterData = usersData!
          .where((element) => element['name']
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  void _backtonormal() {
    setState(() {
      filterData = usersData!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? Text('All Heroes')
            : TextField(
                autofocus: true,
                onChanged: (value) {
                  _filterHero(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.white),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                      _backtonormal();
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: Container(
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: filterData == null ? 0 : filterData?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        int id = filterData?[index]['id'];
                        // print(id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HeroDetails(id: id),
                          ),
                        );
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => HeroDetail(
                        //               id: id,
                        //             )));
                      },
                      child: Card(
                          child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.all(20.0),
                              child: Image(
                                width: 70.0,
                                height: 70.0,
                                fit: BoxFit.contain,
                                image: NetworkImage(
                                  filterData?[index]['images']['xs'],
                                ),
                              )),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  filterData?[index]['name'],
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Full Name: ${filterData?[index]['biography']['fullName']}",
                                ),
                                Text(
                                  "Publisher: ${filterData?[index]['biography']['publisher']}",
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
