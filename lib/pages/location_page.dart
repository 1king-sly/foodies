import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/pattern2.jpg'),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.grey.shade100,
                // Colors.white,
                Colors.white,
              ],
            ),
          ),
        ),
        SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Container(
                        // alignment: const Alignment(0, 0),
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(17, 218, 98, 23),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_left_sharp,
                              color: Color(0xFFDA6317),
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 10),
                    const SizedBox(
                      width: 264,
                      height: 129,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Set Your Location',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // SizedBox(height: 10),
                            Text(
                              'This data will be displayed in your account profile for security',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            )
                          ]),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(22),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 15.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: const Offset(
                              5.0, // Move to right 5  horizontally
                              5.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(children: [
                              Container(
                                width: 33,
                                height: 33,
                                // shape:BoxShape.circle,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF8D52B),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.location_pin,
                                    color: Color(0xFFE86D28)),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Your Location",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ]),
                            Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                              child: Center(
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Set Location",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    )),
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: const Alignment(0, 0.9),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF53E88B),
                        Color(0xFF15BE77),
                      ],
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //       builder: (context) => const UploadPhoto()),
                      // );
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
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
