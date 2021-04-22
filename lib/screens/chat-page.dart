import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groups/components/dialog.dart';
import 'package:groups/screens/login-page.dart';
import 'package:groups/services/authentication_service.dart';

import 'package:provider/provider.dart';
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

  void getCurrentUser() {
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

  doLogout() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    Navigator.popUntil(context, ModalRoute.withName(LoginPage.id));
    context.read<AuthenticationService>().signOut();
  }

  doCancelLogout() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF31CD9D),
        leading: Container(),
        title: Center(
          child: Text(
            'Groups',
            style: TextStyle(
              fontFamily: 'Nunito',
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              color: Colors.white,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => DialogCustom(
                          yes: doLogout,
                          no: doCancelLogout,
                        ));
              }),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.only(bottom: 64),
            child: StreamBuilder<QuerySnapshot>(
                stream: _messagesCollection
                    .orderBy("created_at", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  List<Widget> messagesWidget = [];
                  if (snapshot.hasData) {
                    final messages = snapshot.data.docs;

                    messages.forEach((message) {
                      final messageText = message['text'];
                      final messageSender = message['sender'];

                      final currentUser = loggedInUser.email;

                      final messageWidget = BubbleChat(
                        isMe: currentUser == messageSender,
                        sender: messageSender,
                        message: messageText,
                      );

                      messagesWidget.add(messageWidget);
                    });
                  }
                  return ListView(
                    reverse: true,
                    children: messagesWidget,
                  );
                }),
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
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontSize: 16,
                        ),
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
                      focusColor: Colors.black12,
                      onPressed: () {
                        // print({
                        //   'text': message.text,
                        //   'sender': loggedInUser.email
                        // });
                        _firestore
                            .collection('messages')
                            .add({
                              'text': message.text,
                              'sender': loggedInUser.email,
                              'created_at': FieldValue.serverTimestamp()
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
  final String sender;
  final String message;

  BubbleChat({this.isMe, this.sender, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          (isMe) ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              (isMe) ? EdgeInsets.only(right: 10) : EdgeInsets.only(left: 10),
          child: Text(
            sender,
            style: TextStyle(
              fontFamily: 'Nunito',
              color: Color(0xFF2F4858),
              fontSize: 12,
            ),
          ),
        ),
        Container(
          margin: (isMe)
              ? EdgeInsets.only(left: 64, right: 10, top: 6, bottom: 6)
              : EdgeInsets.only(left: 10, right: 64, top: 6, bottom: 6),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
              color: (isMe) ? Color(0xFF31CD9D) : Color(0xFF00BAAF),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: (isMe) ? Radius.circular(12) : Radius.circular(0),
                  bottomRight:
                      (isMe) ? Radius.circular(0) : Radius.circular(12))),
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
