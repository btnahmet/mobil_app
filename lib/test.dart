import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyFormPage(),
    );
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the TextFormFields
  final List<TextEditingController> _textControllers = List.generate(8, (index) => TextEditingController());

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
    'Text Field 1',
    'Text Field 2',
    'Text Field 3',
    'Text Field 4',
    'Text Field 5',
    'Text Field 6',
    'Text Field 7',
    'Text Field 8',
  ];

  final List<String> _dropdownButtonLabels = [
    'Dropdown 1',
    'Dropdown 2',
    'Dropdown 3',
    'Dropdown 4',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Form Example'),
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
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Selected Date ${i + 1}: ${_getDate(i)?.toLocal().toString().split(' ')[0] ?? 'No Date Selected'}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => _selectDate(context, i),
                              child: const Text('Select Date'),
                            ),
                          ],
                        ),
                      ),
                    // 4 DropdownButton Widgets
                    for (int i = 0; i < 4; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: DropdownButtonFormField<String>(
                          value: _getDropdownValue(i),
                          decoration: InputDecoration(
                            labelText: _dropdownButtonLabels[i],
                            border: const OutlineInputBorder(),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _setDropdownValue(i, newValue);
                            });
                          },
                          items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                              .map<DropdownMenuItem<String>>((String value) {
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
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text('First Button Pressed')));
                          }
                        },
                        child: const Text('First Button'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text('Second Button Pressed')));
                          }
                        },
                        child: const Text('Second Button'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _getDropdownValue(int index) {
    switch (index) {
      case 0:
        return _dropdownValue1;
      case 1:
        return _dropdownValue2;
      case 2:
        return _dropdownValue3;
      case 3:
        return _dropdownValue4;
      default:
        return null;
    }
  }

  void _setDropdownValue(int index, String? value) {
    switch (index) {
      case 0:
        _dropdownValue1 = value;
        break;
      case 1:
        _dropdownValue2 = value;
        break;
      case 2:
        _dropdownValue3 = value;
        break;
      case 3:
        _dropdownValue4 = value;
        break;
    }
  }
}
