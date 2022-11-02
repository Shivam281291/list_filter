import 'package:alobha_test/provider/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    FocusManager.instance.primaryFocus?.unfocus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('List Screen'),),
      body: ChangeNotifierProvider(
        create: (_) => ListProvider(),
        child: Consumer<ListProvider>(builder: (context, listProvider, _) {
          return listProvider.isLoading
              ? SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  )),
                )
              : SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: TextField(
                          onChanged: (value) {
                            Provider.of<ListProvider>(context,listen: false).filterResult(value);
                          },
                          onSubmitted: (value){
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          decoration: const InputDecoration(
                              labelText: "Search",
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 5,
                              margin: const EdgeInsets.all(5),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  children: [
                                    Text(listProvider.data[index].userName ?? ''),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(listProvider.data[index].facilities != null
                                        ? listProvider
                                        .data[index].facilities![0].facilityId
                                        .toString()
                                        : ''),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: listProvider.data.length,
                        ),
                      )
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
