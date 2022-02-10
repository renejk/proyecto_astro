import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_astro/datos.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = 'Favorites';
    List<String> categories = ['All', 'Happy Hours', 'Drinks', 'Beer'];

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/bartender.png',
                    fit: BoxFit.fill,
                    scale: 3,
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: const ClipOval(
                        child: Material(
                            elevation: 30,
                            color: Colors.white,
                            child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.notifications_none_outlined,
                                  size: 20,
                                )))),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: const ClipOval(
                        child: Material(
                            elevation: 30,
                            child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.settings_outlined,
                                  size: 20,
                                )))),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 35,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: const ClipOval(
                        child: Material(
                            elevation: 30,
                            child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                )))),
                  ),
                ],
              ),
            ),
            Expanded(child: FunctionWidget(categories: categories))
          ],
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: 3,
        unselectedItemColor: Colors.grey,
        selectedColorOpacity: 0,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_outlined),
            title: const Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.calendar_today_outlined),
            title: const Text("Calendar"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search_outlined),
            title: const Text("Search"),
          ),
          SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_outline),
              title: const Text("Favorites"),
              selectedColor: Colors.black),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class FunctionWidget extends StatefulWidget {
  FunctionWidget({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<String> categories;
  String catSelected = "All";
  @override
  State<FunctionWidget> createState() => _functionState();
}

class _functionState extends State<FunctionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Row(
              children: widget.categories
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.catSelected = e;
                          });
                        },
                        child: Badge(
                          padding: const EdgeInsets.all(8),
                          shape: BadgeShape.square,
                          badgeColor: e == widget.catSelected
                              ? Colors.orange
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          badgeContent: Text(
                            e,
                            style: TextStyle(
                              fontSize: 17,
                              color: e == widget.catSelected
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: Row(
            children: [
              Text(
                widget.catSelected,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: const ClipOval(
                  child: Material(
                    elevation: 30,
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.delete_outline,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView(
          shrinkWrap: true,
          children: producto
              .where((element) =>
                  element['categoria'] == widget.catSelected ||
                  widget.catSelected == "All")
              .map((e) => Card(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(20),
                          child: Badge(
                            badgeColor: Colors.white,
                            position: BadgePosition.bottomStart(start: 58),
                            badgeContent: const Icon(
                              Icons.favorite,
                              color: Colors.orange,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                e['image'],
                                width: 140,
                                height: 90,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e['nombre'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}
