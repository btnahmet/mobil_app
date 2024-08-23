import 'package:flutter/material.dart';

class Raporlar extends StatefulWidget {
  const Raporlar({super.key, required this.title});
  final String title;

  @override
  State<Raporlar> createState() => _RaporlarState();
}

class _RaporlarState extends State<Raporlar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 233, 228),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 219, 219, 195),
          title: Container(
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "RAPORLAR",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 224, 224, 203),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Cari Liste",
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 224, 224, 203),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Cari Aktarma",
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 224, 224, 203),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Cari Destek",
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 224, 224, 203),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Arıza Takip",
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 224, 224, 203),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Yıllık Hizmet",
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 224, 224, 203),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Kara Liste",
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
