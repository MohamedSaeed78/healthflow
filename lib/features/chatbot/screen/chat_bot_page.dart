import 'package:flutter/material.dart';
import 'package:healthflow/data/models/profile_model.dart';
import 'package:healthflow/utils/constants.dart';

import '../../../data/sample_data.dart';
import '../services/gemini_service.dart';
import '../services/messege_model.dart';

class ChatBotPage extends StatefulWidget {
  final ProfileModel profileModel;

  const ChatBotPage({super.key, required this.profileModel});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';
  final String sysContext =
      "You are a smart fitness and nutrition assistant inside the HealthFlow app."
      "You help users build personalized workout and meal plans based on their fitness goals, preferences, and current fitness level. You have access to a knowledge base of exercises, meals, workout plans, and meal plans. Use this knowledge to give tailored advice."
      "Always explain your recommendations briefly and support them with specific data (like calories, equipment, or difficulty level).";
  final List<Message> _messages = [];
  late List<Map<String, dynamic>> _combinedData;
  bool _isLoading = false;

  callGeminiModel() async {
    try {
      if (_controller.text.isNotEmpty) {
        _messages.add(Message(text: _controller.text, isUser: true));
        _isLoading = true;
      }
      final result = await GeminiService.sendQuery(
        data: _combinedData,
        userQuery: _controller.text,
        systemContext: sysContext,
        responseFormat: '',
      );
      setState(() {
        _response = result ?? 'No response.';
        _messages.add(Message(text: _response, isUser: false));
        _isLoading = false;
      });
      _controller.clear();
    } catch (e) {
      print("Error : $e");
    }
  }

  @override
  void initState() {
    final userProfileData = {
      "name": widget.profileModel.name,
      "age": widget.profileModel.age,
      "weight": widget.profileModel.weight,
      "height": widget.profileModel.height,
      "bmi": widget.profileModel.bmi,
      "goal": widget.profileModel.goal,
    };

    _combinedData = [
      ...appData,
      {"user_profile": userProfileData}
    ];
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/img/gpt-robot.png'),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Health Flow Assistant',
                  style: headingTextStyle,
                )
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ListTile(
                    title: Align(
                      alignment: message.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: message.isUser
                                  ? ConstColor.secondaryColor
                                  : ConstColor.primaryColor,
                              borderRadius: message.isUser
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))
                                  : const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                          child: Text(message.text,
                              style: message.isUser
                                  ? Theme.of(context).textTheme.bodyMedium
                                  : TextStyle(color:ConstColor.white,)),
                    ),
                  ));
                }),
          ),

          // user input
          Padding(
            padding: const EdgeInsets.only(
                bottom: 32, top: 16.0, left: 16.0, right: 16),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3))
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: Theme.of(context).textTheme.titleSmall,
                      decoration: InputDecoration(
                          hintText: 'Write your message',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20)),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  _isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(8),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: callGeminiModel,
                            child: Image.asset('assets/img/send.png'),
                          ),
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
