import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ArabicMagicSquaresApp());
}

class ArabicMagicSquaresApp extends StatelessWidget {
  const ArabicMagicSquaresApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arabic Magic Squares',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Arial',
        // Added global AppBar theme so title text and icons are white across app:
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
          iconTheme: IconThemeData(color: Colors.white),
          // Note: individual AppBar backgroundColor properties will still override background if set directly.
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MenuPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Octa Solutions',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontFamily: 'Arial',
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3), // Pale brown
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Arabic Magic Squares',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D4037), // Deep brown
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 250,
                child: Column(
                  children: [
                    // Get Started Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const InputPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 8,
                        shadowColor: Colors.green.withOpacity(0.5),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // How It Works Button
                    _buildMenuButton('How It Works', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HowItWorksPage()),
                      );
                    }),
                    const SizedBox(height: 20),
                    // About Magic Squares Button
                    _buildMenuButton('About Magic Squares', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AboutMagicSquaresPage()),
                      );
                    }),
                    const SizedBox(height: 20),
                    // Get Interactive Button
                    _buildMenuButton('Get Interactive', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GetInteractivePage()),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5D4037), // Deep brown
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24), // slightly reduced horizontal padding so labels fit
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
        maxLines: 1, // ensure labels don't wrap to multiple lines
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3),
      appBar: AppBar(
        title: const Text('Input Method'),
        backgroundColor: const Color(0xFF5D4037),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose Input Method',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF5D4037)),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 280,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EnterValuePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Enter Value',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EnterArabicTextPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5D4037),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Enter/Paste Arabic Text',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EnterValuePage extends StatefulWidget {
  const EnterValuePage({super.key});

  @override
  State<EnterValuePage> createState() => _EnterValuePageState();
}

class _EnterValuePageState extends State<EnterValuePage> {
  final TextEditingController _valueController = TextEditingController();
  String _displayValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3),
      appBar: AppBar(
        title: const Text('Enter Value'),
        backgroundColor: const Color(0xFF5D4037),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your value (up to 9 digits)',
              style: TextStyle(fontSize: 18, color: Color(0xFF5D4037)),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _valueController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 9,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter number value',
              ),
              onChanged: (value) {
                setState(() {
                  _displayValue = value;
                });
              },
            ),
            const SizedBox(height: 20),
            if (_displayValue.isNotEmpty) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _displayValue,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
            ],
            ElevatedButton(
              onPressed: _displayValue.isNotEmpty ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MagicSquareOrderPage(value: int.parse(_displayValue)),
                  ),
                );
              } : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Done', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class EnterArabicTextPage extends StatefulWidget {
  const EnterArabicTextPage({super.key});

  @override
  State<EnterArabicTextPage> createState() => _EnterArabicTextPageState();
}

class _EnterArabicTextPageState extends State<EnterArabicTextPage> {
  final TextEditingController _textController = TextEditingController();
  int _calculatedValue = 0;

  final Map<String, int> _abjadValues = {
    'ا': 1, 'ب': 2, 'ج': 3, 'د': 4, 'ه': 5, 'و': 6, 'ز': 7, 'ح': 8,
    'ط': 9, 'ي': 10, 'ك': 20, 'ل': 30, 'م': 40, 'ن': 50, 'س': 60, 'ع': 70,
    'ف': 80, 'ص': 90, 'ق': 100, 'ر': 200, 'ش': 300, 'ت': 400, 'ث': 500,
    'خ': 600, 'ذ': 700, 'ض': 800, 'ظ': 900, 'غ': 1000, 'ة': 5, 'ء': 1, 'ى' : 10, 'ئ': 10, 'ؤ': 6
  };

  final List<List<String>> _keyboardLayout = [
    ['ا', 'ب', 'ت', 'ث', 'ج', 'ح', 'خ'],
    ['د', 'ذ', 'ر', 'ز', 'س', 'ش', 'ص'],
    ['ض', 'ط', 'ظ', 'ع', 'غ', 'ف', 'ق'],
    ['ك', 'ل', 'م', 'ن', 'ه', 'و', 'ي'],
    ['ة', 'ء', 'ؤ', 'ى', 'ئ', ' ', '⌫'], // Space and backspace
  ];

