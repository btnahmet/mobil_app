// import 'package:flutter/material.dart';

// class KayitEkleme4 extends StatefulWidget {
//   const KayitEkleme4({super.key, required this.title});
//   final String title;

//   @override
//   State<KayitEkleme4> createState() => _KayitEkleme4State();
// }

// class _KayitEkleme4State extends State<KayitEkleme4> {
//   final _formKey = GlobalKey<FormState>();

//   final List<String> _textValues = [
//     "Fiş Numarası",
//     "Cari Kodu",
//     "Cari Ünvanı",
//     "Cihaz SN",
//   ];
//   DateTime? _selectedDate1;
//   DateTime? _selectedDate2;
//   String? _selectedGIBDurum;
//   final int _itemCount = 6; // Kaç tane TextFormField olduğunu belirler

//   final List<TextEditingController> _controllers = [];

//   final List<String> _bottomTextLabels = [
//     "Grup Kodu",
//     "Teslim Alan Kişi",
//     "Teslim Eden Kişi",
//     "Marka",
//     "Model",
//     "Arıza Tespit",
//   ]; // LabelText için kullanılacak string dizisi
//   final List<String> _bottomTextLabels2 = [
//     "Grup Kodu",
//     "Teslim Alan Kişi",
//   ]; // LabelText için kullanılacak string dizisi

//   @override
//   void initState() {
//     super.initState();
//     // _controllers listesini doldur
//     for (int i = 0; i < _itemCount; i++) {
//       _controllers.add(TextEditingController());
//     }
//   }

//   @override
//   void dispose() {
//     // Controller'ları dispose et
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double deviceWidth = MediaQuery.of(context).size.width;
//     double deviceHeight = MediaQuery.of(context).size.height;

//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: const Color.fromARGB(255, 233, 233, 231),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 224, 224, 203),
//         title: const Text(
//           'KAYIT FORMU',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(deviceWidth / 20),
//         child: Form(
//           key: _formKey,
//           child: Column(children: [
//             Expanded(
//               child: ListView(
//                 children: [
//                   ..._textValues.map((text) => Padding(
//                         padding: const EdgeInsets.only(bottom: 16.0),
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             labelText: text,
//                             border: const OutlineInputBorder(),
//                           ),
//                           // İstenirse burada onChanged veya validator eklenebilir
//                         ),
//                       )),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 16.0),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         labelText: 'Tarih Seç',
//                         border: OutlineInputBorder(),
//                       ),
//                       readOnly: true,
//                       onTap: () async {
//                         DateTime? pickedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2101),
//                         );

//                         if (pickedDate != null) {
//                           setState(() {
//                             _selectedDate1 = pickedDate;
//                           });
//                         }
//                       },
//                       controller: TextEditingController(
//                         text: _selectedDate1 == null
//                             ? ''
//                             : _selectedDate1
//                                 ?.toLocal()
//                                 .toString()
//                                 .split(' ')[0],
//                       ),
//                     ),
//                   ),

//                   // Bitiş Tarihi Seç
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 16.0),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         labelText: 'Bitiş Tarihi Seç',
//                         border: OutlineInputBorder(),
//                       ),
//                       readOnly: true,
//                       onTap: () async {
//                         DateTime? pickedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2101),
//                         );

//                         if (pickedDate != null) {
//                           setState(() {
//                             _selectedDate2 = pickedDate;
//                           });
//                         }
//                       },
//                       controller: TextEditingController(
//                         text: _selectedDate2 == null
//                             ? ''
//                             : _selectedDate2
//                                 ?.toLocal()
//                                 .toString()
//                                 .split(' ')[0],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 16.0),
//                     child: DropdownButtonFormField<String>(
//                       decoration: const InputDecoration(
//                         labelText: 'İşlem Türü',
//                         border: OutlineInputBorder(),
//                       ),
//                       value: _selectedGIBDurum,
//                       items: const [
//                         DropdownMenuItem(
//                           value: 'Bekliyor',
//                           child: Text('Bekliyor'),
//                         ),
//                         DropdownMenuItem(
//                           value: 'İade Edildi',
//                           child: Text('İade Edildi'),
//                         ),
//                         DropdownMenuItem(
//                           value: 'Tamamlandı',
//                           child: Text('Tamamlandı'),
//                         ),
//                         DropdownMenuItem(
//                           value: 'Parça Bekleniyor',
//                           child: Text('Parça Bekleniyor'),
//                         ),
//                         DropdownMenuItem(
//                           value: 'Fiyat Onayı Bekleniyor',
//                           child: Text('Fiyat Onayı Bekleniyor'),
//                         ),
//                         DropdownMenuItem(
//                           value: 'Sonuçlandırılmadı ',
//                           child: Text('Sonuçlandırılmadı'),
//                         ),
//                       ],
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedGIBDurum = value;
//                         });
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(0.0),
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: _itemCount,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(bottom: 16.0),
//                           child: TextFormField(
//                             controller: _controllers[index],
//                             decoration: InputDecoration(
//                               labelText: _bottomTextLabels[index],
//                               border: const OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Lütfen bir metin girin';
//                               }
//                               return null;
//                             },
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 16.0),
//                     child: DropdownButtonFormField<String>(
//                       decoration: const InputDecoration(
//                         labelText: 'Garanti Durumu',
//                         border: OutlineInputBorder(),
//                       ),
//                       value: _selectedGIBDurum,
//                       items: const [
//                         DropdownMenuItem(
//                           value: 'Garantisi Var',
//                           child: Text('Garantisi Var'),
//                         ),
//                         DropdownMenuItem(
//                           value: 'Garantisi Yok',
//                           child: Text('Garantisi Yok'),
//                         ),
//                       ],
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedGIBDurum = value;
//                         });
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 16.0),
//                     child: DropdownButtonFormField<String>(
//                       decoration: const InputDecoration(
//                         labelText: 'İşlem Yapan Kişi',
//                         border: OutlineInputBorder(),
//                       ),
//                       value: _selectedGIBDurum,
//                       items: const [
//                         DropdownMenuItem(
//                           value: 'Ahmet',
//                           child: Text('Ahmet'),
//                         ),
//                       ],
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedGIBDurum = value;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ]),
//         ),
//       ),
//     ));
//   }
// }
import 'package:flutter/material.dart';

