import 'package:flutter/material.dart';
import 'package:sokyo/app_ui.dart';
import 'package:sokyo/models/user.dart';

import '../../widgets/drawer.dart';

class BuddyView extends StatefulWidget {
  const BuddyView({Key? key}) : super(key: key);

  @override
  State<BuddyView> createState() => _BuddyViewState();
}

class _BuddyViewState extends State<BuddyView> {
  late final TextEditingController _search;
  @override
  void initState() {
    _search = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User user = User.dummy;
    double width = MediaQuery.of(context).size.width * 0.2;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sokyo'),
      ),
      drawer: sokyoDrawer(user, context),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Buddy',
                style: SokyoTextStyle.headline3,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextField(
                controller: _search,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Search People",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                          // backgroundImage: AssetImage('assets/images/meditation.jpg'),
                          ),
                      title: const Text('Jane Austin'),
                      subtitle: const Text('CS 101'),
                      trailing: SizedBox(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Chat'),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                          // backgroundImage: AssetImage('assets/images/meditation.jpg'),
                          ),
                      title: const Text('Phil Collins'),
                      subtitle: const Text('MA 100'),
                      trailing: SizedBox(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Chat'),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                          // backgroundImage: AssetImage('assets/images/meditation.jpg'),
                          ),
                      title: const Text('Park Jimin'),
                      subtitle: const Text('AS 200'),
                      trailing: SizedBox(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Chat'),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                          // backgroundImage: AssetImage('assets/images/meditation.jpg'),
                          ),
                      title: const Text('John Adams'),
                      subtitle: const Text('PH 142'),
                      trailing: SizedBox(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Chat'),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                          // backgroundImage: AssetImage('assets/images/meditation.jpg'),
                          ),
                      title: const Text('Gil Strang'),
                      subtitle: const Text('MA 202'),
                      trailing: SizedBox(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Chat'),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                          // backgroundImage: AssetImage('assets/images/meditation.jpg'),
                          ),
                      title: const Text('Amanda Chuey'),
                      subtitle: const Text('LG 402'),
                      trailing: SizedBox(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Chat'),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                          // backgroundImage: AssetImage('assets/images/meditation.jpg'),
                          ),
                      title: const Text('Arjun Singh'),
                      subtitle: const Text('CS 211'),
                      trailing: SizedBox(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Chat'),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                          // backgroundImage: AssetImage('assets/images/meditation.jpg'),
                          ),
                      title: const Text('Park Hyojin'),
                      subtitle: const Text('KR 221'),
                      trailing: SizedBox(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Chat'),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                          // backgroundImage: AssetImage('assets/images/meditation.jpg'),
                          ),
                      title: const Text('Kim Taehyung'),
                      subtitle: const Text('KR 221'),
                      trailing: SizedBox(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Chat'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
