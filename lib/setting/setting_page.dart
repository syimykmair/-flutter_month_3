import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeMode == ThemeMode.light ? ThemeData.light() : ThemeData.dark(),

      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text('Настройки'), centerTitle: true),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text(
                          themeMode == ThemeMode.dark
                              ? 'Темная тема'
                              : 'Светлая Тема',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Switch(
                          value: themeMode == ThemeMode.dark,
                          onChanged: (value) {
                            setState(() {
                              themeMode = value
                                  ? ThemeMode.dark
                                  : ThemeMode.light;
                            });
                          },
                        ),
                        ]
                      ),
                      SizedBox(height: 8),
                      Text(
                        themeMode == ThemeMode.dark
                            ? 'Использовать светлое\nОформление приложения'
                            : 'Использовать темное\nОформление приложения',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  
}
