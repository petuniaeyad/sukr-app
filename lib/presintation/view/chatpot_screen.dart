import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sukar/presintation/controller/chat_controller.dart';

class ChatpotScreen extends GetView<ChatController> {
  const ChatpotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ChatPot')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.chatPotMessages.length,
                  itemBuilder: (_, index) {
                    final message = controller.chatPotMessages[index];
                    final isUser = message['role'] == 'user';
                    return Align(
                      alignment:
                          isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.all(12),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75,
                        ),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.teal[300] : Colors.grey[300],
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(12),
                            topRight: const Radius.circular(12),
                            bottomLeft: Radius.circular(isUser ? 12 : 0),
                            bottomRight: Radius.circular(isUser ? 0 : 12),
                          ),
                        ),
                        child: Text(
                          message['text']!,
                          style: TextStyle(
                            color: isUser ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Obx(
              () =>
                  controller.isLoading.value
                      ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                      : SizedBox.shrink(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.chatPotController,

                      decoration: InputDecoration(
                        hintText: "wirte a chat...",
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
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      controller.chatPotsendMessage();

                      controller.chatPotController.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
