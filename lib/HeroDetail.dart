import 'package:flutter/material.dart';

class HeroDetail extends StatelessWidget {
  final String id;
  HeroDetail({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          title: Text('Student Info'),
        ),
        body: Form(
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(50.0),
                  ),
                  ListTile(
                    leading: Icon(Icons.school),
                    title: Text(id),
                  ),
                ]))));
  }
}
