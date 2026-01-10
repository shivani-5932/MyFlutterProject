import 'package:flutter/material.dart';
import 'widgets/chat_tile.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final List<Map<String, dynamic>> chats = [
    {
      "name": "Gayatri",
      "msg": "Thank you for information",
      "time": "1:22 AM",
      "image": "assets/images/user1.jpg",
    },
    {
      "name": "Sonia Sharma",
      "msg": "Hi there, the price is negotiable",
      "time": "8:22 PM",
      "image": "assets/images/user2.jpg",
    },
    {
      "name": "Karan Khurana",
      "msg": "Have a plan for discuss this ?",
      "time": "8:22 PM",
      "image": "assets/images/user3.jpg",
    },
  ];

  void deleteChat(int index) {
    setState(() {
      chats.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Message",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.redAccent),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ChatTile(
            chat: chats[index],
            onDelete: () => deleteChat(index),
          );
        },
      ),
    );
  }
}
