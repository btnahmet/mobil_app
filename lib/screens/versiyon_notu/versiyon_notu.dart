// import 'package:flutter/material.dart';
// import 'package:mobil_app/screens/versiyon_notu/kayit_ekleme.dart';

// class VersiyonNotu extends StatefulWidget {
//   const VersiyonNotu({super.key, required this.title});
//   final String title;

//   @override
//   State<VersiyonNotu> createState() => _VersiyonNotuState();
// }

// class _VersiyonNotuState extends State<VersiyonNotu> {
//   List<Map<String, String>> notes = [];

//   void addNote(Map<String, String> newNote) {
//     setState(() {
//       notes.add(newNote);
//       notes.sort(
//           (a, b) => compareImportance(a['importance']!, b['importance']!));
//     });
//   }

//   int compareImportance(String a, String b) {
//     const importanceLevels = {
//       'Kritik Önem!': 0,
//       'Çok Önemli': 1,
//       'Önemli': 2,
//       'Önemsiz': 3,
//     };
//     return importanceLevels[a]!.compareTo(importanceLevels[b]!);
//   }

//   Color getColorForImportance(String importance) {
//     switch (importance) {
//       case 'Kritik Önem!':
//         return Color.fromARGB(255, 240, 3, 3); 
//       case 'Çok Önemli':
//         return Colors.orangeAccent;
//       case 'Önemli':
//         return Colors.yellowAccent;
//       case 'Önemsiz':
//         return Color.fromARGB(255, 33, 202, 120);
//       default:
//         return Colors.white;
//     }
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
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: notes.length,
//                   itemBuilder: (context, index) {
//                     final note = notes[index];
//                     final importance = note['importance'] ?? '';
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Card(
//                         color: getColorForImportance(importance),
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
//                             importance,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               color: Color.fromARGB(255, 0, 0, 0),
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
//               Padding(
//                 padding: EdgeInsets.only(bottom: deviceHeight * 0.1),
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     final result = await Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const KayitEkleme8(title: ""),
//                       ),
//                     );

//                     if (result != null && result is Map<String, String>) {
//                       addNote(result);
//                     }
//                   },
//                   child: Row(
//                     children: [
//                       Icon(Icons.add, size: deviceHeight * 0.03),
//                       SizedBox(width: deviceWidth * 0.03),
//                       const Text(
//                         "Not Ekle",
//                         style: TextStyle(fontSize: 20, color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// versiyon_notu.dart
import 'package:flutter/material.dart';
import 'kayit_ekleme.dart';

class VersiyonNotu extends StatefulWidget {
  const VersiyonNotu({super.key, required this.title});
  final String title;

  @override
  State<VersiyonNotu> createState() => _VersiyonNotuState();
}

class _VersiyonNotuState extends State<VersiyonNotu> {
  List<Map<String, String>> notes = [];

  void addNote(Map<String, String> newNote) {
    setState(() {
      notes.add(newNote);
      notes.sort(
          (a, b) => compareImportance(a['importance']!, b['importance']!));
    });
  }

  int compareImportance(String a, String b) {
    const importanceLevels = {
      'Kritik Önem!': 0,
      'Çok Önemli': 1,
      'Önemli': 2,
      'Önemsiz': 3,
    };
    return importanceLevels[a]!.compareTo(importanceLevels[b]!);
  }

  Color getColorForImportance(String importance) {
    switch (importance) {
      case 'Kritik Önem!':
        return const Color.fromARGB(255, 240, 3, 3);
      case 'Çok Önemli':
        return Colors.orangeAccent;
      case 'Önemli':
        return Colors.yellowAccent;
      case 'Önemsiz':
        return const Color.fromARGB(255, 33, 202, 120);
      default:
        return Colors.white;
    }
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
                    final importance = note['importance'] ?? '';
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Card(
                        color: getColorForImportance(importance),
                        elevation: 3,
                        child: ExpansionTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  note['title'] ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  note['person'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    // fontStyle: FontStyle.,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            importance,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
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
                padding: EdgeInsets.only(bottom: deviceHeight * 0.1),
                child: ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KayitEkleme8(title: ""),
                      ),
                    );

                    if (result != null && result is Map<String, String>) {
                      addNote(result);
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add, size: deviceHeight * 0.03),
                      SizedBox(width: deviceWidth * 0.03),
                      const Text(
                        'Yeni Not Ekle',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
