import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/components/date_piceker.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int selectedIndex = 0;

  onClick(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 240,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff721c80),
                    Color.fromARGB(255, 196, 103, 169),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 38, left: 18, right: 18),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Spacer(),
                        Text(
                          "Book Your Appointment",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1.1,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                      ],
                    ),
                    const CustomDatePicker(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Available Slots",
                    style: TextStyle(
                        color: Color.fromARGB(255, 45, 42, 42),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                            side: const BorderSide()),
                        label: const Text("10:00 AM"),
                        backgroundColor: Colors.white,
                      ),
                      Chip(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                            side: const BorderSide()),
                        label: const Text(
                          "10:00 AM",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.purple,
                      ),
                      Chip(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                            side: const BorderSide()),
                        label: const Text("10:00 AM"),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                  ChipWrapper(),
                  ChipWrapper(),
                  ChipWrapper(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Select Services",
                    style: TextStyle(
                        color: Color.fromARGB(255, 45, 42, 42),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('services')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      return SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.size ?? 20,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: (() {
                                onClick(index);
                              }),
                              child: AnimatedContainer(
                                duration: const Duration(microseconds: 80),
                                curve: Curves.elasticIn,
                                margin: const EdgeInsets.only(right: 12.0),
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    border: (index == selectedIndex)
                                        ? Border.all(
                                            width: 5,
                                            color: const Color(0xff721c80),
                                          )
                                        : Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(14)),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(14),
                                          topRight: Radius.circular(14)),
                                      child: Image.network(
                                        snapshot.data?.docs[index]["img"] ?? "",
                                        height: 60,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      snapshot.data?.docs[index]["name"] ?? "",
                                      style: const TextStyle(
                                        color: Color(0xff721c80),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "₹${snapshot.data?.docs[index]["price"] ?? ""}",
                                      style: const TextStyle(
                                        color: Color(0xff721c80),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Spacer()
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (() async {
                var snap = FirebaseFirestore.instance.collection('workers');
                List data = [];
                snap.doc('G9ZvAbTR9HvoiMChKrTA').get().then((value) {
                  setState(() {
                    print('snap');
                    print(value["booked"]);
                    data = value["booked"];
                    print(data);
                    data.add('value10');
                  });
                }).then((value) => snap
                    .doc('G9ZvAbTR9HvoiMChKrTA')
                    .update({
                      'booked': data,
                    }) // <-- Updated data
                    .then((_) => print('Success'))
                    .catchError((error) => print('Failed: $error')));
              }),
              child: Container(
                margin: const EdgeInsets.only(left: 18, right: 18),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff721c80),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff721c80),
                      Color.fromARGB(255, 196, 103, 169),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                    child: Text(
                  "Book an appointment",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChipWrapper extends StatelessWidget {
  const ChipWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Chip(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: const BorderSide()),
          label: const Text("10:00 AM"),
          backgroundColor: Colors.white,
        ),
        Chip(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: const BorderSide()),
          label: const Text("10:00 AM"),
          backgroundColor: Colors.white,
        ),
        Chip(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: const BorderSide()),
          label: const Text("10:00 AM"),
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}

// ElevatedButton(
//     onPressed: () async {
//       var snap = FirebaseFirestore.instance.collection('workers');
//       List data = [];
//       snap.doc('G9ZvAbTR9HvoiMChKrTA').get().then((value) {
//         setState(() {
//           print('snap');
//           print(value["booked"]);
//           data = value["booked"];
//           print(data);
//           data.add('value10');
//         });
//       }).then((value) => snap
//           .doc('G9ZvAbTR9HvoiMChKrTA')
//           .update({
//             'booked': data,
//           }) // <-- Updated data
//           .then((_) => print('Success'))
//           .catchError((error) => print('Failed: $error')));
//     },
//     child: Text("Book"))
