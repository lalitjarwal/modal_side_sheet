import 'package:flutter/material.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Side Sheet Demo'),
      ),
      body: Builder(
        builder: (context) {
          return BodyWithSideSheet(
            show: show,
            body: Container(
              color: Color(0xffececec),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Modal Side sheet Demo"),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          show = !show;
                        });
                      },
                      child: Text("Show Standard Side Sheet")),
                  ElevatedButton(
                      onPressed: () {
                        showModalSideSheet(
                            // width: 700,
                            context: context,
                            ignoreAppBar: false,
                            body: ListView.builder(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Icon(Icons.face),
                                  title: Text("I am on $index index"),
                                  trailing: Icon(Icons.safety_divider),
                                );
                              },
                            ));
                      },
                      child: Text("Show Modal Side Sheet")),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.face),
                          title: Text("I am on $index index"),
                          trailing: Icon(Icons.safety_divider),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            sheetWidth: MediaQuery.of(context).size.width / 4,
            sheetBody: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.face),
                  title: Text("I am on $index index"),
                  trailing: Icon(Icons.safety_divider),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
