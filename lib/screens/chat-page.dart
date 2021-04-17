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
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF31CD9D),
        title: Text(
          'Groups',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Nunito',
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              color: Colors.white,
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: size.height - 64,
            width: size.width,
            child: SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                  stream: _messagesCollection.snapshots(),
                  builder: (context, snapshot) {
                    List<Widget> messagesWidget = [];
                    if (snapshot.hasData) {
                      final messages = snapshot.data.docs;

                      messages.forEach((message) {
                        final messsageText = message['text'];
                        final messsageSender = message['sender'];

                        // final messageWidget =
                        //     Text('$messsageText from @$messsageSender');

                        final messageWidget =
                            BubbleChat(isMe: true, message: messsageText);

                        messagesWidget.add(messageWidget);
                      });
                    }
                    return Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: messagesWidget,
                    );
                  }),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 64,
              width: size.width,
              color: Color(0xFF31CD9D),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
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
                            hintStyle: TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            hintText: "Type a message"),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      color: Colors.white,
                      tooltip: 'Increase volume by 10',
                      onPressed: () {
                        // print({
                        //   'text': message.text,
                        //   'sender': loggedInUser.email
                        // });
                        _firestore
                            .collection('messages')
                            .add({
                              'text': message.text,
                              'sender': loggedInUser.email
                            })
                            .then((value) => print("Message Added"))
                            .catchError(
                                (error) => print("Failed to add : $error"));
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
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
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
              color: (isMe) ? Color(0xFF31CD9D) : Color(0xFF00BAAF),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: (isMe) ? Radius.circular(12) : Radius.circular(0),
                  bottomRight:
                      (isMe) ? Radius.circular(0) : Radius.circular(4))),
          child: Text(
            message,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Nunito',
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
