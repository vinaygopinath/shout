import 'package:auto_size_text_field/auto_size_text_field.dart';
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
  late TextEditingController _textEditingControllerOne;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Center(
          child: AutoSizeTextField(
              controller: _textEditingControllerOne,
              minFontSize: 24,
              autofocus: true,
              style: TextStyle(fontSize: 700),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              fullwidth: true,
              wrapWords: true,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(border: InputBorder.none),
            ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  @override
  void initState() {
    super.initState();
    _textEditingControllerOne = TextEditingController();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    _textEditingControllerOne.dispose();
    super.dispose();
  }
}
