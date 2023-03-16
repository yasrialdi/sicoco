import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'RepositoryLogin.dart';
import 'dataakun.dart';
import 'package:http/http.dart' as http;

class PageRegister extends StatefulWidget {
  const PageRegister({Key? key}) : super(key: key);

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  final formKey = GlobalKey<FormState>();

  bool isloading = false;
  bool _hide = true;
  bool _rehide = true;

  String? gender;

  RepositoryLogin repository = RepositoryLogin();
  final _nama = TextEditingController();
  final _nik = TextEditingController();
  final _opd = TextEditingController();
  final _jabatan = TextEditingController();
  final _jeniskelamiin = TextEditingController();
  final _tempatlahir = TextEditingController();
  final _tanggallahir = TextEditingController();

  DateTime selectedDate1 = DateTime.now();
  TextEditingController _dateController1 = TextEditingController();


  Future<Null> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate1 = picked;

      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Data Diri',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        // alignment: Alignment.bottomCenter,
        alignment: Alignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        controller: _nama,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Nama',
                          hintStyle:
                          TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.6),
                              width: 1,
                            ),
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'nama Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        controller: _nik,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'NIK',
                          hintStyle:
                          TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.6),
                              width: 1,
                            ),
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'nik Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        controller: _opd,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'OPD',
                          hintStyle:
                          TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.6),
                              width: 1,
                            ),
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'OPD Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        controller: _jabatan,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Jabatan',
                          hintStyle:
                          TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.6),
                              width: 1,
                            ),
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'jabatan Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 25,right: 25),
                  //   child: Container(
                  //     height: 45,
                  //     child: TextFormField(enabled: false,
                  //       decoration: InputDecoration(
                  //         fillColor: Colors.white,
                  //         filled: true,
                  //         hintText: 'Jenis Kelamin',
                  //         hintStyle:
                  //         TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(5),
                  //           borderSide: BorderSide(color: Colors.grey),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(5),
                  //           borderSide: BorderSide(
                  //             color: Colors.black.withOpacity(0.6),
                  //             width: 1,
                  //           ),
                  //         ),
                  //       ),
                  //       validator: (text) {
                  //         if (text == null || text.isEmpty) {
                  //           return 'Jenis Kelamin Kosong';
                  //         }
                  //         return null;
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Text("Jenis Kelamin"),
                  RadioListTile(
                    title: Text("Laki-laki"),
                    value: "Pria",
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    title: Text("Perempuan"),
                    value: "Wanita",
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        controller: _tempatlahir,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Tempat Lahir',
                          hintStyle:
                          TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.6),
                              width: 1,
                            ),
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'tempat lahir Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 25,right: 25),
                  //   child: Container(
                  //     height: 45,
                  //     child: TextFormField(
                  //       enabled: false,
                  //       controller: _tanggallahir,
                  //       decoration: InputDecoration(
                  //         fillColor: Colors.white,
                  //         filled: true,
                  //         hintText: 'Tanggal Lahir',
                  //         hintStyle:
                  //         TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(5),
                  //           borderSide: BorderSide(color: Colors.grey),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(5),
                  //           borderSide: BorderSide(
                  //             color: Colors.black.withOpacity(0.6),
                  //             width: 1,
                  //           ),
                  //         ),
                  //       ),
                  //       validator: (text) {
                  //         if (text == null || text.isEmpty) {
                  //           return 'Username/nama Kosong';
                  //         }
                  //         return null;
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Text("Tanggal Lahir"),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.calendar_today),
                        TextButton(
                          onPressed: () {
                            _selectDate1(context);
                          },
                          child: Text("${selectedDate1.day} - ${selectedDate1.month} - ${selectedDate1.year} ",
                            style: TextStyle(
                                fontFamily: "Ubuntu"
                            ),),),
                        SizedBox(width: 65),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isloading = true;
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PageDataAkun()));
                          setState(() {
                            isloading = false;
                          });
                        }
                      },
                      color: Colors.blue,
                      height: 45,
                      minWidth: 360,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: (isloading)
                          ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1.5,
                          ))
                          : const Text(
                        'SELANJUTNYA',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
