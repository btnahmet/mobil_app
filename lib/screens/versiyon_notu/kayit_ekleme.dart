// import 'package:flutter/material.dart';

// class KayitEkleme8 extends StatefulWidget {
//   const KayitEkleme8({super.key, required this.title});
//   final String title;

//   @override
//   State<KayitEkleme8> createState() => _KayitEklemeState();
// }

// class _KayitEklemeState extends State<KayitEkleme8> {
//   String? selectedValue;
//   List<String> items = ['Seçenek 1', 'Seçenek 2', 'Seçenek 3', 'Seçenek 4'];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 233, 233, 231),
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 224, 224, 203),
//           title: const Text(
//             'NOT EKLEME',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             children: [
//               Row(
//                 children: [Text("Önem Derecesi")],
//               ),
//               Row(
//                 children: [
//                   DropdownButton<String>(
//                     value: selectedValue,
//                     hint: Text('Önem derecesini seçin'), // Varsayılan gösterilen text
//                     items: items.map((String item) {
//                       return DropdownMenuItem<String>(
//                         value: item,
//                         child: Text(item),
//                       );
//                     }).toList(),
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         selectedValue = newValue;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Başlık",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(0),
//                 child: Row(
//                   children: [Expanded(child: TextFormField())],
//                 ),
//               ),
//               Row(
//                 children: [Text("Not İçeriği")],
//               ),
//               Row(
//                 children: [Expanded(child: TextFormField())],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class KayitEkleme8 extends StatefulWidget {
//   const KayitEkleme8({super.key, required this.title});
//   final String title;

//   @override
//   State<KayitEkleme8> createState() => _KayitEklemeState();
// }

// class _KayitEklemeState extends State<KayitEkleme8> {
//   String? selectedValue;
//   List<String> items = ['Önemsiz', 'Önemli', 'Çok Önemli', 'Kritik Önem!'];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 233, 233, 231),
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 224, 224, 203),
//           title: const Text(
//             'NOT EKLEME',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 24, // Başlık font boyutu
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment:
//                   CrossAxisAlignment.start, // Elemanları sola hizala
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
//                   child: Row(
//                     children: const [
//                       Text(
//                         "Önem Derecesi",
//                         style: TextStyle(
//                           fontSize: 18, // Önem derecesi font boyutu
//                           fontWeight: FontWeight.bold, // Orta kalınlıkta
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 12.0),
//                   child: Row(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(
//                               255, 223, 223, 213), // Arka plan rengi
//                           borderRadius: BorderRadius.circular(
//                               8), // Kenarların yuvarlatılması (opsiyonel)
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12), // İçerideki boşluk (opsiyonel)
//                         child: DropdownButton<String>(
//                           value: selectedValue,
//                           hint: const Text(
//                             'Önem derecesini seçin',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w900,
//                             ), // Dropdown font boyutu
//                           ),
//                           items: items.map((String item) {
//                             return DropdownMenuItem<String>(
//                               value: item,
//                               child: Text(
//                                 item,
//                                 style: const TextStyle(
//                                     fontSize: 16), // Dropdown menü itemleri
//                               ),
//                             );
//                           }).toList(),
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               selectedValue = newValue;
//                             });
//                           },
//                           dropdownColor: const Color.fromARGB(255, 216, 222,
//                               224), // Açılan menüdeki arka plan rengi
//                           underline: Container(), // Alt çizgiyi kaldırmak için
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: Row(
//                     children: const [
//                       Text(
//                         "Başlık",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold, // Kalın başlık
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 16.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             hintText: 'Başlık girin..', // Placeholder ekleme
//                           ),
//                           style: TextStyle(fontSize: 16), // Input font boyutu
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: Row(
//                     children: const [
//                       Text(
//                         "Not İçeriği",
//                         style: TextStyle(
//                           fontSize: 18, // Not içeriği başlığı font boyutu
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         maxLines: 7, // Çok satırlı text field
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: 'Notunuzu girin...', // Placeholder ekleme
//                         ),
//                         style: TextStyle(fontSize: 16), // Input font boyutu
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(105,20 , 0, 0),
//                   child: Row(
//                     children: [
//                       ElevatedButton(onPressed: () {}, child: Text("Notu Kaydet"))
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class KayitEkleme8 extends StatefulWidget {
  const KayitEkleme8({super.key, required this.title});
  final String title;

  @override
  State<KayitEkleme8> createState() => _KayitEklemeState();
}

class _KayitEklemeState extends State<KayitEkleme8> {
  String? selectedValue;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  List<String> items = ['Önemsiz', 'Önemli', 'Çok Önemli', 'Kritik Önem!'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 233, 231),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 224, 224, 203),
          title: const Text(
            'NOT EKLEME',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24, // Başlık font boyutu
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Elemanları sola hizala
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                  child: Text(
                    "Önem Derecesi",
                    style: TextStyle(
                      fontSize: 18, // Önem derecesi font boyutu
                      fontWeight: FontWeight.bold, // Orta kalınlıkta
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: DropdownButton<String>(
                    value: selectedValue,
                    hint: const Text(
                      'Önem derecesini seçin',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
                    dropdownColor: const Color.fromARGB(255, 216, 222, 224),
                    underline: Container(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Başlık",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold, // Kalın başlık
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Başlık girin..',
                    ),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Not İçeriği",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: contentController,
                  maxLines: 7,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Notunuzu girin...',
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(105, 20, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Kaydet ve geri dön
                      Navigator.pop(context, {
                        'title': titleController.text,
                        'content': contentController.text,
                        'importance': selectedValue ?? 'Belirtilmedi',
                      });
                    },
                    child: const Text("Notu Kaydet"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
