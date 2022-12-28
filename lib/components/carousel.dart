import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          height: 40,
          width: 400,
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: const Color(0xff721c80),
            gradient: const LinearGradient(
              colors: [
                Color(0xff721c80),
                Color.fromARGB(255, 196, 103, 169),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    "Look Awesome",
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "& Save Some",
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Btn(text: "Get upto 20% off"),
                ],
              ),
              const Spacer(),
              Align(
                child: Image.network(
                  "https://images.squarespace-cdn.com/content/v1/5e867df9747b0e555c337eef/1589945925617-4NY8TG8F76FH1O0P46FW/Kampaamo-helsinki-hair-design-balayage-hiustenpidennys-varjays.png",
                  width: 120,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),

        Container(
          height: 40,
          width: 400,
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: const Color(0xff721c80),
            gradient: const LinearGradient(
              colors: [
                Color(0xff721c80),
                Color.fromARGB(255, 196, 103, 169),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    "Book your\nAppointment",
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Now",
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Btn(text: "Book Here!"),
                ],
              ),
              const Spacer(),
              Align(
                child: Image.network(
                  "https://img.grouponcdn.com/bynder/2sLSquS1xGWk4QjzYuL7h461CDsJ/2s-2048x1229/v1/sc600x600.jpg",
                  width: 120,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),

      ],
      options: CarouselOptions(
        //autoPlayInterval: Duration(minutes: 1),
        disableCenter: true,
        reverse: false,
        enableInfiniteScroll: false,
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 10 / 8,
        autoPlayCurve: Curves.easeInOut,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.78,
      ),
    );
  }
}

class Btn extends StatelessWidget {
  final String text;
  const Btn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(12),
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
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
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      )),
    );
  }
}
