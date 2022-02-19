import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/num_translation.dart';

class ConvertNumberScreen extends StatefulWidget {
  const ConvertNumberScreen({Key? key}) : super(key: key);

  @override
  _ConvertNumberScreenState createState() => _ConvertNumberScreenState();
}

class _ConvertNumberScreenState extends State<ConvertNumberScreen> {
  final _controller = TextEditingController();
  String _output = '*Numer to words*';
  int _enteredNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
          onTap: () {
            setState(() {
              _output = '*Number to words*';
              _controller.clear();
            });
            print('*RESET*');
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
              _output,
              textAlign: TextAlign.center,
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
                  setState(() {
                    _output =
                        Provider.of<NumTranslation>(context, listen: false)
                            .translate(_enteredNumber);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
