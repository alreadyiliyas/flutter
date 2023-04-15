import 'package:flutter/material.dart';

class failed_page extends StatelessWidget {
  const failed_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/warning.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 16),
          const Text(
            'Не удалось загрузить информацию',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF9B51E0),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 80,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Обновить',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      ),
    );
  }
}