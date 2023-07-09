import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat.dart';
import 'donate_with_friends.dart';
import 'emergency.dart';
import 'guidelines.dart';
import 'home.dart';
import 'order_tracking.dart';

class mainhome extends StatefulWidget {
  const mainhome({super.key});

  @override
  State<mainhome> createState() => _mainhomeState();
}

final CarouselController _controller = CarouselController();

class _mainhomeState extends State<mainhome> {
  FirebaseFirestore _store = FirebaseFirestore.instance;

  int currentIndex = 0;
  static var imageSliders = generateImageTiles(screenSize);

  static get screenSize => null;

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List SearchResult = [];

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('Search')
        .where('Hospital Name', arrayContains: query)
        .get();

    setState(() {
      SearchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    int currentIndex = 0;

    return SingleChildScrollView(
      child: Column(children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Column(children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     IconButton(
              //       onPressed: () {
              //         // Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
              //       },
              //       icon: Icon(Icons.menu,
              //           color: hexStringToColor('DF1B1B'), size: 40),
              //     ),
              //     IconButton(
              //       onPressed: () {
              //         // setState(() {});
              //       },
              //       icon: Icon(Icons.notifications_active,
              //           color: hexStringToColor('DF1B1B'), size: 40),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/image/profile.jpg'),
                    radius: 55,
                  ),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                      text: 'Welcome,',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'inriaSans',
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: '\nSamrath',
                            style: TextStyle(
                                fontSize: 40,
                                color: Color.fromRGBO(222, 22, 22, 1),
                                fontFamily: 'inriaSans',
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                style: const TextStyle(color: Color.fromARGB(255, 219, 7, 7)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 187, 186, 186),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search by Hospital or Blood Group",
                  hintStyle: GoogleFonts.inriaSans(
                    color: Colors.white,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.white,
                ),
                onChanged: (query) {
                  // var sn = await _store
                  //     .collection('Search')
                  //     .where('Hospital', isEqualTo: query)
                  //     .get();

                  // String id = sn.docs.first.id;
                  // print("ID is ------------------------------------------- $id");
                  searchFromFirebase(query);
                  print('Data has been Added');
                },
              ),
              Expanded(
                  flex: currentIndex,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: SearchResult.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(SearchResult[index]['Hospital Name']),
                          subtitle: Text(SearchResult[index]['Location']),
                        );
                      })),
              const SizedBox(
                height: 25,
              ),
              Row(children: [
                Text(
                  'Campaigns & Events',
                  style: GoogleFonts.inriaSans(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 219, 7, 7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 180,
                ),
                Expanded(
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color.fromARGB(255, 219, 7, 7),
                    ),
                    //Campaigns & Events Page
                    onPressed: () {},
                  ),
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 10 / 6,
                      onPageChanged: (index, reason) {
                        // setState(() {});
                      }),
                  carouselController: _controller,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Text(
                    'Suggestion For Our Life Saver',
                    style: GoogleFonts.inriaSans(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 219, 7, 7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Expanded(
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color.fromARGB(255, 219, 7, 7),
                      ),
                      //Life Saver Page
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ]),
                Row(children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Donate_with_Friends()));
                    },
                    icon: const Icon(
                      Icons.group,
                    ),
                    label: const Text('Donate \nwith your Friends',
                        style: TextStyle(fontFamily: 'inriaSans')),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(10.0),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return const Color.fromARGB(255, 219, 7, 7);
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 75,
                  ),
                  Row(children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => order_tracking()));
                      },
                      icon: const Icon(
                        Icons.delivery_dining,
                      ),
                      label: const Text('24/7 \nDelivery \nAvailable',
                          style: TextStyle(fontFamily: 'inriaSans')),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(10.0),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return const Color.fromARGB(255, 219, 7, 7);
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ]),
                ]),
                const SizedBox(
                  height: 15,
                ),
              ]),
              Row(children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Emergency()));
                  },
                  icon: const Icon(
                    Icons.tungsten_outlined,
                  ),
                  label: const Text('Emergency \nRequests',
                      style: TextStyle(fontFamily: 'inriaSans')),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(10.0),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return const Color.fromARGB(255, 219, 7, 7);
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Row(children: [
                  ElevatedButton.icon(
                    onPressed: () {
                       Navigator.push(context,
                        MaterialPageRoute(builder: (context) => guidelines()));
                    },
                    icon: const Icon(
                      Icons.boy_outlined,
                    ),
                    label: const Text(
                        'Tests \nBe sure enough to \nfit to donate blood',
                        style: TextStyle(fontFamily: 'inriaSans')),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(10.0),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return const Color.fromARGB(255, 219, 7, 7);
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ]),
              ]),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FloatingActionButton.large(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Chat()));
                        },
                        backgroundColor: const Color.fromARGB(255, 219, 7, 7),
                        child: const Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                        heroTag: FloatingActionButtonLocation.startFloat,
                      ),
                    ],
                  ),
                ],
              ),

              // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
            ]))
      ]),
    );
  }
}
