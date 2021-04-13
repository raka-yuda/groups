import 'package:flutter/material.dart';
import '../datas/data.dart';

class ChatPage extends StatelessWidget {
  static const String id = 'chat-page';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'chat-screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  BubbleChat(
                    isMe: true,
                    message: 'Hiiii',
                  ),
                  BubbleChat(
                    isMe: false,
                    message: 'Hiiii',
                  ),
                  BubbleChat(
                    isMe: true,
                    message: 'Hiiii',
                  ),
                  BubbleChat(
                    isMe: false,
                    message: 'Hiiii',
                  ),
                  BubbleChat(
                    isMe: true,
                    message: 'Hiiii',
                  ),
                  BubbleChat(
                    isMe: false,
                    message: 'Hiiii',
                  ),
                  BubbleChat(
                    isMe: true,
                    message: 'Hiiii',
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 64,
                width: size.width,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Type a message',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w100)),
                      // Icon(Icons.send),
                      IconButton(
                        icon: const Icon(Icons.send),
                        tooltip: 'Increase volume by 10',
                        onPressed: () {
                          // setState(() {
                          //   _volume += 10;
                          // });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BubbleChat extends StatelessWidget {
  final bool isMe;
  final String message;

  BubbleChat({this.isMe, this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          (isMe) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
            height: 100,
            width: 160,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
                color: (isMe) ? Colors.blueAccent : Colors.lightGreen,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                    bottomLeft:
                        (isMe) ? Radius.circular(4) : Radius.circular(0),
                    bottomRight:
                        (isMe) ? Radius.circular(0) : Radius.circular(4))),
            child: Text('test', style: TextStyle(color: Colors.black))),
      ],
    );
  }
}
