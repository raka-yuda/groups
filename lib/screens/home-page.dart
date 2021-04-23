import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home-page';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.only(left: 24, right: 24, top: 42),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Messages',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38)),
          SizedBox(height: 24),
          Container(
              height: 72,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Center(
                  child: Text('Latest',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              )),
          SizedBox(height: 24),
          ListTileMessage(
              'Raka', 'Yesterday', 'This is a long long long messages'),
          ListTileMessage(
              'Raka', 'Yesterday', 'This is a long long long messages'),
          ListTileMessage(
              'Raka', 'Yesterday', 'This is a long long long messages'),
          ListTileMessage(
              'Raka', 'Yesterday', 'This is a long long long messages'),
        ],
      ),
    );
  }
}

class ListTileMessage extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String lastMessageTime;

  ListTileMessage(this.name, this.lastMessageTime, this.lastMessage);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.brown.shade800,
                child: Text('A'),
              ),
              SizedBox(width: 8),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(name,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text(lastMessageTime,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(lastMessage,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
                ),
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Divider(
              height: 4,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
