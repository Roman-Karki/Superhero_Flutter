import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:glassmorphism/glassmorphism.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HeroDetails extends StatefulWidget {
  // HeroDetails({Key? key}) : super(key: key);
  final int id;

  const HeroDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<HeroDetails> createState() => _HeroDetailsState();
}

class _HeroDetailsState extends State<HeroDetails> {
  List? usersData1;
  bool isLoading = true;

  final String url = "https://akabab.github.io/superhero-api/api/all.json";

  // static String? id1;

  Future getdata() async {
    var response = await http.get(
      Uri.parse(url),
    );

    setState(() {
      List data = jsonDecode(response.body);

      usersData1 = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Color.fromARGB(255, 160, 155, 154),
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: isLoading
              ? CircularProgressIndicator()
              : Column(children: <Widget>[
                  Image(
                    width: 250.0,
                    height: 250.0,
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      usersData1![usersData1!
                              .indexWhere((item) => item["id"] == widget.id)]
                          ['images']['md'],
                    ),
                  ),
                  Text(
                    usersData1?[usersData1!
                        .indexWhere((item) => item["id"] == widget.id)]['name'],
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  GlassmorphicContainer(
                    height: MediaQuery.of(context).size.height - 400,
                    width: MediaQuery.of(context).size.width,
                    borderRadius: 10,
                    blur: 15,
                    // alignment: Alignment.center,
                    border: 2,
                    linearGradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.white38.withOpacity(0.2)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderGradient: LinearGradient(colors: [
                      Colors.white24.withOpacity(0.2),
                      Colors.white70.withOpacity(0.2)
                    ]),
                    child: ListView.builder(
                        itemCount: usersData1 == null ? 0 : 1,
                        itemBuilder: (BuildContext context, int index) {
                          String intel =
                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['powerstats']['intelligence']}";
                          int intelligence = int.parse(intel);

                          String streng =
                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['powerstats']['strength']}";
                          int strength = int.parse(streng);

                          String spee =
                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['powerstats']['speed']}";
                          int speed = int.parse(spee);

                          String durab =
                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['powerstats']['durability']}";
                          int durability = int.parse(durab);

                          String pow =
                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['powerstats']['power']}";
                          int power = int.parse(pow);

                          String comb =
                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['powerstats']['combat']}";
                          int combat = int.parse(comb);

                          return Column(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(top: 5.0)),
                              Text(
                                "Biography",
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Full Name : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['biography']['fullName']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Alter Egos : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['biography']['alterEgos']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Publisher : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['biography']['publisher']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Place of Birth : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['biography']['placeOfBirth']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'First Appearance : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['biography']['firstAppearance']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Aliases : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['biography']['aliases']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Alignment : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['biography']['alignment']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                "Appearance",
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Race : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['appearance']['race']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Gender : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['appearance']['gender']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Eye Color : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['appearance']['eyeColor']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Hair Color : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['appearance']['hairColor']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Height : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['appearance']['height']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Weight : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['appearance']['weight']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                "Power Status",
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              new LinearPercentIndicator(
                                width: 200.0,
                                lineHeight: 14.0,
                                percent: intelligence / 100,
                                center: Text(
                                  "$intelligence%",
                                  style: new TextStyle(fontSize: 12.0),
                                ),
                                trailing: new Text(" : Intelligence",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    )),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.blue,
                              ),
                              new LinearPercentIndicator(
                                width: 200.0,
                                lineHeight: 14.0,
                                percent: strength / 100,
                                center: Text(
                                  "$strength%",
                                  style: new TextStyle(fontSize: 12.0),
                                ),
                                trailing: new Text(" : Strength",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    )),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.blue,
                              ),
                              new LinearPercentIndicator(
                                width: 200.0,
                                lineHeight: 14.0,
                                percent: speed / 100,
                                center: Text(
                                  "$speed%",
                                  style: new TextStyle(fontSize: 12.0),
                                ),
                                trailing: new Text(" : Speed ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    )),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.blue,
                              ),
                              new LinearPercentIndicator(
                                width: 200.0,
                                lineHeight: 14.0,
                                percent: durability / 100,
                                center: Text(
                                  "$durability%",
                                  style: new TextStyle(fontSize: 12.0),
                                ),
                                trailing: new Text(" : Durability",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    )),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.blue,
                              ),
                              new LinearPercentIndicator(
                                width: 200.0,
                                lineHeight: 14.0,
                                percent: power / 100,
                                center: Text(
                                  "$power%",
                                  style: new TextStyle(fontSize: 12.0),
                                ),
                                trailing: new Text(" : Power",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    )),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.blue,
                              ),
                              new LinearPercentIndicator(
                                width: 200.0,
                                lineHeight: 14.0,
                                percent: combat / 100,
                                center: Text(
                                  "$combat%",
                                  style: new TextStyle(fontSize: 12.0),
                                ),
                                trailing: new Text(" : Combat",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    )),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.blue,
                              ),
                              Text(
                                "Work",
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Occupation : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['work']['occupation']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Base : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['work']['base']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                "Connections",
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Group Affiliation : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['connections']['groupAffiliation']}"),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 5.0)),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Relatives : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                      TextSpan(
                                          text:
                                              "${usersData1?[usersData1!.indexWhere((item) => item["id"] == widget.id)]['connections']['relatives']}"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  )
                ]),
        ),
      ),
    );
  }
}
