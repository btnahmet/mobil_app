

// import 'package:flutter/material.dart';

// class KayitEkleme extends StatefulWidget {
//   const KayitEkleme({super.key, required this.title});
//   final String title;

//   @override
//   State<KayitEkleme> createState() => _KayitEklemeState();
// }

// class _KayitEklemeState extends State<KayitEkleme> {
//   // Kontrolcüleri tanımlıyoruz
//   final List<TextEditingController> _controllers = List.generate(
//     15,
//     (index) => TextEditingController(),
//   );

//   final List<String> _textValues = [
//     "Cari Kodu",
//     "Cari Ünvanı",
//     "Grup Kodu",
//     "Telefon - 1",
//     "Telefon - 2",
//     "Cep Telefon",
//     "e-Posta",
//     "Vergi Dairesi",
//     "Vkn-Tckn",
//     "Adres",
//     "İl",
//     "İlçe",
//     "Lisans Firma Kodu",
//     "Lisans Cihaz",
//     "GİB WS Firma Kodu",
//   ];

//   String? _selectedGIBDurum;
//   String? _selectedAnotherOption;

//   void _resetForm() {
//     // TextFormField'leri ve DropdownButtonFormField'leri sıfırla
//     for (var controller in _controllers) {
//       controller.clear(); // Her TextEditingController'ı temizle
//     }
//     _selectedGIBDurum = null; // DropdownButtonFormField'yi sıfırla
//     _selectedAnotherOption = null; // Diğer DropdownButtonFormField'yi sıfırla
//     setState(() {}); // UI'yi güncelle
//   }

//   @override
//   Widget build(BuildContext context) {
//     double deviceWidth = MediaQuery.of(context).size.width;
//     double deviceHeight = MediaQuery.of(context).size.height;

//     //Form alanları ve dropdown menülerini liste halinde tanımlıyoruz
//     final formFields = _textValues.asMap().entries.map((entry) {
//       int index = entry.key;
//       String text = entry.value;
//       return Padding(
//         padding: const EdgeInsets.only(bottom: 16.0),
//         child: TextFormField(
//           controller: _controllers[index], // Kontrolcüyü ata
//           decoration: InputDecoration(
//             labelText: text,
//             border: OutlineInputBorder(),
//           ),
//         ),
//       );
//     }).toList();

//     //Dropdown menülerini ekliyoruz
//     formFields.addAll([
//       Padding(
//         padding: const EdgeInsets.only(bottom: 16.0),
//         child: DropdownButtonFormField<String>(
//           decoration: InputDecoration(
//             labelText: 'GİB Durum',
//             border: OutlineInputBorder(),
//           ),
//           value: _selectedGIBDurum,
//           items: [
//             DropdownMenuItem(
//               value: 'Aktif',
//               child: Text('Aktif'),
//             ),
//             DropdownMenuItem(
//               value: 'Pasif',
//               child: Text('Pasif'),
//             ),
//             DropdownMenuItem(
//               value: 'Beklemede',
//               child: Text('Beklemede'),
//             ),
//           ],
//           onChanged: (value) {
//             setState(() {
//               _selectedGIBDurum = value;
//             });
//           },
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(bottom: 16.0),
//         child: DropdownButtonFormField<String>(
//           decoration: InputDecoration(
//             labelText: 'Diğer Seçenek',
//             border: OutlineInputBorder(),
//           ),
//           value: _selectedAnotherOption,
//           items: [
//             DropdownMenuItem(
//               value: 'Seçenek 1',
//               child: Text('Seçenek 1'),
//             ),
//             DropdownMenuItem(
//               value: 'Seçenek 2',
//               child: Text('Seçenek 2'),
//             ),
//           ],
//           onChanged: (value) {
//             setState(() {
//               _selectedAnotherOption = value;
//             });
//           },
//         ),
//       ),
//     ]);

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color.fromARGB(255, 233, 233, 231),
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 224, 224, 203),
//           title: const Text(
//             'KAYIT FORMU',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView(
//                   children: formFields,
//                 ),
//               ),
//               // Dört buton ekleme
//               Padding(
//                 padding: const EdgeInsets.only(top: 16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed:
//                             _resetForm, // Butona tıklanınca formu sıfırla
//                         child: Text('Yeni'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color.fromARGB(255, 224, 224, 203),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: deviceWidth / 100),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         child: Text('Kaydet'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color.fromARGB(255, 224, 224, 203),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: deviceWidth / 100),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         child: Text('Sil'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color.fromARGB(255, 224, 224, 203),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: deviceWidth / 100),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text('Kapat'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color.fromARGB(255, 224, 224, 203),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

