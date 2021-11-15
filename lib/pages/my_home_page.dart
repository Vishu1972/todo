import 'package:flutter/material.dart';
import 'package:todo_app/pages/add_todo_list_item.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List todoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(
              height: 20,
            ),

            todoList.length > 0
            ? ListView.builder(
                itemCount: todoList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return(
                      Container(
                        margin: EdgeInsets.only(left: 16,right: 16,bottom: 16),
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white
                        ),
                        child: Container(
                          child: Text(
                            '${index+1}. ${todoList[index]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black
                            ),
                          )
                        ),
                      )
                  );
                }
            )
            : Container(
              margin: EdgeInsets.only(top: 150),
              child: Center(
                child: Text(
                  'No todo list found.'
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddTodoListItemPage()
            )
          ).then((result){
            if(result != null) {
              setState(() {
                todoList.add(result);
              });
            }
          });
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}