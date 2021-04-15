import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../datas/data.dart';

class ChatPage extends StatefulWidget {
  static const String id = 'chat-page';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  CollectionReference _messagesCollection =
      FirebaseFirestore.instance.collection('messages');

  TextEditingController message = TextEditingController();
  User loggedInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessages() async {
    final messages = await _messagesCollection.get();
    // users.doc(documentId).get(),
  }

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
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
                      stream: _messagesCollection.snapshots(),
                      builder: (context, snapshot) {
                        List<Text> messagesWidget = [];
                        if (snapshot.hasData) {
                          final messages = snapshot.data.docs;

                          messages.forEach((message) {
                            final messsageText = message['text'];
                            final messsageSender = message['sender'];

                            final messageWidget =
                                Text('$messsageText from @$messsageSender');

                            messagesWidget.add(messageWidget);
                          });
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: messagesWidget,
                        );
                      }),
                  // BubbleChat(
                  //   isMe: true,
                  //   message: 'Hiiii',
                  // ),
                  // BubbleChat(
                  //   isMe: false,
                  //   message: 'Hiiii',
                  // ),
                  // BubbleChat(
                  //   isMe: true,
                  //   message: 'Hiiii',
                  // ),
                  // BubbleChat(
                  //   isMe: false,
                  //   message: 'Hiiii',
                  // ),
                  // BubbleChat(
                  //   isMe: true,
                  //   message: 'Hiiii',
                  // ),
                  // BubbleChat(
                  //   isMe: false,
                  //   message: 'Hiiii',
                  // ),
                  // BubbleChat(
                  //   isMe: true,
                  //   message: 'Hiiii',
                  // ),
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
                      TextFormField(
                        controller: message,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Type a message"),
                      ),
                      Text('Type a message',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w100)),
                      // Icon(Icons.send),
                      IconButton(
                        icon: const Icon(Icons.send),
                        tooltip: 'Increase volume by 10',
                        onPressed: () {
                          _firestore
                              .collection('messages')
                              .add({'text': message, 'sender': loggedInUser});
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
