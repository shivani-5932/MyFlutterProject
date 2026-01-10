import 'package:flutter/material.dart';
import 'widgets/chat_app_bar.dart';
import 'widgets/message_bubble.dart';
import 'widgets/property_message_card.dart';
import 'widgets/message_input.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: ChatAppBar(),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            "Today",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),

          /// CHAT MESSAGES
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                PropertyMessageCard(),

                MessageBubble(
                  text: "Hello we are interested in this how about the price ?",
                  isMe: true,
                  time: "1:22 AM",
                ),

                MessageBubble(
                  text: "can it be negotiated ?",
                  isMe: true,
                  time: "1:22 AM",
                ),

                MessageBubble(
                  text: "Hi there, the price is negotiable",
                  isMe: false,
                  time: "1:30 AM",
                ),
              ],
            ),
          ),

          /// INPUT FIELD
          const MessageInput(),
        ],
      ),
    );
  }
}
