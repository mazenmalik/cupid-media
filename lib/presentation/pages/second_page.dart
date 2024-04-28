import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required this.country, required this.state});
  final String country;
  final String state;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CUPID MEDIA',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You submitted',
              style: TextStyle(fontSize: 25),
            ),
            Text('${widget.state}, ${widget.country}'),
          ],
        ),
      ),
    );
  }
}
