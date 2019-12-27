import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, @required this.text}) : super(key: key);
  final String text;
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detail'),
      ),
      body: Container(
        child: Text(widget.text),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, '返回值');
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