  void _calculateValue() {
    String text = _textController.text;
    int total = 0;
    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      if (_abjadValues.containsKey(char)) {
        total += _abjadValues[char]!;
      }
    }
    setState(() {
      _calculatedValue = total;
    });
  }

  void _onKeyPressed(String key) {
    if (key == '⌫') {
      if (_textController.text.isNotEmpty) {
        _textController.text = _textController.text.substring(0, _textController.text.length - 1);
      }
    } else if (key == ' ') {
      _textController.text += ' ';
    } else {
      _textController.text += key;
    }
    _calculateValue();
  }

  void _pasteText() async {
    final clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData != null && clipboardData.text != null) {
      _textController.text = clipboardData.text!;
      _calculateValue();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3),
      appBar: AppBar(
        title: const Text('Enter Arabic Text'),
        backgroundColor: const Color(0xFF5D4037),
        actions: [
          IconButton(
            icon: const Icon(Icons.paste),
            onPressed: _pasteText,
            tooltip: 'Paste Arabic Text',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Make the content scroll if screen is small
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'Enter or paste Arabic text',
                    style: TextStyle(fontSize: 18, color: Color(0xFF5D4037)),
                  ),
                  const SizedBox(height: 20),
                  // Increased visible size of text field (fixed-height box)
                  SizedBox(
                    height: 200, // larger visible area for typing/pasting text
                    child: TextField(
                      controller: _textController,
                      maxLines: null,
                      expands: false,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'اكتب النص العربي هنا',
                        hintTextDirection: TextDirection.rtl,
                      ),
                      onChanged: (value) => _calculateValue(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Reduced size of calculated value box
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 160,
                      constraints: const BoxConstraints(
                        minHeight: 70,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$_calculatedValue',
                            style: const TextStyle(fontSize: 20, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Arabic Keyboard
            SizedBox(
              // give keyboard a constrained height so it fits well on phones
              height: 160,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF5D4037)),
                ),
                child: Column(
                  children: _keyboardLayout.map((row) {
                    return Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: row.map((key) {
                          return Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(2),
                              child: ElevatedButton(
                                onPressed: () => _onKeyPressed(key),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: key == '⌫'
                                      ? const Color(0xFF5D4037)
                                      : Colors.green,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 8), // reduced padding for better fit
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  key,
                                  style: TextStyle(
                                    fontSize: key == '⌫' ? 16 : 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _calculatedValue > 0 ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MagicSquareOrderPage(value: _calculatedValue),
                  ),
                );
              } : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Done', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class MagicSquareOrderPage extends StatefulWidget {
  final int value;
  const MagicSquareOrderPage({super.key, required this.value});

  @override
  State<MagicSquareOrderPage> createState() => _MagicSquareOrderPageState();
}

class _MagicSquareOrderPageState extends State<MagicSquareOrderPage> {
  String? _selectedSquareType;
  bool _is4x4Selected = false;
  bool _is3x3Selected = false;

  final List<String> _4x4Options = [
    '4x4 Fire square (Default)',
    '4x4 Air Square',
    '4x4 Water Square',
    '4x4 Earth Square'
  ];

  final List<String> _3x3Options = [
    '3x3 Fire Square (Default)',
    '3x3 Air Square',
    '3x3 Water Square',
    '3x3 Earth square',
    '3x3 Hollow Square'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3),
      appBar: AppBar(
        title: const Text('Select Magic Square Type'),
        backgroundColor: const Color(0xFF5D4037),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Original Value: ${widget.value}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Select Square Type:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF5D4037)),
            ),
            const SizedBox(height: 20),
            // 4x4 Selection
            ListTile(
              title: const Text('4x4 Magic Squares', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              leading: Radio<bool>(
                value: true,
                groupValue: _is4x4Selected,
                onChanged: (value) {
                  setState(() {
                    _is4x4Selected = true;
                    _is3x3Selected = false;
                    _selectedSquareType = _4x4Options.first;
                  });
                },
              ),
            ),
            if (_is4x4Selected) ...[
              DropdownButton<String>(
                value: _selectedSquareType,
                isExpanded: true,
                items: _4x4Options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSquareType = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
            ],
            // 3x3 Selection
            ListTile(
              title: const Text('3x3 Magic Squares', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              leading: Radio<bool>(
                value: true,
                groupValue: _is3x3Selected,
                onChanged: (value) {
                  setState(() {
                    _is3x3Selected = true;
                    _is4x4Selected = false;
                    _selectedSquareType = _3x3Options.first;
                  });
                },
              ),
            ),
            if (_is3x3Selected) ...[
              DropdownButton<String>(
                value: _selectedSquareType,
                isExpanded: true,
                items: _3x3Options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSquareType = newValue;
                  });
                },
              ),
            ],
            const Spacer(),
            ElevatedButton(
              onPressed: _selectedSquareType != null ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      value: widget.value,
                      squareType: _selectedSquareType!,
                    ),
                  ),
                );
              } : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Get Square', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatefulWidget {
  final int value;
  final String squareType;
  const ResultPage({super.key, required this.value, required this.squareType});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late List<List<String>> _magicSquare;
  late List<List<String>> _arabicMagicSquare;

  @override
  void initState() {
    super.initState();
    _generateMagicSquare();
  }

  void _generateMagicSquare() {
    MagicSquareGenerator generator = MagicSquareGenerator();
    if (widget.squareType.contains('4x4')) {
      if (widget.squareType.contains('Fire')) {
        _magicSquare = generator.generate4x4FireSquare(widget.value);
      } else if (widget.squareType.contains('Air')) {
        _magicSquare = generator.generate4x4AirSquare(widget.value);
      } else if (widget.squareType.contains('Water')) {
        _magicSquare = generator.generate4x4WaterSquare(widget.value);
      } else if (widget.squareType.contains('Earth')) {
        _magicSquare = generator.generate4x4EarthSquare(widget.value);
      }
    } else if (widget.squareType.contains('3x3')) {
      if (widget.squareType.contains('Fire')) {
        _magicSquare = generator.generate3x3FireSquare(widget.value);
      } else if (widget.squareType.contains('Air')) {
        _magicSquare = generator.generate3x3AirSquare(widget.value);
      } else if (widget.squareType.contains('Water')) {
        _magicSquare = generator.generate3x3WaterSquare(widget.value);
      } else if (widget.squareType.contains('Earth')) {
        _magicSquare = generator.generate3x3EarthSquare(widget.value);
      } else if (widget.squareType.contains('Hollow')) {
        _magicSquare = generator.generate3x3HollowSquare(widget.value);
      }
    } else {
      _magicSquare = generator.generate3x3FireSquare(widget.value);
    }

    // Convert to Arabic numerals
    _arabicMagicSquare = _convertToArabicNumerals(_magicSquare);
  }

  List<List<String>> _convertToArabicNumerals(List<List<String>> square) {
    const Map<String, String> arabicNumerals = {
      '0': '٠', '1': '١', '2': '٢', '3': '٣', '4': '٤',
      '5': '٥', '6': '٦', '7': '٧', '8': '٨', '9': '٩'
    };

    List<List<String>> result = [];
    for (var row in square) {
      List<String> newRow = [];
      for (var cell in row) {
        String arabicNumber = '';
        for (int i = 0; i < cell.length; i++) {
          String digit = cell[i];
          arabicNumber += arabicNumerals[digit] ?? digit;
        }
        newRow.add(arabicNumber);
      }
      result.add(newRow);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3),
      appBar: AppBar(
        title: const Text('Magic Square Result'),
        backgroundColor: const Color(0xFF5D4037),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _shareResult,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Type: ${widget.squareType}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Value: ${widget.value}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Magic Square',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF5D4037),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildMagicSquareGrid(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5D4037),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Back'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MenuPage()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Home'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMagicSquareGrid() {
    // Find the base value (smallest value in the square)
    int baseValue = widget.value;
    for (var row in _magicSquare) {
      for (var cell in row) {
        if (cell.isNotEmpty) {
          int cellValue = int.tryParse(cell) ?? baseValue;
          if (cellValue < baseValue) {
            baseValue = cellValue;
          }
        }
      }
    }

    // Create a flattened list of all non-empty cells with their positions
    List<Map<String, dynamic>> cellData = [];
    for (int i = 0; i < _magicSquare.length; i++) {
      for (int j = 0; j < _magicSquare[i].length; j++) {
        if (_magicSquare[i][j].isNotEmpty) {
          cellData.add({
            'row': i,
            'col': j,
            'value': int.parse(_magicSquare[i][j]),
          });
        }
      }
    }

    // Sort cells by value to determine numbering order
    cellData.sort((a, b) => a['value'].compareTo(b['value']));

    // Assign numbers based on sorted order
    Map<String, int> cellNumbers = {};
    for (int i = 0; i < cellData.length; i++) {
      String key = '${cellData[i]['row']}-${cellData[i]['col']}';
      cellNumbers[key] = i + 1;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF5D4037)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: _magicSquare.asMap().entries.map((rowEntry) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: rowEntry.value.asMap().entries.map((cellEntry) {
              bool isEmpty = cellEntry.value.isEmpty;
              String cellKey = '${rowEntry.key}-${cellEntry.key}';
              int? cellNumber = cellNumbers[cellKey];
              
              return Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF5D4037)),
                  color: isEmpty ? const Color(0xFFF5E6D3) : Colors.white,
                ),
                child: Stack(
                  children: [
                    if (!isEmpty) ...[
                      // Content
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _arabicMagicSquare[rowEntry.key][cellEntry.key],
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              cellEntry.value,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      // Cell number in top right corner
                      if (cellNumber != null)
                        Positioned(
                          top: 4,
                          right: 4,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.8),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              cellNumber.toString(),
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ],
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }

  void _shareResult() {
    // Implement sharing functionality
    // This would typically use a package like share_plus
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sharing functionality would be implemented here')),
    );
  }
}

class HowItWorksPage extends StatelessWidget {
  const HowItWorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3),
      appBar: AppBar(
        title: const Text('How It Works'),
        backgroundColor: const Color(0xFF5D4037),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome! Here is a summary of what the app does and a few user guidelines.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF5D4037)),
            ),
            const SizedBox(height: 20),
            const Text(
              'What The App Does',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 10),
            const Text(
              'The Arabic Magic Square Maker is designed to create magic squares of different orders ranging from 4x4 to 3x3 squares. These squares hold significant importance in Islamic occult practices and hence scholars and practitioners spend valuable time creating them. With this app, a lot of time is saved and chances of miscalculation and input errors are drastically reduced.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),
            const Text(
              'Using The App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 10),
            const Text(
              'It simply takes input from you, calculates the value and then gives you an opportunity to choose the type of square you want to generate and you have it. Just follow the steps as outlined below:\n\n'
              '• Upon launching/opening the app, click on the Get Started button\n\n'
              '• Click on the Enter Value button if you have already calculated for the value. If not, click on the Enter/Paste Text button. In either instances you will be taken to a page where you will have the opportunity to either enter a number or paste/enter an Arabic text and then click Done.\n\n'
              '• Choose your preferred type of square on the next page. The results will be displayed shortly on another page.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutMagicSquaresPage extends StatelessWidget {
  const AboutMagicSquaresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3),
      appBar: AppBar(
        title: const Text('About Magic Squares'),
        backgroundColor: const Color(0xFF5D4037),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About Arabic Magic Squares',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF5D4037)),
            ),
            const SizedBox(height: 20),
            const Text(
              'An Arabic magic square (known as Wafq or Buduh square in Arabic tradition) is a grid of numbers arranged so that the sums of each row, column, and diagonal are all equal --- called the magic constant. The Arabic magic square is both a mathematical and mystical artefact, blending numerical harmony with spiritual symbolism, and played an important role in the development of Islamic numerology and art.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 15),
            const Text(
              'Arabic mathematicians such as Al-Buni (13th century) and Al-Kindi studied and used them extensively, connecting numbers with astrology, mysticism, and numerology.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 15),
            const Text(
              'The best-known Arabic Magic Square example is the Buduh square, a 4×4 magic square associated with talismans and Qur\'anic numerology.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),
            const Text(
              'Uses:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 10),
            const Text(
              '• Mathematical curiosity: Studied for their symmetrical and numerical properties.\n\n'
              '• Mystical and spiritual: Used in Islamic occult sciences (ʿIlm al-huruf) for making amulets, talismans, charms, believed to bring protection, luck or healing.\n\n'
              '• Astrological and symbolic: Linked with planetary influences (each planet is associated with a specific magic square size).\n\n'
              '• Art and architecture: Found in Islamic geometric designs, manuscripts, and inscriptions.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),
            const Text(
              'Selecting the Magic Square Order/Type',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 10),
            const Text(
              'There are three considerations to make when selecting the order/type of magic square to construct (i.e. Fire, Air, Water and Earth):',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 10),
            const Text(
              '1. Considering the first letter of the Arabic text (Name, verse etc.). If the name or verse starts with \'Alif\', then it\'s considered a fire element and for that matter the fire magic square is constructed. If it starts with \'Ba\', it is considered as Air. If it is \'Jim\' it is considered Water and if it starts with \'Dal\' then its considered Earth.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 10),
            const Text(
              '2. By considering the nature of the Aamal (Work) you are performing. If the square to be constructed is for the purpose of love and personal relations, then the scholars relate it to Air. If it\'s about personal growth and leadership, they relate it Fire. If about health, they consider it to be related to water. And if related to farming or livelihood they consider it to be of the Earth order.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 10),
            const Text(
              '3. The last option is by calculating for the total Abjad value of the Arabic text (Name, verse etc.) and dividing the result by 4. If there is no remainder, then an Earth Magic square is constructed. If there is a remainder of 1, a fire square is considered. If there is a remainder of 2, an Air square is constructed. Finally, if there is a remainder of 3, then Water magic Square is constructed.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

class GetInteractivePage extends StatelessWidget {
  const GetInteractivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3),
      appBar: AppBar(
        title: const Text('Get Interactive'),
        backgroundColor: const Color(0xFF5D4037),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Thanks for using this app. All enquiries, comments and suggestions are welcome via:',
              style: TextStyle(fontSize: 18, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            _buildContactItem('WhatsApp:', '+233545284558 or +233203868727'),
            const SizedBox(height: 20),
            _buildContactItem('Email:', 'octasolutionsgh@gmail.com'),
            const SizedBox(height: 30),
            const Text(
              'We count on your feedback to improve the quality of our products and services.',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Best regards!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF5D4037)),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontSize: 16, color: Colors.green),
        ),
      ],
    );
  }
}

class MagicSquareGenerator {
  List<List<String>> generate3x3FireSquare(int originalValue) {
    List<int> values = _calculate3x3Values(originalValue);
    // Fire square template mapping
    return [
      [values[5].toString(), values[0].toString(), values[7].toString()],
      [values[6].toString(), values[4].toString(), values[2].toString()],
      [values[1].toString(), values[8].toString(), values[3].toString()],
    ];
  }

  List<List<String>> generate3x3AirSquare(int originalValue) {
    List<int> values = _calculate3x3Values(originalValue);
    // Air square template mapping
    return [
      [values[1].toString(), values[6].toString(), values[5].toString()],
      [values[8].toString(), values[4].toString(), values[0].toString()],
      [values[3].toString(), values[2].toString(), values[7].toString()],
    ];
  }

  List<List<String>> generate3x3WaterSquare(int originalValue) {
    List<int> values = _calculate3x3Values(originalValue);
    // Water square template mapping
    return [
      [values[5].toString(), values[6].toString(), values[1].toString()],
      [values[0].toString(), values[4].toString(), values[8].toString()],
      [values[7].toString(), values[2].toString(), values[3].toString()],
    ];
  }

  List<List<String>> generate3x3EarthSquare(int originalValue) {
    List<int> values = _calculate3x3Values(originalValue);
    // Earth square template mapping
    return [
      [values[3].toString(), values[8].toString(), values[1].toString()],
      [values[2].toString(), values[4].toString(), values[6].toString()],
      [values[7].toString(), values[0].toString(), values[5].toString()],
    ];
  }

  List<List<String>> generate3x3HollowSquare(int originalValue) {
    List<int> values = _calculate3x3HollowValues(originalValue);
    // Hollow square template mapping (middle cell is empty)
    return [
      [values[2].toString(), values[7].toString(), values[0].toString()],
      [values[6].toString(), '', values[4].toString()],
      [values[1].toString(), values[3].toString(), values[5].toString()],
    ];
  }

  List<List<String>> generate4x4FireSquare(int originalValue) {
    List<int> values = _calculate4x4Values(originalValue);
    // Fire square template mapping
    return [
      [values[7].toString(), values[10].toString(), values[13].toString(), values[0].toString()],
      [values[12].toString(), values[1].toString(), values[6].toString(), values[11].toString()],
      [values[2].toString(), values[15].toString(), values[8].toString(), values[5].toString()],
      [values[9].toString(), values[4].toString(), values[3].toString(), values[14].toString()],
    ];
  }

  List<List<String>> generate4x4AirSquare(int originalValue) {
    List<int> values = _calculate4x4Values(originalValue);
    // Air square template mapping
    return [
      [values[9].toString(), values[14].toString(), values[3].toString(), values[4].toString()],
      [values[7].toString(), values[0].toString(), values[13].toString(), values[10].toString()],
      [values[12].toString(), values[11].toString(), values[6].toString(), values[1].toString()],
      [values[2].toString(), values[5].toString(), values[8].toString(), values[15].toString()],
    ];
  }

  List<List<String>> generate4x4WaterSquare(int originalValue) {
    List<int> values = _calculate4x4Values(originalValue);
    // Water square template mapping
    return [
      [values[5].toString(), values[8].toString(), values[15].toString(), values[2].toString()],
      [values[14].toString(), values[3].toString(), values[4].toString(), values[9].toString()],
      [values[0].toString(), values[13].toString(), values[10].toString(), values[7].toString()],
      [values[11].toString(), values[6].toString(), values[1].toString(), values[12].toString()],
    ];
  }

  List<List<String>> generate4x4EarthSquare(int originalValue) {
    List<int> values = _calculate4x4Values(originalValue);
    // Earth square template mapping
    return [
      [values[4].toString(), values[3].toString(), values[14].toString(), values[9].toString()],
      [values[15].toString(), values[8].toString(), values[5].toString(), values[2].toString()],
      [values[1].toString(), values[6].toString(), values[11].toString(), values[12].toString()],
      [values[10].toString(), values[13].toString(), values[0].toString(), values[7].toString()],
    ];
  }

  List<int> _calculate3x3Values(int originalValue) {
    int subtracted = originalValue - 12;
    int baseValue = subtracted ~/ 3;
    int remainder = subtracted % 3;
    List<int> values = List.generate(9, (index) => baseValue);
    if (remainder == 0) {
      for (int i = 1; i < 9; i++) {
        values[i] = values[i-1] + 1;
      }
    } else if (remainder == 1) {
      for (int i = 1; i < 6; i++) {
        values[i] = values[i-1] + 1;
      }
      values[6] = values[5] + 2;
      values[7] = values[6] + 1;
      values[8] = values[7] + 1;
    } else if (remainder == 2) {
      for (int i = 1; i < 3; i++) {
        values[i] = values[i-1] + 1;
      }
      values[3] = values[2] + 2;
      for (int i = 4; i < 9; i++) {
        values[i] = values[i-1] + 1;
      }
    }
    return values;
  }

  List<int> _calculate3x3HollowValues(int originalValue) {
    int baseValue = originalValue ~/ 12;
    int remainder = originalValue % 12;
    List<int> values = List.filled(8, baseValue);
    if (remainder == 0) {
      for (int i = 1; i < 8; i++) {
        values[i] = values[i-1] * (i + 1);
      }
    } else {
      values[1] = values[0] * 2;
      values[2] = values[0] + values[1];
      values[3] = values[0] + values[2];
      values[4] = values[0] + values[3];
      values[5] = values[0] + values[4] + remainder;
      values[6] = values[0] + values[5];
      values[7] = values[0] + values[6];
    }
    return values;
  }

  List<int> _calculate4x4Values(int originalValue) {
    int subtracted = originalValue - 30;
    int baseValue = subtracted ~/ 4;
    int remainder = subtracted % 4;
    List<int> values = List.generate(16, (index) => baseValue);
    if (remainder == 0) {
      for (int i = 1; i < 16; i++) {
        values[i] = values[i-1] + 1;
      }
    } else if (remainder == 1) {
      for (int i = 1; i < 12; i++) {
        values[i] = values[i-1] + 1;
      }
      values[12] = values[11] + 2;
      for (int i = 13; i < 16; i++) {
        values[i] = values[i-1] + 1;
      }
    } else if (remainder == 2) {
      for (int i = 1; i < 8; i++) {
        values[i] = values[i-1] + 1;
      }
      values[8] = values[7] + 2;
      for (int i = 9; i < 16; i++) {
        values[i] = values[i-1] + 1;
      }
    } else if (remainder == 3) {
      for (int i = 1; i < 4; i++) {
        values[i] = values[i-1] + 1;
      }
      values[4] = values[3] + 2;
      for (int i = 5; i < 16; i++) {
        values[i] = values[i-1] + 1;
      }
    }
    return values;
  }
}