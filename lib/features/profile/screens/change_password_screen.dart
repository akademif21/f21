import 'package:f21_demo/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/custom_styles.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _passwordController1 = TextEditingController();
  final _passwordController2 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, viewportConstraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Şifreni Değiştir"),
        ),
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: viewportConstraints.maxHeight,
              maxWidth: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: "password_1",
                        obscureText: true,
                        controller: _passwordController1,
                        decoration: InputDecoration(
                          label: const Text("Yeni Şifreniz"),
                          hintText: "Yeni şifrenizi girin.",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15,
                          ),
                          fillColor: CustomStyles.fillColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        name: "password_2",
                        obscureText: true,
                        controller: _passwordController2,
                        decoration: InputDecoration(
                          label: const Text("Şifre Tekrar"),
                          hintText: "Yeni şifrenizi tekrar girin",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          fillColor: CustomStyles.fillColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                             if(_passwordController1.text == _passwordController2.text){
                               //TODO: Şifre değiştirme işlemi yapılmalı (firebase ile).
                               // TODO: İşlem başarılıysa snackbar göster.
                               context.pop();
                             }else{
                               showSnackBar(context, "Parolalar uyuşmuyor! Lütfen tekrar deneyiniz!");
                             }
                          },
                          child: const Text("Şifremi Değiştir"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
    );
  }
}