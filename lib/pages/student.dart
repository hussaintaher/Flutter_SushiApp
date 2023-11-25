import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

// import '../firebase_options.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {

  // collection reference from firebase 
  CollectionReference students =
      FirebaseFirestore.instance.collection('students');

  // properities of _StudentState class
  String? studentName;
  String? studentID;
  String? studentProgramID;
  double? studentGPA;

  // handler methods of _StudentState class
  handleStudentName(name) {
    this.studentName = name;
  }

  handleStudentID(id) {
    this.studentID = id;
  }

  handleStudentProgramID(programID) {
    this.studentProgramID = programID;
  }

  handleStudentGPA(gpa) {
    this.studentGPA = double.parse(gpa);
  }

  // createStudent onPress create button 
  createStudent() {
    Map<String, dynamic> studentsInfo = {
      "studentName": studentName,
      "studentProgramID": studentProgramID,
      "studentID": studentID,
      "studentGPA": studentGPA,
    };

    students
        .doc(studentName)
        .set(studentsInfo)
        .then((value) => print('User added'))
        .catchError((error) => print("Failed to add user: $error"));
  }
  // getStudent onPress Get button (for console only)
  getStudent() {
    students.doc(studentName).get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data['studentName']);
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
  // updateStudent onPress Update button 
  updateStudent() {
    final washingtonRef = students.doc(studentName);
    washingtonRef.update({
      "studentName": studentName,
      "studentID": studentID,
      "studentProgramID": studentProgramID,
      "studentGPA": studentGPA
    }).then((value) => print("DocumentSnapshot successfully updated!:"),
        onError: (e) => print("Error updating document $e"));
  }
  // deleteStudent onPress Delete button 
  deleteStudent() {
    students.doc(studentName).delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter College'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                  onChanged: (String name) {
                    handleStudentName(name);
                  },
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Write Your Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                  onChanged: (String id) {
                    handleStudentID(id);
                  },
                  decoration: InputDecoration(
                      labelText: 'Student ID',
                      hintText: 'Write Your id',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                  onChanged: (String programID) {
                    handleStudentProgramID(programID);
                  },
                  decoration: InputDecoration(
                      labelText: 'Program ID',
                      hintText: 'Write Your Study Program ID',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                  onChanged: (String gpa) {
                    handleStudentGPA(gpa);
                  },
                  decoration: InputDecoration(
                      labelText: 'Student GPA',
                      hintText: 'Write Your GPA',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        createStudent();
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 50),
                          backgroundColor:
                              const Color.fromARGB(255, 237, 215, 13)),
                      child: const Text('Create')),
                  ElevatedButton(
                      onPressed: () {
                        updateStudent();
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 50),
                          backgroundColor: Colors.green),
                      child: const Text('Update')),
                  ElevatedButton(
                      onPressed: () {
                        deleteStudent();
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 50),
                          backgroundColor: Colors.red),
                      child: const Text('Delete')),
                  ElevatedButton(
                      onPressed: () {
                        getStudent();
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 50),
                          backgroundColor: Colors.orange),
                      child: const Text('Get')),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: students.snapshots(),
              builder: (context, snapshot) {
                List<Row> clientWidgets = [];

                if (snapshot.hasData) {
                  final studentsData = snapshot.data?.docs.reversed.toList();
                  for (var client in studentsData!) {
                    final studentWidget = Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text('name: ${client['studentName']} - ${client['studentID']}'),
                            subtitle: Text(client['studentProgramID']),
                            trailing: Text('GPA: ${client['studentGPA'].toString()}'),
                            leading: Icon(Icons.school),
                          ),
                        ),
                      ],
                    );
                    clientWidgets.add(studentWidget);
                  }
                }

                return Expanded(
                  child: ListView(
                    children: clientWidgets,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
