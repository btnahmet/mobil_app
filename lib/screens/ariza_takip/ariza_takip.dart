import 'package:flutter/material.dart';
import 'package:mobil_app/screens/ariza_takip/kayit_ekleme.dart';

class ArizaTakip extends StatefulWidget {
  const ArizaTakip({super.key, required this.title});
  final String title;


  @override
  State<ArizaTakip> createState() => _ArizaTakipState();
}

class _ArizaTakipState extends State<ArizaTakip> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
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
                  "ARIZA TAKİP",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          //padding: EdgeInsets.symmetric(horizontal: deviceWidth/30),
          padding: EdgeInsets.fromLTRB(
              deviceWidth / 18, deviceHeight / 18, deviceWidth / 10, 0),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KayitEkleme4(title: ""),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Image.asset(
                      "lib/assets/images/plus_icon.png",
                      height: deviceHeight * 0.03,
                    ),
                    SizedBox(width: deviceWidth * 0.03),
                    const Text(
                      "Kayıt Ekle",
                      style: TextStyle(fontSize: 20, color: Colors.black),
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
