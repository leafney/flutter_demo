import 'package:flutter/material.dart';
import 'package:flutter_demo/counter/counter.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('times:'),
            Consumer<Counter>(
              builder: (context, counter, child) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<Counter>(
          builder: (context, model, child) => FloatingActionButton(
                onPressed: model.increment,
                child: Icon(Icons.add),
              )),
    );
  }
}
