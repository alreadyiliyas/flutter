import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testtask/screens/home/components/failed_page.dart';
class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  _UsersScreenState createState() => _UsersScreenState();
}


class _UsersScreenState extends State<UsersScreen>  {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  double _titleFontSize = 36.0;
  AlignmentGeometry _titleAlignment = Alignment.topLeft;
  List _users = [];


  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 0 && !_isScrolled) {
        setState(() {
          _titleFontSize = 18.0;
          _titleAlignment = Alignment.topCenter;
          _isScrolled = true;
        });
      } else if (_scrollController.offset <= 0 && _isScrolled) {
        setState(() {
          _titleFontSize = 28.0;
          _titleAlignment = Alignment.bottomLeft;
          _isScrolled = false;
        });
      }
    });
    _getUsers();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  Future<void> _getUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      setState(() {
        _users = jsonDecode(response.body);
      });
    } else {
      throw Exception('Fatal');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: AnimatedContainer(
              height: 40,
              duration: const Duration(milliseconds: 300),
              alignment: _titleAlignment,
              child: Text(
                'Пользователи',
                style: TextStyle(fontSize: _titleFontSize, color: Colors.black),
              ),
            ),
            centerTitle: true,
            pinned: true,
            floating: true,
            backgroundColor: Colors.white,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                var user = _users[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute
                          (builder: (context) => failed_page()
                        ),
                    );
                  },
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/pngegg.png'),
                    ),
                    title: Text(user['name'], style: TextStyle(fontSize: 20)),

                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user['email']),
                        Text('Surf', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                );
              },
              childCount: _users.length,
            ),
          ),
        ],
      ),
    );
  }
}
