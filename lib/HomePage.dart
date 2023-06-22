import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            String str = "Result will be ";
            for (int i = 0; i < list.length; i += 2) {
              int num1 = list[i];
              int num2 = list[i + 1];
              str += "${num1 + num2}, ";
            }
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(str),
                  );
                });
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Submit",
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        list.clear();
                        for (int i = 1; i <= 100; i++) {
                          if (i % 2 == 0) {
                            list.add(i);
                          }
                        }
                        setState(() {});
                      },
                      child: const Text("Even"),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        list.clear();
                        for (int i = 1; i <= 100; i++) {
                          if (i % 2 != 0) {
                            list.add(i);
                          }
                        }
                        setState(() {});
                      },
                      child: const Text(
                        "Odd",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: const Icon(Icons.list),
                        title: Text(
                          "${list[index]}",
                          style: const TextStyle(fontSize: 16,color: Colors.black),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}