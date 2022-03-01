import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:to_do/urls.dart';

class UpdatePage extends StatefulWidget {
  final Client client;
  final int id;
  final String note;
  UpdatePage({
    Key? key,
    required this.client,
    required this.id,
    required this.note,
  }) : super(key: key);
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.note;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "changer ton notes"),
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
                widget.client
                    .put(updateUrl(widget.id), body: {'body': controller.text});
                Navigator.pop(context);
              },
              child: Text("update Note"),
            ),
          )
        ],
      ),
    );
  }
}
