import 'package:flutter/material.dart';

class DigerIslemler extends StatefulWidget {
  const DigerIslemler({super.key, required this.title});
  final String title;

  @override
  State<DigerIslemler> createState() => _DigerIslemlerState();
}

class _DigerIslemlerState extends State<DigerIslemler> {
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
                  "DİĞER İŞLEMLER",
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
                          "İş Notları",
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
                          "Hatırlatma",
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
                          "Kullanıcı Tanıtım",
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
                          "Sms Şablon",
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
                          "Toplu Sms",
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
                          "Teklif İsteği",
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
