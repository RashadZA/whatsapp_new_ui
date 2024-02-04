import 'package:flutter/material.dart';
import 'package:whatsapp_new_ui/features/app/const/consts.dart';
import 'package:whatsapp_new_ui/features/app/home/contacts_page.dart';
import 'package:whatsapp_new_ui/features/app/settings/settings_page.dart';
import 'package:whatsapp_new_ui/features/call/presentation/pages/call_contacts_page.dart';
import 'package:whatsapp_new_ui/features/chat/presentation/pages/single_chat_page.dart';
import 'package:whatsapp_new_ui/features/status/presentation/pages/my_status_page.dart';
import 'package:whatsapp_new_ui/features/user/domain/entities/user_entity.dart';
import 'package:whatsapp_new_ui/features/user/presentation/pages/edit_profile_page.dart';

class OnGenerateRoute {


  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;

    switch (name) {
      case PageConst.contactUsersPage:
        {
          // if(args is String) {
            return materialPageBuilder(ContactsPage());

          // } else {
          //   return materialPageBuilder( const ErrorPage());
          //
          // }
        }
      case PageConst.settingsPage: {
        if(args is String) {
          return materialPageBuilder( SettingsPage(uid: args));
        } else {
          return materialPageBuilder( const ErrorPage());
        }
      }
      case PageConst.editProfilePage: {
        if(args is UserEntity) {
          return materialPageBuilder( EditProfilePage(currentUser: args));
        } else {
          return materialPageBuilder( const ErrorPage());
        }
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
