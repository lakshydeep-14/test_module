import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

String status = 'Initial';

class CustomButton extends StatefulWidget {
  final String text;
  final String email;
  final String password;

  const CustomButton({
    required this.text, required this.email, required this.password,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          status = 'loading...';
        });
        var res=await Dio().get('https://dev.eshikshya.com.np/api/user/login',data: {
          'email':widget.email,
          'password':widget.password
        });
        if(res['']){setState(() {
          status = 'Loaded';
        });}
      },
      child: Text(widget.text),
    );
  }
}
