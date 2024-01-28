import 'package:flutter/material.dart';
import 'package:whatsapp_new_ui/features/app/const/consts.dart';
import 'package:whatsapp_new_ui/features/app/home/contacts_page.dart';
import 'package:whatsapp_new_ui/features/app/theme/style.dart';
import 'package:whatsapp_new_ui/features/call/presentation/pages/calls_history_page.dart';
import 'package:whatsapp_new_ui/features/chat/presentation/pages/chat_page.dart';
import 'package:whatsapp_new_ui/features/status/presentation/pages/status_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        _currentTabIndex = _tabController!.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WhatsApp",
          style: TextStyle(
              fontSize: 20, color: greyColor, fontWeight: FontWeight.w600),
        ),
        actions: [
          Row(
            children: [
              const Icon(
                Icons.camera_alt_outlined,
                color: greyColor,
                size: 28,
              ),
              const SizedBox(
                width: 25,
              ),
              const Icon(Icons.search, color: greyColor, size: 28),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PageConst.settingsPage);
                },
                child: const Icon(Icons.settings, color: greyColor, size: 28),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          labelColor: tabColor,
          unselectedLabelColor: greyColor,
          indicatorColor: tabColor,
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text(
                "Chats",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Tab(
              child: Text(
                "Status",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Tab(
              child: Text(
                "Calls",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          switchFloatingActionButtonOnTabIndex(_currentTabIndex),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatPage(),
          StatusPage(),
          CallsHistoryPage(),
        ],
      ),
    );
  }

  switchFloatingActionButtonOnTabIndex(int index) {
    switch (index) {
      case 0:
        {
          return FloatingActionButton(
            backgroundColor: tabColor,
            onPressed: () {
              Navigator.pushNamed(context, PageConst.contactUsersPage);
            },
            child: const Icon(
              Icons.message,
              color: Colors.white,
            ),
          );
        }
      case 1:
        {
          return FloatingActionButton(
            backgroundColor: tabColor,
            onPressed: () {},
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          );
        }
      case 2:
        {
          return FloatingActionButton(
            backgroundColor: tabColor,
            onPressed: () {
              Navigator.pushNamed(context, PageConst.callContactsPage);
            },
            child: const Icon(
              Icons.add_call,
              color: Colors.white,
            ),
          );
        }
      default:
        {
          return FloatingActionButton(
            backgroundColor: tabColor,
            onPressed: () {},
            child: const Icon(
              Icons.message,
              color: Colors.white,
            ),
          );
        }
    }
  }
}
