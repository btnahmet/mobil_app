import 'package:flutter/material.dart';
import 'package:mobil_app/screens/cari_tanitim/kayit_ekleme.dart';

class CariTanitim extends StatefulWidget {
  final String title;

  const CariTanitim({super.key, required this.title});

  @override
  State<CariTanitim> createState() => _CariTanitimState();
}

class _CariTanitimState extends State<CariTanitim> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 233, 228),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 219, 219, 195),
          title: Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "CARİ TANITIM LİSTESİ",
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
                      builder: (context) => const KayitEkleme(title: ""),
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
                    Text(
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
