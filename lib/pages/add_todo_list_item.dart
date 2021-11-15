import 'package:flutter/material.dart';

class AddTodoListItemPage extends StatefulWidget {
  @override
  _AddTodoListItemPageState createState() => _AddTodoListItemPageState();
}

class _AddTodoListItemPageState extends State<AddTodoListItemPage> {
  final _ItemController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 26),
                  child: TextField(
                    controller: _ItemController,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Todo item",
                      labelStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: 15,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 20,
            left: 24,
            right:24,
            child: InkWell(
              onTap: () {
                if(_ItemController.text != ""){
                  Navigator.of(context).pop(_ItemController.text);
                } else {
                  Navigator.pop(context);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(32),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 00, vertical: 16),
                margin: EdgeInsets.only(top: 26),
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
