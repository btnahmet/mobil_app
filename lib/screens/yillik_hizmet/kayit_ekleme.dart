import 'package:flutter/material.dart';

class KayitEkleme5 extends StatefulWidget {
  const KayitEkleme5({super.key, required this.title});
  final String title;

  @override
  State<KayitEkleme5> createState() => _KayitEkleme5State();
}

class _KayitEkleme5State extends State<KayitEkleme5> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the TextFormFields
  final List<TextEditingController> _textControllers =
      List.generate(8, (index) => TextEditingController());

  // Date variables
  DateTime? _selectedDate1;
  DateTime? _selectedDate2;
  DateTime? _selectedDate3;

  // Dropdown values
  String? _dropdownValue1;
  String? _dropdownValue2;
  String? _dropdownValue3;
  String? _dropdownValue4;

  // Label text arrays
  final List<String> _textFormFieldLabels = [
    'Fiş Numarası',
    'Cari Kodu',
    'Cari Ünvanı',
    'Tutar',
    'Alınan Tutar',
    'Kalan Tutar',
    'Teklif',
    'Açıklama',
  ];

  final List<String> _dropdownButtonLabels = [
    'Bakım Anlaşması',
    'Durum',
    'Görüşme Durum',
    'Ödeme Türü',
  ];

  final List<String> _selectDate2 = [
    'Kurulum Tarihi',
    'Tarih',
    'Bitiş Tarih',
  ];

  Future<void> _selectDate(BuildContext context, int dateIndex) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _getDate(dateIndex)) {
      setState(() {
        _setDate(dateIndex, picked);
      });
    }
  }

  DateTime? _getDate(int index) {
    switch (index) {
      case 0:
        return _selectedDate1;
      case 1:
        return _selectedDate2;
      case 2:
        return _selectedDate3;
      default:
        return null;
    }
  }

  void _setDate(int index, DateTime date) {
    switch (index) {
      case 0:
        _selectedDate1 = date;
        break;
      case 1:
        _selectedDate2 = date;
        break;
      case 2:
        _selectedDate3 = date;
        break;
    }
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
                      // 3 TextFormField Widgets
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextFormField(
                            controller: _textControllers[i],
                            decoration: InputDecoration(
                              labelText: _textFormFieldLabels[i],
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                      // 3 DatePicker Widgets
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      deviceWidth / 8, 0, 0, 0),
                                  child: Text(
                                    _selectDate2[i],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0, 0, deviceWidth / 7, 0),
                                child: ElevatedButton(
                                  onPressed: () => _selectDate(context, i),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 224, 224, 203),
                                  ),
                                  child: const Text('Tarih Seç'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      // 4 DropdownButton Widgets with different option counts
                      // Dropdown 1: 3 options
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: DropdownButtonFormField<String>(
                          value: _dropdownValue1,
                          decoration: InputDecoration(
                            labelText: _dropdownButtonLabels[0],
                            border: const OutlineInputBorder(),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _dropdownValue1 = newValue;
                            });
                          },
                          items: [
                            'Yeni Müşteri',
                            'Bakım Anlaşması Var',
                            'Servis Ücretli'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      // Dropdown 2: 4 options
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: DropdownButtonFormField<String>(
                          value: _dropdownValue2,
                          decoration: InputDecoration(
                            labelText: _dropdownButtonLabels[1],
                            border: const OutlineInputBorder(),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _dropdownValue2 = newValue;
                            });
                          },
                          items: [
                            'Hesap Kapandı',
                            'Hesap Kapanmadı',
                            'Parçalı',
                            'Bekelemede'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      // Dropdown 3: 2 options
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: DropdownButtonFormField<String>(
                          value: _dropdownValue3,
                          decoration: InputDecoration(
                            labelText: _dropdownButtonLabels[2],
                            border: const OutlineInputBorder(),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _dropdownValue3 = newValue;
                            });
                          },
                          items: ['Görüşüldü', 'Görüşülmedi']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      // Dropdown 4: 4 options
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: DropdownButtonFormField<String>(
                          value: _dropdownValue4,
                          decoration: InputDecoration(
                            labelText: _dropdownButtonLabels[3],
                            border: const OutlineInputBorder(),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _dropdownValue4 = newValue;
                            });
                          },
                          items: [
                            'Nakit',
                            'Kredi kartı',
                            'Havale',
                            'Mail Order'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      // 5 TextFormField Widgets
                      for (int i = 3; i < 8; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextFormField(
                            controller: _textControllers[i],
                            decoration: InputDecoration(
                              labelText: _textFormFieldLabels[i],
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                // Two Expanded Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('First Button Pressed'),
                            ),
                          );
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
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Second Button Pressed'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(deviceWidth / 2.5, 50),
                        backgroundColor:
                            const Color.fromARGB(255, 224, 224, 203),
                      ),
                      child: const Text('Sil'),
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
