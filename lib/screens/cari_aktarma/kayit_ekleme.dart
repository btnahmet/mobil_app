import 'package:flutter/material.dart';

class KayitEkleme2 extends StatefulWidget {
  const KayitEkleme2({super.key, required this.title});
  final String title;

  @override
  State<KayitEkleme2> createState() => _KayitEklemeState();
}

class _KayitEklemeState extends State<KayitEkleme2> {
  final _formKey = GlobalKey<FormState>();
  //final _formKey = GlobalKey<FormState>();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();

  String? _selectedAdditionalOption;

  final List<String> _textValues = [
    "Fiş Numarası",
    "Cari Kodu",
    "Cari Ünvanı",
    "Bakım Anlaşması",
    "Durum",
    "Görüşme Durum",
  ];

  String? _selectedGIBDurum;
  String? _selectedAnotherOption;
  DateTime? _selectedDate;

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
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
                            // onChanged ve diğer işlevler eklenecekse burada tanımlanabilir
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Gelen Arama Türü',
                          border: OutlineInputBorder(),
                        ),
                        value: _selectedGIBDurum,
                        items: const [
                          DropdownMenuItem(
                            value: 'Sabit Hat',
                            child: Text('Sabit Hat'),
                          ),
                          DropdownMenuItem(
                            value: 'Şirket Hattı',
                            child: Text('Şirket Hattı'),
                          ),
                          DropdownMenuItem(
                            value: 'WhatsApp',
                            child: Text('WhatsApp'),
                          ),
                          DropdownMenuItem(
                            value: 'Şahıs Hattı',
                            child: Text('Şahıs Hattı'),
                          ),
                          DropdownMenuItem(
                            value: 'Yönetici Hattı',
                            child: Text('Yönetici Hattı'),
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
                      child: TextFormField(
                        decoration: InputDecoration(
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
                              _selectedDate = pickedDate;
                            });
                          }
                        },
                        controller: TextEditingController(
                          text: _selectedDate == null
                              ? ''
                              : _selectedDate
                                  ?.toLocal()
                                  .toString()
                                  .split(' ')[0],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: TextFormField(
                        decoration: InputDecoration(
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
                              _selectedDate = pickedDate;
                            });
                          }
                        },
                        controller: TextEditingController(
                          text: _selectedDate == null
                              ? ''
                              : _selectedDate
                                  ?.toLocal()
                                  .toString()
                                  .split(' ')[0],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _controller1,
                                    decoration: InputDecoration(
                                      labelText: "Görüşülen Kişi",
                                      border: const OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Lütfen bir metin girin';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          16.0), // İki TextFormField arasında boşluk bırakır
                                  TextFormField(
                                    controller: _controller2,
                                    decoration: InputDecoration(
                                      labelText: "İlgilenen Kişi",
                                      border: const OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Lütfen bir metin girin';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Yeni DropdownButtonFormField ekleniyor
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Aktarılan Kişi',
                          border: OutlineInputBorder(),
                        ),
                        value: _selectedAdditionalOption,
                        items: const [
                          DropdownMenuItem(
                            value: 'Ahmet',
                            child: Text('Ahmet'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedAdditionalOption = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller3,
                              decoration: InputDecoration(
                                labelText: "Açıklama",
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Dört buton ekleme
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Expanded(
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     child: Text('Yeni'),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Color.fromARGB(255, 224, 224, 203),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(width: deviceWidth / 100),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 224, 224, 203),
                        ),
                        child: const Text(
                          'Kaydet',
                          style: TextStyle(fontSize: 12.14),
                        ),
                      ),
                    ),
                    SizedBox(width: deviceWidth / 100),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 224, 224, 203),
                        ),
                        child: const Text('Sil'),
                      ),
                    ),
                    SizedBox(width: deviceWidth / 100),
                    // Expanded(
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //     },
                    //     child: Text('Kapat'),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Color.fromARGB(255, 224, 224, 203),
                    //     ),
                    //   ),
                    // ),
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
