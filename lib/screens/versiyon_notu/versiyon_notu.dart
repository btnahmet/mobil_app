
// // // import 'package:flutter/material.dart';
// // // import 'kayit_ekleme.dart';
// // // import 'package:intl/intl.dart';

// // // class VersiyonNotu extends StatefulWidget {
// // //   const VersiyonNotu({super.key, required this.title});
// // //   final String title;

// // //   @override
// // //   State<VersiyonNotu> createState() => _VersiyonNotuState();
// // // }

// // // class _VersiyonNotuState extends State<VersiyonNotu> {
// // //   List<Map<String, String>> notes = [];

// // //   void addNote(Map<String, String> newNote) {
// // //     setState(() {
// // //       // Tarihi ekleyelim
// // //       newNote['date'] = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
// // //       notes.add(newNote);
// // //       notes.sort(
// // //           (a, b) => compareImportance(a['importance'] ?? '', b['importance'] ?? ''));
// // //     });
// // //   }

// // //   int compareImportance(String a, String b) {
// // //     const importanceLevels = {
// // //       'Kritik Önem!': 0,
// // //       'Çok Önemli': 1,
// // //       'Önemli': 2,
// // //       'Önemsiz': 3,
// // //     };
// // //     return (importanceLevels[a] ?? 4).compareTo(importanceLevels[b] ?? 4);
// // //   }

// // //   Color getColorForImportance(String importance) {
// // //     switch (importance) {
// // //       case 'Kritik Önem!':
// // //         return const Color.fromARGB(255, 240, 3, 3);
// // //       case 'Çok Önemli':
// // //         return Colors.orangeAccent;
// // //       case 'Önemli':
// // //         return Colors.yellowAccent;
// // //       case 'Önemsiz':
// // //         return const Color.fromARGB(255, 33, 202, 120);
// // //       default:
// // //         return Colors.white;
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     double deviceWidth = MediaQuery.of(context).size.width;
// // //     double deviceHeight = MediaQuery.of(context).size.height;

