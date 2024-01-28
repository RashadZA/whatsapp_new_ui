import 'package:flutter/material.dart';
import 'package:whatsapp_new_ui/features/app/const/consts.dart';
import 'package:whatsapp_new_ui/features/app/home/contacts_page.dart';
import 'package:whatsapp_new_ui/features/app/settings/settings_page.dart';
import 'package:whatsapp_new_ui/features/call/presentation/pages/call_contacts_page.dart';
import 'package:whatsapp_new_ui/features/chat/presentation/pages/single_chat_page.dart';
import 'package:whatsapp_new_ui/features/status/presentation/pages/my_status_page.dart';

class OnGenerateRoute {


  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;

    switch (name) {
      case PageConst.contactUsersPage:
        {
            return materialPageBuilder(const ContactsPage());

        }
      case PageConst.settingsPage: {
          return materialPageBuilder( const SettingsPage());

      }
      case PageConst.callContactsPage: {
        return materialPageBuilder(const CallContactsPage());

      }
      case PageConst.myStatusPage: {
          return materialPageBuilder( const MyStatusPage());

      }
      case PageConst.singleChatPage: {
          return materialPageBuilder( SingleChatPage());

      }
    }


   }

  }

dynamic materialPageBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: const Center(
        child: Text("Error"),
      ),
    );
  }
}
