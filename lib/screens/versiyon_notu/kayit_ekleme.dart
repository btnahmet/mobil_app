import 'package:flutter/material.dart';

class KayitEkleme8 extends StatefulWidget {
  const KayitEkleme8({super.key, required this.title, this.initialNote});
  final String title;
  final Map<String, String>? initialNote; // Düzenleme için mevcut not bilgisi

  @override
  State<KayitEkleme8> createState() => _KayitEklemeState();
}

class _KayitEklemeState extends State<KayitEkleme8> {
  String? selectedValue;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController personController = TextEditingController();
  List<String> items = ['Önemsiz', 'Önemli', 'Çok Önemli', 'Kritik Önem!'];

  @override
  void initState() {
    super.initState();
    // Eğer initialNote ile veri gelirse, onları form alanlarına dolduruyoruz.
    if (widget.initialNote != null) {
      titleController.text = widget.initialNote!['title'] ?? '';
      contentController.text = widget.initialNote!['content'] ?? '';
      personController.text = widget.initialNote!['person'] ?? '';
      selectedValue = widget.initialNote!['importance'] ?? 'Önemsiz';
    }
  }

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
              fontSize: 24,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                  child: Text(
                    "Önem Derecesi",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
                      fontWeight: FontWeight.bold,
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
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Notu Ekleyen",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: TextFormField(
                    controller: personController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Notu Ekleyen...'),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(105, 20, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, {
                        'title': titleController.text,
                        'content': contentController.text,
                        'person': personController.text,
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
