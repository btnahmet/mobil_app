import 'package:flutter/material.dart';

class KayitEkleme3 extends StatefulWidget {
  const KayitEkleme3({super.key, required this.title});
  final String title;

  @override
  State<KayitEkleme3> createState() => _KayitEkleme3State();
}

class _KayitEkleme3State extends State<KayitEkleme3> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers = [];
  final int _itemCount = 4; // Kaç tane TextFormField olduğunu belirler

  final List<String> _textValues = [
    "Fiş Numarası",
    "Cari Kodu",
    "Cari Ünvanı",
    "Bakım Anlaşması",
    "Durum",
    "Görüşme Durum",
  ];

  final List<String> _bottomTextLabels = [
    "İlgilenen Kişi",
    "Görüşülen Kişi",
    "Arıza Tespit",
    "Yapılan İşlemler",
  ]; // LabelText için kullanılacak string dizisi

  String? _selectedGIBDurum;
  DateTime? _selectedDate1;
  DateTime? _selectedDate2;

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      // İlk Liste: _textValues listesinden oluşturulan TextFormField'lar
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

                      // Dropdown ve diğer Form alanları
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
                              value: 'Normal',
                              child: Text('Normal'),
                            ),
                            DropdownMenuItem(
                              value: 'Devir',
                              child: Text('Devir'),
                            ),
                            DropdownMenuItem(
                              value: 'Tarih Aralığı',
                              child: Text('Tarih Aralığı'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedGIBDurum = value;
                            });
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                labelText: "Aktif İşlem",
                                border: OutlineInputBorder(),
                              ),
                            )),
                          ],
                        ),
                      ),
                      // Tarih Seç
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

                      // Aktif İşlem

                      // Sonuç
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Sonuç',
                            border: OutlineInputBorder(),
                          ),
                          value: _selectedGIBDurum,
                          items: const [
                            DropdownMenuItem(
                              value: 'Sonuçlandı',
                              child: Text('Sonuçlandı'),
                            ),
                            DropdownMenuItem(
                              value: 'Sonuçlandırılmadı',
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

                      // İkinci Liste: _controllers listesi üzerinden oluşturulan TextFormField'lar
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
                                },),);},),),],),),

                // Dört buton ekleme
                Row(
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
                        backgroundColor:
                            const Color.fromARGB(255, 224, 224, 203),
                      ),
                      child: const Text('Kaydet'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // İptal butonu işlemleri
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(deviceWidth / 2.5, 50),
                        backgroundColor:
                            const Color.fromARGB(255, 224, 224, 203),
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