class KayitEkleme4 extends StatefulWidget {
  const KayitEkleme4({super.key, required this.title});
  final String title;

  @override
  State<KayitEkleme4> createState() => _KayitEkleme4State();
}

class _KayitEkleme4State extends State<KayitEkleme4> {
  final _formKey = GlobalKey<FormState>();

  final List<String> _textValues = [
    "Fiş Numarası",
    "Cari Kodu",
    "Cari Ünvanı",
    "Cihaz SN",
  ];
  DateTime? _selectedDate1;
  DateTime? _selectedDate2;
  String? _selectedGIBDurum;
  final int _itemCount = 6; // Kaç tane TextFormField olduğunu belirler

  final List<TextEditingController> _controllers = [];

  final List<String> _bottomTextLabels = [
    "Grup Kodu",
    "Teslim Alan Kişi",
    "Teslim Eden Kişi",
    "Marka",
    "Model",
    "Arıza Tespit",
  ]; // LabelText için kullanılacak string dizisi
  final List<String> _bottomTextLabels2 = [
    "Grup Kodu",
    "Teslim Alan Kişi",
  ]; // LabelText için kullanılacak string dizisi

  @override
  void initState() {
    super.initState();
    // _controllers listesini doldur
    for (int i = 0; i < _itemCount; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    // Controller'ları dispose et
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 224, 224, 203),
        title: const Text(
          'KAYIT FORMU',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(deviceWidth / 20),
        child: Form(
          key: _formKey,
          child: Column(children: [
            Expanded(
              child: ListView(
                children: [
                  ..._textValues.map((text) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: text,
                            border: const OutlineInputBorder(),
                          ),
                          // İstenirse burada onChanged veya validator eklenebilir
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Tarih Seç',
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );

                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate1 = pickedDate;
                          });
                        }
                      },
                      controller: TextEditingController(
                        text: _selectedDate1 == null
                            ? ''
                            : _selectedDate1
                                ?.toLocal()
                                .toString()
                                .split(' ')[0],
                      ),
                    ),
                  ),

                  // Bitiş Tarihi Seç
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Bitiş Tarihi Seç',
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );

                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate2 = pickedDate;
                          });
                        }
                      },
                      controller: TextEditingController(
                        text: _selectedDate2 == null
                            ? ''
                            : _selectedDate2
                                ?.toLocal()
                                .toString()
                                .split(' ')[0],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'İşlem Türü',
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedGIBDurum,
                      items: const [
                        DropdownMenuItem(
                          value: 'Bekliyor',
                          child: Text('Bekliyor'),
                        ),
                        DropdownMenuItem(
                          value: 'İade Edildi',
                          child: Text('İade Edildi'),
                        ),
                        DropdownMenuItem(
                          value: 'Tamamlandı',
                          child: Text('Tamamlandı'),
                        ),
                        DropdownMenuItem(
                          value: 'Parça Bekleniyor',
                          child: Text('Parça Bekleniyor'),
                        ),
                        DropdownMenuItem(
                          value: 'Fiyat Onayı Bekleniyor',
                          child: Text('Fiyat Onayı Bekleniyor'),
                        ),
                        DropdownMenuItem(
                          value: 'Sonuçlandırılmadı ',
                          child: Text('Sonuçlandırılmadı'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedGIBDurum = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _itemCount,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextFormField(
                            controller: _controllers[index],
                            decoration: InputDecoration(
                              labelText: _bottomTextLabels[index],
                              border: const OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen bir metin girin';
                              }
                              return null;
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Garanti Durumu',
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedGIBDurum,
                      items: const [
                        DropdownMenuItem(
                          value: 'Garantisi Var',
                          child: Text('Garantisi Var'),
                        ),
                        DropdownMenuItem(
                          value: 'Garantisi Yok',
                          child: Text('Garantisi Yok'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedGIBDurum = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'İşlem Yapan Kişi',
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedGIBDurum,
                      items: const [
                        DropdownMenuItem(
                          value: 'Ahmet',
                          child: Text('Ahmet'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedGIBDurum = value;
                        });
                      },
                    ),
                  ),
                  // En alta eklenen yeni TextFormField'ler
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Yapılan İşlemler',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Açıklama',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
