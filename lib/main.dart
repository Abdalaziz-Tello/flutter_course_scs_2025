// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cloudflare/cloudflare.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:studnet_app/model/class_model.dart';
import 'package:studnet_app/model/parent_model.dart';
import 'package:studnet_app/model/student_model.dart';
import 'package:studnet_app/service/classes_service.dart';
import 'package:studnet_app/service/parent_serivce.dart';
import 'package:studnet_app/service/student_service.dart';

class A {
  String name;
  A({required this.name});

  @override
  bool operator ==(covariant A other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

void main() {
  A a = A(name: 'John');
  print(a.name);
  A b = A(name: 'John');

  print(b.name);

  print(a == b);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: CreateStudentPage()));
  }
}

class CreateStudentPage extends StatefulWidget {
  CreateStudentPage({super.key});

  @override
  State<CreateStudentPage> createState() => _CreateStudentPageState();
}

class _CreateStudentPageState extends State<CreateStudentPage> {
  File? file;

  TextEditingController nameController = TextEditingController();

  TextEditingController feesController = TextEditingController();

  ClassModel? classId;
String url ="";
  ParentModel? parentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Create Student'),
          InkWell(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.image,
              );
              if (result != null) {
                print(result.files.first.path);
                file = File(result.files.first.path!);
              }
              // Cloudflare cloudflare = Cloudflare(
              //   token: 'otF_zxduzdEKXTAgazMVX_AUWBQqafWPToVruXSy',
              //   accountId: 'a7b05e4c788b454f751612aa213677ed',
              // );
              // await cloudflare.init();
              // CloudflareHTTPResponse<CloudflareImage?> responseFromFile =
              //     await cloudflare.imageAPI.upload(
              //       contentFromFile: DataTransmit<File>(
              //         data: file!,
              //         progressCallback: (count, total) {
              //           print('Upload progress: $count/$total');
              //         },
              //       ),
              //     );
              // print(responseFromFile.body?.filename);
              // url = responseFromFile.body?.filename ?? "";
              setState(() {});
            },
            child: CircleAvatar(
              backgroundImage: file != null ? FileImage(file!) : null,

              radius: 50,
              child: Icon(Icons.person),
            ),
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          FutureBuilder(
            future: ClassesService().getClasses(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButton(
                  value: classId,
                  items: snapshot.data
                      ?.map(
                        (e) => DropdownMenuItem(value: e, child: Text(e.name)),
                      )
                      .toList(),
                  onChanged: (value) {
                    print(value!.name);
                    setState(() {
                      classId = value;
                    });
                  },
                );
              }
              return CircularProgressIndicator();
            },
          ),
          FutureBuilder(
            future: ParentService().getParents(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButton(
                  value: parentId,
                  items: snapshot.data
                      ?.map(
                        (e) =>
                            DropdownMenuItem(value: e, child: Text(e.username)),
                      )
                      .toList(),
                  onChanged: (value) {
                    print(value!.username);
                    setState(() {
                      parentId = value;
                    });
                  },
                );
              }
              return CircularProgressIndicator();
            },
          ),
          TextField(
            controller: feesController,
            decoration: InputDecoration(labelText: 'Fees'),
          ),
          ElevatedButton(
            onPressed: () async {
              StudentModel student = StudentModel(
                name: nameController.text,
                class_id: classId!.id,
                parent_id: parentId!.id,
                profile_picture: url,
                fees: num.parse(feesController.text),
              );
              bool status = await StudentService().createStudent(student);
              if (status) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Student created successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Student creation failed'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text('Create'),
          ),
        ],
      ),
    );
  }
}
