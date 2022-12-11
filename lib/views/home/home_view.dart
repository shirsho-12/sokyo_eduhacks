import 'package:flutter/material.dart';
import 'package:sokyo/app_ui.dart';
import 'package:sokyo/models/user.dart';
import 'package:sokyo/widgets/discover_card.dart';
import 'package:sokyo/widgets/drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
    double width = MediaQuery.of(context).size.width * 0.45;
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
                'Home',
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
                  hintText: "Search Courses",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Linear Algebra',
                          tag: 'lin_alg',
                          subtitle: 'MATH 101',
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Calculus',
                          tag: 'calc',
                          subtitle: 'MATH 104',
                          gradientStartColor: Color(0xffFC67A7),
                          gradientEndColor: Color(0xffF6815B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Intro to Physics',
                          tag: 'physics',
                          subtitle: 'PHYS 100',
                          gradientStartColor: Color(0xffF6815B),
                          gradientEndColor: Color(0xffF5B247),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Organic Chemistry',
                          tag: 'chem',
                          subtitle: 'CHEM 142',
                          gradientStartColor: Color(0xffFFD541),
                          gradientEndColor: Color(0xffF0B31A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Ecology',
                          tag: 'bio',
                          subtitle: 'BIO 251',
                          gradientStartColor: Color(0xffF0B31A),
                          gradientEndColor: Color(0xffA8D62B),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Intro to Computer Science',
                          tag: 'cs',
                          subtitle: 'CS 101',
                          gradientStartColor: Color(0xffA8D62B),
                          gradientEndColor: Color(0xff4CC3D9),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Intro to Psychology',
                          tag: 'psych',
                          subtitle: 'PSY 108',
                          gradientStartColor: Color(0xff4CC3D9),
                          gradientEndColor: Color(0xff4CB8C4),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Intro to Sociology',
                          tag: 'soc',
                          subtitle: 'SOC 161',
                          gradientStartColor: Color(0xff4CB8C4),
                          gradientEndColor: Color(0xff7B64FF),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Intro to Philosophy',
                          tag: 'phil',
                          subtitle: 'PHIL 101',
                          gradientStartColor: Color(0xff7B64FF),
                          gradientEndColor: Color(0xffFC67A7),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Macro- economics',
                          tag: 'econ',
                          subtitle: 'ECON 240',
                          gradientStartColor: Color(0xffFC67A7),
                          gradientEndColor: Color(0xffF6815B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Micro- economics',
                          tag: 'econ',
                          subtitle: 'ECON 241',
                          gradientStartColor: Color(0xffF6815B),
                          gradientEndColor: Color(0xffF5B247),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Intro to Biology',
                          tag: 'bio',
                          subtitle: 'BIO 101',
                          gradientStartColor: Color(0xffF5B247),
                          gradientEndColor: Color(0xffA8D62B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Intro to Astronomy',
                          tag: 'astro',
                          subtitle: 'ASTR 101',
                          gradientStartColor: Color(0xffA8D62B),
                          gradientEndColor: Color(0xff4CC3D9),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Intro to Anthropology',
                          tag: 'anthro',
                          subtitle: 'ANTH 101',
                          gradientStartColor: Color(0xff4CC3D9),
                          gradientEndColor: Color(0xff4CB8C4),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Intro to History',
                          tag: 'hist',
                          subtitle: 'HIST 101',
                          gradientStartColor: Color(0xff4CB8C4),
                          gradientEndColor: Color(0xff7B64FF),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Intro to Literature',
                          tag: 'lit',
                          subtitle: 'LIT 101',
                          gradientStartColor: Color(0xff7B64FF),
                          gradientEndColor: Color(0xffFC67A7),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Intro to Music',
                          tag: 'music',
                          subtitle: 'MUS 101',
                          gradientStartColor: Color(0xffFC67A7),
                          gradientEndColor: Color(0xffF6815B),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Intro to Art',
                          tag: 'art',
                          subtitle: 'ART 101',
                          gradientStartColor: Color(0xffF6815B),
                          gradientEndColor: Color(0xffF5B247),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Intro to Film',
                          tag: 'film',
                          subtitle: 'FILM 101',
                          gradientStartColor: Color(0xffF5B247),
                          gradientEndColor: Color(0xffA8D62B),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: width,
                        height: width,
                        child: const DiscoverCard(
                          title: 'Operating Systems',
                          tag: 'cs',
                          subtitle: 'CS 216',
                          gradientStartColor: Color(0xffA8D62B),
                          gradientEndColor: Color(0xff4CC3D9),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