// // //     return SafeArea(
// // //       child: Scaffold(
// // //         backgroundColor: const Color.fromARGB(255, 233, 233, 228),
// // //         appBar: AppBar(
// // //           backgroundColor: const Color.fromARGB(255, 219, 219, 195),
// // //           title: const Text(
// // //             "NOTLARIM",
// // //             style: TextStyle(
// // //               fontWeight: FontWeight.bold,
// // //             ),
// // //           ),
// // //         ),
// // //         body: Padding(
// // //           padding: EdgeInsets.fromLTRB(
// // //               deviceWidth / 18, deviceHeight / 18, deviceWidth / 10, 0),
// // //           child: Column(
// // //             children: [
// // //               Expanded(
// // //                 child: ListView.builder(
// // //                   itemCount: notes.length,
// // //                   itemBuilder: (context, index) {
// // //                     final note = notes[index];
// // //                     final importance = note['importance'] ?? '';
// // //                     return Padding(
// // //                       padding: const EdgeInsets.symmetric(vertical: 5.0),
// // //                       child: Card(
// // //                         color: getColorForImportance(importance),
// // //                         elevation: 8,
// // //                         child: ExpansionTile(
// // //                           title: Row(
// // //                             children: [
// // //                               Expanded(
// // //                                 child: Text(
// // //                                   note['title'] ?? '',
// // //                                   style: const TextStyle(
// // //                                     fontWeight: FontWeight.bold,
// // //                                     fontSize: 18,
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                               Expanded(
// // //                                 child: Padding(
// // //                                   padding: const EdgeInsets.only(right: 8.0),
// // //                                   child: Column(
// // //                                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                                     children: [
// // //                                       Text(
// // //                                         note['person'] ?? '',
// // //                                         style: const TextStyle(
// // //                                           fontSize: 15,
// // //                                           color: Color.fromARGB(255, 0, 0, 0),
// // //                                         ),
// // //                                       ),
// // //                                       Text(
// // //                                         note['date'] ?? '',
// // //                                         style: const TextStyle(
// // //                                           fontSize: 12,
// // //                                           color: Color.fromARGB(255, 0, 0, 0),
// // //                                         ),
// // //                                       ),
// // //                                     ],
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                           subtitle: Text(
// // //                             importance,
// // //                             style: const TextStyle(
// // //                               fontSize: 16,
// // //                               color: Colors.black,
// // //                             ),
// // //                           ),
// // //                           children: [
// // //                             Padding(
// // //                               padding: const EdgeInsets.all(8.0),
// // //                               child: Text(
// // //                                 note['content'] ?? '',
// // //                                 style: const TextStyle(fontSize: 16),
// // //                               ),
// // //                             ),
// // //                             // Butonlar
// // //                             Padding(
// // //                               padding: const EdgeInsets.all(8.0),
// // //                               child: Row(
// // //                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                                 children: [
// // //                                   ElevatedButton(
// // //                                     onPressed: () {
// // //                                       // Buton 1 işlevi buraya gelecek
// // //                                     },
// // //                                     child: const Text("Düzenleme"),
// // //                                   ),
// // //                                   ElevatedButton(
// // //                                     onPressed: () {
// // //                                       // Buton 2 işlevi buraya gelecek
// // //                                     },
// // //                                     child: const Text("Tamamlandı"),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     );
// // //                   },
// // //                 ),
// // //               ),
// // //               Padding(
// // //                 padding: EdgeInsets.only(bottom: deviceHeight * 0.1),
// // //                 child: ElevatedButton(
// // //                   onPressed: () async {
// // //                     final result = await Navigator.push(
// // //                       context,
// // //                       MaterialPageRoute(
// // //                         builder: (context) => const KayitEkleme8(title: ""),
// // //                       ),
// // //                     );

// // //                     if (result != null && result is Map<String, String>) {
// // //                       addNote(result);
// // //                     }
// // //                   },
// // //                   child: Row(
// // //                     children: [
// // //                       Icon(Icons.add, size: deviceHeight * 0.03),
// // //                       SizedBox(width: deviceWidth * 0.03),
// // //                       const Text(
// // //                         'Yeni Not Ekle',
// // //                         style: TextStyle(
// // //                           fontSize: 18,
// // //                           fontWeight: FontWeight.bold,
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'kayit_ekleme.dart';
// // import 'package:intl/intl.dart';

// // class VersiyonNotu extends StatefulWidget {
// //   const VersiyonNotu({super.key, required this.title});
// //   final String title;

// //   @override
// //   State<VersiyonNotu> createState() => _VersiyonNotuState();
// // }

// // class _VersiyonNotuState extends State<VersiyonNotu> {
// //   List<Map<String, String>> notes = [];  // Notların saklandığı liste

// //   void addNote(Map<String, String> newNote) {
// //     setState(() {
// //       // Tarih ekleniyor
// //       newNote['date'] = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
// //       notes.add(newNote);
// //       notes.sort((a, b) => compareImportance(a['importance'] ?? '', b['importance'] ?? ''));  // Önem sırasına göre sıralama
// //     });
// //   }

// //   // Önem seviyesine göre sıralama işlevi
// //   int compareImportance(String a, String b) {
// //     const importanceLevels = {
// //       'Kritik Önem!': 0,
// //       'Çok Önemli': 1,
// //       'Önemli': 2,
// //       'Önemsiz': 3,
// //     };
// //     return (importanceLevels[a] ?? 4).compareTo(importanceLevels[b] ?? 4);
// //   }

// //   // Önem seviyesine göre kart rengini belirleyen işlev
// //   Color getColorForImportance(String importance) {
// //     switch (importance) {
// //       case 'Kritik Önem!':
// //         return const Color.fromARGB(255, 240, 3, 3);  // Kırmızı renk
// //       case 'Çok Önemli':
// //         return Colors.orangeAccent;  // Turuncu renk
// //       case 'Önemli':
// //         return Colors.yellowAccent;  // Sarı renk
// //       case 'Önemsiz':
// //         return const Color.fromARGB(255, 33, 202, 120);  // Yeşil renk
// //       default:
// //         return Colors.white;  // Varsayılan renk
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double deviceWidth = MediaQuery.of(context).size.width;
// //     double deviceHeight = MediaQuery.of(context).size.height;

// //     return SafeArea(
// //       child: Scaffold(
// //         backgroundColor: const Color.fromARGB(255, 233, 233, 228),
// //         appBar: AppBar(
// //           backgroundColor: const Color.fromARGB(255, 219, 219, 195),
// //           title: const Text(
// //             "NOTLARIM",
// //             style: TextStyle(
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //         ),
// //         body: Padding(
// //           padding: EdgeInsets.fromLTRB(
// //               deviceWidth / 18, deviceHeight / 18, deviceWidth / 10, 0),
// //           child: Column(
// //             children: [
// //               Expanded(
// //                 child: ListView.builder(
// //                   itemCount: notes.length,
// //                   itemBuilder: (context, index) {
// //                     final note = notes[index];
// //                     final importance = note['importance'] ?? '';
// //                     return Padding(
// //                       padding: const EdgeInsets.symmetric(vertical: 5.0),
// //                       child: Card(
// //                         color: getColorForImportance(importance),
// //                         elevation: 8,
// //                         child: ExpansionTile(
// //                           title: Row(
// //                             children: [
// //                               Expanded(
// //                                 child: Text(
// //                                   note['title'] ?? '',  // Başlık
// //                                   style: const TextStyle(
// //                                     fontWeight: FontWeight.bold,
// //                                     fontSize: 18,
// //                                   ),
// //                                 ),
// //                               ),
// //                               Expanded(
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.only(right: 8.0),
// //                                   child: Column(
// //                                     crossAxisAlignment: CrossAxisAlignment.start,
// //                                     children: [
// //                                       Text(
// //                                         note['person'] ?? '',  // Notu ekleyen kişi
// //                                         style: const TextStyle(
// //                                           fontSize: 15,
// //                                           color: Color.fromARGB(255, 0, 0, 0),
// //                                         ),
// //                                       ),
// //                                       Text(
// //                                         note['date'] ?? '',  // Tarih
// //                                         style: const TextStyle(
// //                                           fontSize: 12,
// //                                           color: Color.fromARGB(255, 0, 0, 0),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                           subtitle: Text(
// //                             importance,  // Önem seviyesi
// //                             style: const TextStyle(
// //                               fontSize: 16,
// //                               color: Colors.black,
// //                             ),
// //                           ),
// //                           children: [
// //                             Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: Text(
// //                                 note['content'] ?? '',  // Not içeriği
// //                                 style: const TextStyle(fontSize: 16),
// //                               ),
// //                             ),
// //                             Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: Row(
// //                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                                 children: [
// //                                   ElevatedButton(
// //                                     onPressed: () async {
// //                                       final result = await Navigator.push(
// //                                         context,
// //                                         MaterialPageRoute(
// //                                           builder: (context) => KayitEkleme8(
// //                                             title: 'Düzenle',
// //                                             initialNote: note,  // Mevcut not düzenleme sayfasına gönderiliyor
// //                                           ),
// //                                         ),
// //                                       );
// //                                       if (result != null && result is Map<String, String>) {
// //                                         setState(() {
// //                                           notes[index] = result;  // Düzenlenen not geri dönüyor
// //                                         });
// //                                       }
// //                                     },
// //                                     child: const Text("Düzenleme"),  // Düzenleme butonu
// //                                   ),
// //                                   ElevatedButton(
// //                                     onPressed: () {
// //                                       setState(() {
// //                                         notes.removeAt(index);  // Notu siler
// //                                       });
// //                                     },
// //                                     child: const Text("Tamamlandı"),  // Silme butonu
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsets.only(bottom: deviceHeight * 0.1),
// //                 child: ElevatedButton(
// //                   onPressed: () async {
// //                     final result = await Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => const KayitEkleme8(title: "Yeni Not Ekle"),  // Yeni not ekleme
// //                       ),
// //                     );

// //                     if (result != null && result is Map<String, String>) {
// //                       addNote(result);  // Yeni not ekleniyor
// //                     }
// //                   },
// //                   child: Row(
// //                     children: [
// //                       Icon(Icons.add, size: deviceHeight * 0.03),
// //                       SizedBox(width: deviceWidth * 0.03),
// //                       const Text(
// //                         'Yeni Not Ekle',
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
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
// import 'package:intl/intl.dart';

// class VersiyonNotu extends StatefulWidget {
//   const VersiyonNotu({super.key, required this.title});
//   final String title;

//   @override
//   State<VersiyonNotu> createState() => _VersiyonNotuState();
// }

// class _VersiyonNotuState extends State<VersiyonNotu> {
//   List<Map<String, String>> notes = [];  // Notların saklandığı liste

//   void addNote(Map<String, String> newNote) {
//     setState(() {
//       // Tarih ekleniyor
//       newNote['date'] = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
//       notes.add(newNote);
//       notes.sort((a, b) => compareImportance(a['importance'] ?? '', b['importance'] ?? ''));  // Önem sırasına göre sıralama
//     });
//   }

//   // Önem seviyesine göre sıralama işlevi
//   int compareImportance(String a, String b) {
//     const importanceLevels = {
//       'Kritik Önem!': 0,
//       'Çok Önemli': 1,
//       'Önemli': 2,
//       'Önemsiz': 3,
//     };
//     return (importanceLevels[a] ?? 4).compareTo(importanceLevels[b] ?? 4);
//   }

//   // Önem seviyesine göre kart rengini belirleyen işlev
//   Color getColorForImportance(String importance) {
//     switch (importance) {
//       case 'Kritik Önem!':
//         return const Color.fromARGB(255, 240, 3, 3);  // Kırmızı renk
//       case 'Çok Önemli':
//         return Colors.orangeAccent;  // Turuncu renk
//       case 'Önemli':
//         return Colors.yellowAccent;  // Sarı renk
//       case 'Önemsiz':
//         return const Color.fromARGB(255, 33, 202, 120);  // Yeşil renk
//       default:
//         return Colors.white;  // Varsayılan renk
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
//                         elevation: 8,
//                         child: ExpansionTile(
//                           title: Row(
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   note['title'] ?? '',  // Başlık
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(right: 8.0),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         note['person'] ?? '',  // Notu ekleyen kişi
//                                         style: const TextStyle(
//                                           fontSize: 15,
//                                           color: Color.fromARGB(255, 0, 0, 0),
//                                         ),
//                                       ),
//                                       Text(
//                                         note['date'] ?? '',  // Tarih
//                                         style: const TextStyle(
//                                           fontSize: 12,
//                                           color: Color.fromARGB(255, 0, 0, 0),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           subtitle: Text(
//                             importance,  // Önem seviyesi
//                             style: const TextStyle(
//                               fontSize: 16,
//                               color: Colors.black,
//                             ),
//                           ),
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 note['content'] ?? '',  // Not içeriği
//                                 style: const TextStyle(fontSize: 16),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   ElevatedButton(
//                                     onPressed: () async {
//                                       final result = await Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => KayitEkleme8(
//                                             title: 'Düzenle',
//                                             initialNote: note,  // Mevcut not düzenleme sayfasına gönderiliyor
//                                           ),
//                                         ),
//                                       );
//                                       if (result != null && result is Map<String, String>) {
//                                         setState(() {
//                                           notes[index] = result;  // Düzenlenen not geri dönüyor
//                                         });
//                                       }
//                                     },
//                                     child: const Text("Düzenleme"),  // Düzenleme butonu
//                                   ),
//                                   ElevatedButton(
//                                     onPressed: () {},
//                                     child: const Text("Tamamlandı"),   
//                                   ),
//                                 ],
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
//                         builder: (context) => const KayitEkleme8(title: "Yeni Not Ekle"),  // Yeni not ekleme
//                       ),
//                     );

//                     if (result != null && result is Map<String, String>) {
//                       addNote(result);  // Yeni not ekleniyor
//                     }
//                   },
//                   child: Row(
//                     children: [
//                       Icon(Icons.add, size: deviceHeight * 0.03),
//                       SizedBox(width: deviceWidth * 0.03),
//                       const Text(
//                         'Yeni Not Ekle',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
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
import 'package:flutter/material.dart';
import 'kayit_ekleme.dart';
import 'package:intl/intl.dart';

class VersiyonNotu extends StatefulWidget {
  const VersiyonNotu({super.key, required this.title});
  final String title;

  @override
  State<VersiyonNotu> createState() => _VersiyonNotuState();
}

class _VersiyonNotuState extends State<VersiyonNotu> {
  List<Map<String, String>> notes = [];  // Notların saklandığı liste

  // Not ekleme işlemi
  void addNote(Map<String, String> newNote) {
    setState(() {
      // Tarih ekleniyor
      newNote['date'] = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
      notes.add(newNote);
      notes.sort((a, b) => compareImportance(a['importance'] ?? '', b['importance'] ?? ''));  // Önem sırasına göre sıralama
    });
  }

  // Not güncelleme işlemi
  void updateNote(Map<String, String> updatedNote, int index) {
    setState(() {
      updatedNote['date'] = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());  // Tarih güncelleniyor
      notes[index] = updatedNote;
    });
  }

  // Önem seviyesine göre sıralama işlevi
  int compareImportance(String a, String b) {
    const importanceLevels = {
      'Kritik Önem!': 0,
      'Çok Önemli': 1,
      'Önemli': 2,
      'Önemsiz': 3,
    };
    return (importanceLevels[a] ?? 4).compareTo(importanceLevels[b] ?? 4);
  }

  // Önem seviyesine göre kart rengini belirleyen işlev
  Color getColorForImportance(String importance) {
    switch (importance) {
      case 'Kritik Önem!':
        return const Color.fromARGB(255, 240, 3, 3);  // Kırmızı renk
      case 'Çok Önemli':
        return Colors.orangeAccent;  // Turuncu renk
      case 'Önemli':
        return Colors.yellowAccent;  // Sarı renk
      case 'Önemsiz':
        return const Color.fromARGB(255, 33, 202, 120);  // Yeşil renk
      default:
        return Colors.white;  // Varsayılan renk
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
                        elevation: 8,
                        child: ExpansionTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  note['title'] ?? '',  // Başlık
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        note['person'] ?? '',  // Notu ekleyen kişi
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                      Text(
                                        note['date'] ?? '',  // Tarih
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            importance,  // Önem seviyesi
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                note['content'] ?? '',  // Not içeriği
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      final result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => KayitEkleme8(
                                            title: 'Düzenle',
                                            initialNote: note,  // Mevcut not düzenleme sayfasına gönderiliyor
                                          ),
                                        ),
                                      );  
                                      if (result != null && result is Map<String, String>) {
                                        updateNote(result, index);  // Güncellenen not geri dönüyor
                                      }
                                    },
                                    child: const Text("Düzenleme"),  // Düzenleme butonu
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Tamamlandı"),   
                                  ),
                                ],
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
                        builder: (context) => const KayitEkleme8(title: "Yeni Not Ekle"),  // Yeni not ekleme
                      ),
                    );

                    if (result != null && result is Map<String, String>) {
                      addNote(result);  // Yeni not ekleniyor
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
