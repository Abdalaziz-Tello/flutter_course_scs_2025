import 'package:flutter/material.dart';
import 'package:restfulapi_full_crud/service/product_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AllProductsPage());
  }
}

class ProductPage extends StatelessWidget {
   ProductPage({super.key,required this.id});
  String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getOneProduct(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
            return Center(
              child: ListTile(
                leading: CircleAvatar(child: Text(id),),
                trailing: IconButton(onPressed: (){
deleteOneProduct(id);
Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AllProductsPage(),));
                }, icon: Icon(Icons.delete)),
                title: Text(data['name'],style: TextStyle(fontSize: 32),),
                subtitle: Text(data['price'].toString()),
              ),
            );
          } else {
            return Center(child: LinearProgressIndicator());
          }
        },
      ),
    );
  }
}

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({super.key});

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAllProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> allProduct = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: allProduct.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ProductPage(id: allProduct[index]['id'],),));
                },
                title: Text(allProduct[index]['name']),
                subtitle: Text(allProduct[index]["price"].toString()),
              ),
            );
          } else {
            return Center(child: LinearProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => AddProductPage(),));
      }),
    );
  }
}


class AddProductPage extends StatelessWidget {
   AddProductPage({super.key});
TextEditingController name = TextEditingController();

TextEditingController price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: name,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: price,
              ),
            ),


          ],
        ),
        
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
await createNewProduct(reqData: 
{
  "name":name.text,
  "price":price.text
}

);
Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AllProductsPage(),));
      }),
    );
  }
}