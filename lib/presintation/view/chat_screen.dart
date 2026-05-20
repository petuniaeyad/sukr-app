import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/model/chat_model.dart';
import 'package:sukar/presintation/controller/chat_controller.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(controller.parentName),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              final messages = controller.messages;

              if (messages.isEmpty) {
                return const Center(child: Text("لا توجد رسائل بعد."));
              }

              return ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(10),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  ChatMessage msg = controller.messages[index];
                  bool isMe = msg.senderId == controller.currentUserId;

                  return Align(
                    alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(12),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.75,
                      ),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.teal[300] : Colors.grey[300],
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(12),
                          topRight: const Radius.circular(12),
                          bottomLeft: Radius.circular(isMe ? 12 : 0),
                          bottomRight: Radius.circular(isMe ? 0 : 12),
                        ),
                      ),
                      child: Text(
                        msg.message,
                        style: TextStyle(
                          color: isMe ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.textController,
                    onChanged: (val) => controller.messageText.value = val,
                    decoration: InputDecoration(
                      hintText: "اكتب رسالة...",
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.teal),
                  onPressed: () {
                    controller.sendMessage(controller.textController.text);
                    controller.textController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
