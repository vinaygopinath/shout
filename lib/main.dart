import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(ShoutApp());
}

class ShoutApp extends StatelessWidget {
  const ShoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shout',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  double _fontSize = 700;
  static const double _minFontSize = 24;
  static const double _maxFontSize = 700;
  static const double _padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(_padding),
            child: TextField(
              controller: _textEditingController,
              focusNode: _focusNode,
              style: TextStyle(fontSize: _fontSize),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(border: InputBorder.none),
              onChanged: (_) => _adjustFontSize(constraints),
            ),
          );
        },
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  void _adjustFontSize(BoxConstraints constraints) {
    final text = _textEditingController.text;
    if (text.isEmpty) {
      setState(() => _fontSize = _maxFontSize);
      return;
    }

    double fontSize = _maxFontSize;

    while (fontSize > _minFontSize) {
      final textPainter = TextPainter(
        text: TextSpan(text: text, style: TextStyle(fontSize: fontSize)),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(maxWidth: constraints.maxWidth - (_padding * 2));

      if (textPainter.height <= constraints.maxHeight - (_padding * 2)) {
        break;
      }
      fontSize -= 10;
    }

    if (fontSize != _fontSize) {
      setState(() => _fontSize = fontSize.clamp(_minFontSize, _maxFontSize));
    }
  }

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
