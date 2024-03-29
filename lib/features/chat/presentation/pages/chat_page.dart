import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_new_ui/features/app/const/consts.dart';
import 'package:whatsapp_new_ui/features/app/global/widgets/profile_widget.dart';
import 'package:whatsapp_new_ui/features/app/theme/style.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(itemCount: 20, itemBuilder: (context, index) {

        return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, PageConst.singleChatPage);
          },
          child: ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: profileWidget(),
              ),
            ),
            title: const Text("User Name"),
            subtitle: const Text("last message hi", maxLines: 1, overflow: TextOverflow.ellipsis,),
            trailing: Text(
              DateFormat.jm().format(DateTime.now()),
              style: const TextStyle(color: greyColor, fontSize: 13),
            ),
          ),
        );
      }),
    );
  }
}