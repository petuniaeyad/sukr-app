import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/helper/theme/app_colors.dart';
import 'package:sukar/presintation/controller/chat_controller.dart';
import 'package:sukar/utils/routes/routes_string.dart';

class ChatListScreen extends GetView<ChatController> {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.primaryBlueColor,
        ),
        child: IconButton(
          onPressed: () {
            Get.toNamed(RoutesString.chatScreen);
          },
          icon: Icon(Icons.add, size: 30),
        ),
      ),
      appBar: AppBar(
        title: const Text('Messeges'),
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance
                .collection('chats')
                .where(
                  'users',
                  isEqualTo:
                      '${controller.currentUserId}_${controller.chatWithUserId}',
                )
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          }
          final chats = snapshot.data!.docs;
          for (var element in chats) {
            log(element.data().toString());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('لا توجد محادثات بعد'));
          }

          return ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats;

              final String lastMessage = chat[index]['lastMessage'] ?? '';
              final Timestamp time = chat[index]['lastTimestamp'];

              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(controller.parentName),
                subtitle: Text(lastMessage),
                trailing: Text(
                  time.toDate().toLocal().toString().substring(11, 16),
                  style: const TextStyle(fontSize: 12),
                ),
                onTap: () {
                  Get.toNamed(RoutesString.chatScreen);
                },
              );
            },
          );
        },
      ),
    );
  }
}
