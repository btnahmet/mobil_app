import 'package:flutter/material.dart';

class KayitEkleme5 extends StatefulWidget {
  const KayitEkleme5({super.key, required this.title});
  final String title;

  @override
  State<KayitEkleme5> createState() => _KayitEkleme5State();
}

class _KayitEkleme5State extends State<KayitEkleme5> {
  final int _itemCount = 3; // Kaç tane TextFormField olduğunu belirler

  final List<TextEditingController> _controllers = [];

  final List<String> _bottomTextLabels = [
    "Grup Kodu",
    "Teslim Alan Kişi",
    "Teslim Eden Kişi",
  ];
  DateTime? _selectedDate1;

  // FormKey eklendi
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _itemCount; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
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
          padding: EdgeInsets.all(16),
          child: Form(
            // Form widget'ı eklendi
            key: _formKey, // Form key bağlandı
            child: Column(
              // Expanded kullanımı doğru değil, Column kullanıldı
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _itemCount,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
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
                          : _selectedDate1?.toLocal().toString().split(' ')[0],
                    ),
                  ),
                ),
                Row(
                  // Formun altındaki butonlar için Row kullanıldı
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Form geçerliyse, işlemleri buraya ekleyin
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(deviceWidth / 2.5, 50),
                        backgroundColor: const Color.fromARGB(255, 224, 224, 203),
                      ),
                      child: const Text('Kaydet'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // İptal butonu işlemleri
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(deviceWidth / 2.5, 50),
                        backgroundColor: const Color.fromARGB(255, 224, 224, 203),
                      ),
                      child: const Text('İptal'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class KayitEkleme5 extends StatefulWidget {
//   const KayitEkleme5({super.key, required this.title});
//   final String title;

//   @override
//   State<KayitEkleme5> createState() => _KayitEkleme5State();
// }

// class _KayitEkleme5State extends State<KayitEkleme5> {
//   final int _itemCount = 3; // Number of TextFormField widgets

//   final List<TextEditingController> _controllers = [];
//   final List<String> _bottomTextLabels = [
//     "Grup Kodu",
//     "Teslim Alan Kişi",
//     "Teslim Eden Kişi",
//   ];
//   DateTime? _selectedDate1;

//   // FormKey added
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     for (int i = 0; i < _itemCount; i++) {
//       _controllers.add(TextEditingController());
//     }
//   }

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double deviceWidth = MediaQuery.of(context).size.width;

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 233, 233, 231),
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 224, 224, 203),
//           title: const Text(
//             'KAYIT FORMU',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Form(
//               key: _formKey, // Form key bound
//               child: Column(
//                 children: [
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: _itemCount,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(bottom: 16),
//                         child: TextFormField(
//                           controller: _controllers[index],
//                           decoration: InputDecoration(
//                             labelText: _bottomTextLabels[index],
//                             border: const OutlineInputBorder(),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Lütfen bir metin girin';
//                             }
//                             return null;
//                           },
//                         ),
//                       );
//                     },
//                   ),
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
//                             : _selectedDate1?.toLocal().toString().split(' ')[0],
//                       ),
//                     ),
//                   ),
                  
//                   Row(
//                     // Buttons at the bottom of the form
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             // If the form is valid, add your logic here
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: Size(deviceWidth / 2.5, 50),
//                           backgroundColor: const Color.fromARGB(255, 224, 224, 203),
//                         ),
//                         child: const Text('Kaydet'),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Cancel button logic
//                         },
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: Size(deviceWidth / 2.5, 50),
//                           backgroundColor: const Color.fromARGB(255, 224, 224, 203),
//                         ),
//                         child: const Text('İptal'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }