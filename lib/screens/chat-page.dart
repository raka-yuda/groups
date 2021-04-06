import 'package:flutter/material.dart';
import '../datas/data.dart';

class HomePage extends StatelessWidget {
  static const String id = 'chat-page';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: dataGroup.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            height: 50,
            color: Colors.amber[600],
            child: Center(child: Text('Data : ${dataGroup[index]}')),
          );
        },
      )
    );
  }
}
