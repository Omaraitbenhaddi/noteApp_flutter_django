import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:to_do/urls.dart';

class CreatePage extends StatefulWidget {
  final Client client;
  const CreatePage({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "enter ton notes"),
            controller: controller,
            maxLines: 10,
          ),
          Padding(padding: EdgeInsets.all(5)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(shape: StadiumBorder()),
              onPressed: () {
                widget.client.post(createUrl, body: {'body': controller.text});
                Navigator.pop(context);
              },
              child: Text("create Note"),
            ),
          )
        ],
      ),
    );
  }
}
