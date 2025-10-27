import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graduation_project/services/tcp/poke.dart';
import 'package:graduation_project/services/tcp/poke_listener.dart';
import 'package:graduation_project/services/udp/udp_discovery.dart';
import 'package:graduation_project/widgets/custom_list_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.name});
  final String name;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late StreamSubscription<Map<String, String>> subscription;
  Map<String, String> users = {};
  Timer? timer;
  UdpDescovery udp = UdpDescovery();
  @override
  void initState() {
    super.initState();
    subscription = udp.listenForUsers().listen((message) {
      users.addAll(message);
      setState(() {});
    });
    timer = Timer.periodic(const Duration(seconds: 5), (_) async {
      await udp.sendingMessage(widget.name);
    });
    startPokeListener(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: users.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      name: users.entries.elementAt(index).key,
                      localIpAddress: users.entries.elementAt(index).value,
                      onPressed: () {
                        sendPoke(
                            targetIp: users.entries.elementAt(index).value,
                            message: 'Hello from ${widget.name}');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
