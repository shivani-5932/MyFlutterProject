import 'package:flutter/material.dart';

void showDeleteSheet(BuildContext context, VoidCallback onDelete) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.delete, size: 60, color: Colors.redAccent),
            const SizedBox(height: 12),
            const Text(
              "Are you sure you want to delete this message?",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B6B),
                    ),
                    onPressed: () {
                      onDelete();
                      Navigator.pop(context);
                    },
                    child: const Text("Delete"),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
