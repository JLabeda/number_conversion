import 'package:flutter/material.dart';

class ConvertNumberScreen extends StatefulWidget {
  const ConvertNumberScreen({Key? key}) : super(key: key);

  @override
  _ConvertNumberScreenState createState() => _ConvertNumberScreenState();
}

class _ConvertNumberScreenState extends State<ConvertNumberScreen> {
  final _controller = TextEditingController();
  var _enteredNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
          onTap: () {
            print('Title clicked');
          },
          child: const Text(
            'Tap to reset',
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            child: Text(
              '*Numer to words*',
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 80,
            ),
            child: Card(
              shadowColor: Theme.of(context).primaryColor,
              elevation: 10,
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Enter Your number',
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onSubmitted: (value) {
                  _enteredNumber = int.parse(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
