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
  List<Map<String, String>> notes = [];
  List<Map<String, String>> completedNotes = [];
  bool isChecked = false;  // Checkbox durumu

  void addNote(Map<String, String> newNote) {
    setState(() {
      newNote['date'] = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
      notes.add(newNote);
      notes.sort((a, b) => compareImportance(a['importance'] ?? '', b['importance'] ?? ''));
    });
  }

  void updateNote(Map<String, String> updatedNote, int index) {
    setState(() {
      updatedNote['date'] = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
      notes[index] = updatedNote;
    });
  }

  void markAsCompleted(int index) {
    setState(() {
      Map<String, String> completedNote = notes.removeAt(index);
      completedNote['isCompleted'] = 'true';
      completedNotes.add(completedNote);
    });
  }

  int compareImportance(String a, String b) {
    const importanceLevels = {
      'Kritik': 0,
      'Çok': 1,
      'Uyarı': 2,
      'Bilgi': 3,
    };
    return (importanceLevels[a] ?? 4).compareTo(importanceLevels[b] ?? 4);
  }

  Color getColorForImportance(String importance) {
    switch (importance) {
      case 'Kritik':
        return const Color.fromARGB(255, 240, 3, 3);
      case 'Önemli':
        return Colors.orangeAccent;
      case 'Uyarı':
        return Colors.yellowAccent;
      case 'Bilgi':
        return const Color.fromARGB(255, 58, 176, 255);
      default:
        return Colors.white;
    }
  }

  Color getCompletedNoteColor() {
    return Colors.greenAccent;
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
          actions: [
            // AppBar'ın sağına Checkbox ekleniyor
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  const Text(
                    'Göster',
                    style: TextStyle(color: Colors.black),
                  ),
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;  // Checkbox durumu güncelleniyor
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              deviceWidth / 18, deviceHeight / 18, deviceWidth / 10, 0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
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
                                  note['title'] ?? '',
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
                                        note['person'] ?? '',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                      Text(
                                        note['date'] ?? '',
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
                                            initialNote: note,
                                          ),
                                        ),
                                      );
                                      if (result != null && result is Map<String, String>) {
                                        updateNote(result, index);
                                      }
                                    },
                                    child: const Text("Düzenleme"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      markAsCompleted(index);
                                    },
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
              // Checkbox işaretliyse tamamlanan notlar kısmı gösterilecek
              if (isChecked) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Tamamlanan Notlar",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: completedNotes.length,
                    itemBuilder: (context, index) {
                      final note = completedNotes[index];
                      final importance = note['importance'] ?? '';
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Card(
                          color: getCompletedNoteColor(),
                          elevation: 8,
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
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          note['person'] ?? '',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ),
                                        Text(
                                          note['date'] ?? '',
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
              ],
              Padding(
                padding: EdgeInsets.only(bottom: deviceHeight * 0.05),
                child: ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KayitEkleme8(title: "Yeni Not Ekle"),
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
