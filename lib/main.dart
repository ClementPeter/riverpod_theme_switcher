import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_switcher_riverpod/app_theme.dart';
import 'package:theme_switcher_riverpod/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final appThemeState = ref.watch(appThemeChangeNotifierProvider);
    final appThemeMode = ref.watch(appThemeChangeNotifierProvider);
    return MaterialApp(
      title: 'Riverpod theme Demo',
      theme: AppTheme.lightTheme,
      //setting 'darkTheme' helps enable system dark mode
      darkTheme: AppTheme.darkTheme,
      themeMode:
          appThemeMode.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      // themeMode:appThemeState.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: const MyHomePage(title: 'Riverpod theme Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Light Mode'),
                DarkModeSwitch(),
                Text('Dark Mode')
              ],
            ),
          ),
          //
        ],
      ),
    );
  }
}

class DarkModeSwitch extends ConsumerWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switchThemeMode = ref.watch(appThemeChangeNotifierProvider.notifier);
    return Switch(
      // value: appThemeMode.isDarkModeEnabled,
      //value:          ref.watch(appThemeChangeNotifierProvider.notifier).isDarkModeEnabled,
      value: switchThemeMode.isDarkModeEnabled,
      onChanged: (bool enabled) {
        //setState()
        //appThemeMode = enabled as AppThemeState;
        if (enabled) {
          switchThemeMode.setDarkTheme();
        } else {
          switchThemeMode.setLightTheme();
        }
      },
    );
  }
}