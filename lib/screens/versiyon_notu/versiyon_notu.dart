// // import 'package:flutter/material.dart';
// // import 'package:mobil_app/screens/versiyon_notu/kayit_ekleme.dart';

// // class VersiyonNotu extends StatefulWidget {
// //   const VersiyonNotu({super.key, required this.title});
// //   final String title;

// //   @override
// //   State<VersiyonNotu> createState() => _VersiyonNotuState();
// // }

// // class _VersiyonNotuState extends State<VersiyonNotu> {
// //   @override
// //   Widget build(BuildContext context) {
// //     double deviceWidth = MediaQuery.of(context).size.width;
// //     double deviceHeight = MediaQuery.of(context).size.height;
// //     return SafeArea(
// //       child: Scaffold(
// //         backgroundColor: const Color.fromARGB(255, 233, 233, 228),
// //         appBar: AppBar(
// //           backgroundColor: const Color.fromARGB(255, 219, 219, 195),
// //           title: Container(
// //             child: const Row(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Text(
// //                   "NOTLARIM",
// //                   style: TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 )
// //               ],
// //             ),
// //           ),
// //         ),
// //         body: Padding(
// //           //padding: EdgeInsets.symmetric(horizontal: deviceWidth/30),
// //           padding: EdgeInsets.fromLTRB(
// //               deviceWidth / 18, deviceHeight / 18, deviceWidth / 10, 0),
// //           child: Row(
// //             children: [
// //               ElevatedButton(
// //                 onPressed: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => const KayitEkleme8(title: ""),
// //                     ),
// //                   );
// //                 },
// //                 child: Row(
// //                   children: [
// //                     Image.asset(
// //                       "lib/assets/images/plus_icon.png",
// //                       height: deviceHeight * 0.03,
// //                     ),
// //                     SizedBox(width: deviceWidth * 0.03),
// //                     const Text(
// //                       "Not Ekle",
// //                       style: TextStyle(fontSize: 20, color: Colors.black),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'kayit_ekleme.dart';

// class VersiyonNotu extends StatefulWidget {
//   const VersiyonNotu({super.key, required this.title});
//   final String title;

//   @override
//   State<VersiyonNotu> createState() => _VersiyonNotuState();
// }

// class _VersiyonNotuState extends State<VersiyonNotu> {
//   // This list will store notes added from the second page
//   List<Map<String, String>> notes = [];

//   // This method will be called when returning from the KayitEkleme8 page
//   void addNote(Map<String, String> newNote) {
//     setState(() {
//       notes.add(newNote);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double deviceWidth = MediaQuery.of(context).size.width;
//     double deviceHeight = MediaQuery.of(context).size.height;

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 233, 233, 228),
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 219, 219, 195),
//           title: const Text(
//             "NOTLARIM",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: EdgeInsets.fromLTRB(
//               deviceWidth / 18, deviceHeight / 18, deviceWidth / 10, 0),
//           child: Column(
//             children: [
//               ElevatedButton(
//                 onPressed: () async {
//                   // Navigate to KayitEkleme8 and wait for a result (new note)
//                   final result = await Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const KayitEkleme8(title: ""),
//                     ),
//                   );

//                   // If a note is returned, add it to the list
//                   if (result != null && result is Map<String, String>) {
//                     addNote(result);
//                   }
//                 },
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       "lib/assets/images/plus_icon.png",
//                       height: deviceHeight * 0.03,
//                     ),
//                     SizedBox(width: deviceWidth * 0.03),
//                     const Text(
//                       "Not Ekle",
//                       style: TextStyle(fontSize: 20, color: Colors.black),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: notes.length,
//                   itemBuilder: (context, index) {
//                     final note = notes[index];
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Card(
//                         color: const Color.fromARGB(255, 233, 233, 228),
//                         elevation: 3,
//                         child: ExpansionTile(
//                           title: Text(
//                             note['title'] ?? '',
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           subtitle: Text(
//                             note['importance'] ?? '',
//                             style: const TextStyle(
//                               fontSize: 16,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 note['content'] ?? '',
//                                 style: const TextStyle(fontSize: 16),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'kayit_ekleme.dart';

class VersiyonNotu extends StatefulWidget {
  const VersiyonNotu({super.key, required this.title});
  final String title;

  @override
  State<VersiyonNotu> createState() => _VersiyonNotuState();
}

class _VersiyonNotuState extends State<VersiyonNotu> {
  // This list will store notes added from the second page
  List<Map<String, String>> notes = [];

  // This method will be called when returning from the KayitEkleme8 page
  void addNote(Map<String, String> newNote) {
    setState(() {
      notes.add(newNote);
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 233, 228),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 219, 219, 195),
          title: const Text(
            "NOTLARIM",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              deviceWidth / 18, deviceHeight / 18, deviceWidth / 10, 0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Card(
                        color: const Color.fromARGB(255, 233, 233, 228),
                        elevation: 3,
                        child: ExpansionTile(
                          title: Text(
                            note['title'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            note['importance'] ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                note['content'] ?? '',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: deviceHeight*0.1),
                child: ElevatedButton(
                  onPressed: () async {
                    // Navigate to KayitEkleme8 and wait for a result (new note)
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KayitEkleme8(title: ""),
                      ),
                    );
                
                    // If a note is returned, add it to the list
                    if (result != null && result is Map<String, String>) {
                      addNote(result);
                    }
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "lib/assets/images/plus_icon.png",
                        height: deviceHeight * 0.03,
                      ),
                      SizedBox(width: deviceWidth * 0.03),
                      const Text(
                        "Not Ekle",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
