import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'delete_bottom_sheet.dart';
import 'more_bottom_sheet.dart';

class ChatTile extends StatelessWidget {
  final Map<String, dynamic> chat;
  final VoidCallback onDelete;

  const ChatTile({super.key, required this.chat, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(chat["name"]),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              showMoreSheet(context);
            },
            backgroundColor: Colors.grey.shade300,
            foregroundColor: Colors.black,
            icon: Icons.more_horiz,
            label: 'More',
          ),
          SlidableAction(
            onPressed: (_) {
              showDeleteSheet(context, onDelete);
            },
            backgroundColor: const Color(0xFFFF6B6B),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          // open chat screen
          Navigator.pushReplacementNamed(context, '/msg');
        },
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(chat["image"]),
        ),
        title: Text(
          chat["name"],
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          chat["msg"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: Text(
          chat["time"],
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
