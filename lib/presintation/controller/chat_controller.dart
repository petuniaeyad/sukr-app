import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:sukar/model/chat_model.dart';
import 'package:sukar/model/child_profile_model.dart';
import 'package:sukar/utils/app_general.dart';

class ChatController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final RxString messageText = ''.obs;

  String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  String chatWithUserId = '${AppGeneral.childProfileModel?.parentId}';
  String parentName = '';

  final TextEditingController textController = TextEditingController();

  final String apiKey =
      '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';

  final TextEditingController chatPotController = TextEditingController();
  final RxList<Map<String, String>> chatPotMessages =
      <Map<String, String>>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getchild();
    await getparentName();
    _listenToMessages();
  }

  void _listenToMessages() {
    firestore
        .collection('chats')
        .doc(
          '$currentUserId'
          '_'
          '$chatWithUserId',
        )
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
          messages.value =
              snapshot.docs
                  .map((doc) => ChatMessage.fromMap(doc.data(), doc.id))
                  .toList();
        });
  }

  Future<void> getchild() async {
    await firestore
        .collection('caregivers')
        .doc(currentUserId)
        .collection('children')
        .get()
        .then((querySnapshot) {
          for (var doc in querySnapshot.docs) {
            final data = doc.data();
            AppGeneral.childProfileModel = ChildProfileModel.fromJson(data);

            log(AppGeneral.childProfileModel!.parentId.toString());
          }
        })
        .catchError((e) {
          debugPrint('خطأ في جلب الأطفال: $e');
        });
  }

  Future<String> getparentName() async {
    AppGeneral.snapshot =
        await firestore.collection('users').doc(chatWithUserId).get();

    parentName =
        '${AppGeneral.snapshot!['firstName']} ${AppGeneral.snapshot!['lastName']}';
    log(parentName);
    return parentName;
  }

  void sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final message = ChatMessage(
      id: '',
      senderId: currentUserId,
      receiverId: chatWithUserId,
      message: text,
      timestamp: DateTime.now(),
    );

    await firestore
        .collection('chats')
        .doc(chatId())
        .collection('messages')
        .add(message.toMap());

    messageText.value = '';
    await FirebaseFirestore.instance.collection('chats').doc(chatId()).set({
      'users': chatId(),
      'lastMessage': text,
      'lastTimestamp': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  String chatId() {
    return currentUserId.hashCode <= chatWithUserId.hashCode
        ? '${currentUserId}_$chatWithUserId'
        : '${chatWithUserId}_$currentUserId';
  }

  Future<String> sendChatPotMessageApi(String message) async {
    const String apiUrl = 'https://api.openai.com/v1/chat/completions';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        "model": "gpt-4.1-2025-04-14",
        "messages": [
          {
            "role": "system",
            "content":
                "أنت مساعد صحي للأطفال المصابين بالسكري، أجب بطريقة ودودة ومبسطة.",
          },
          {"role": "user", "content": message},
        ],
        "temperature": 0.7,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final reply = data['choices'][0]['message']['content'];
      return reply.trim();
    } else {
      return "حدث خطأ أثناء الاتصال بالخدمة.";
    }
  }

  void chatPotsendMessage() async {
    if (chatPotController.text.isEmpty) return;

    chatPotMessages.add({"role": "user", "text": chatPotController.text});
    chatPotController.clear();

    final reply = await sendChatPotMessageApi(chatPotController.text);

    chatPotMessages.add({"role": "bot", "text": reply});
  }
}
