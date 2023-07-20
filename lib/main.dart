import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_switcher_riverpod/app_theme.dart';
import 'package:theme_switcher_riverpod/theme_provider.dart';

// void main() {
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }

// //App Theming with Change Notifier Provider
// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final appThemeMode = ref.watch(appThemeChangeNotifierProvider);
//     return MaterialApp(
//       title: 'Riverpod theme Demo',
//       //specifies the current theme of the App
//       theme: AppTheme.lightTheme,
//       //setting 'darkTheme' helps enable system dark mode
//       darkTheme: AppTheme.darkTheme,
//       themeMode:
//           appThemeMode.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
//       home: const MyHomePage(title: 'Riverpod theme Demo'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//       body: const Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Expanded(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Light Mode'),
//                 DarkModeSwitch(),
//                 Text('Dark Mode'),
//               ],
//             ),
//           ),
//           //
//         ],
//       ),
//     );
//   }
// }

// class DarkModeSwitch extends ConsumerWidget {
//   const DarkModeSwitch({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final switchThemeMode = ref.watch(appThemeChangeNotifierProvider);
//     return Switch(
//       //value:ref.watch(appThemeChangeNotifierProvider.notifier).isDarkModeEnabled,
//       value: switchThemeMode.isDarkModeEnabled,
//       onChanged: (bool enabled) {
//         if (enabled) {
//           switchThemeMode.setDarkTheme();
//         } else {
//           switchThemeMode.setLightTheme();
//         }
//       },
//     );
//   }
// }

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

//App Theming with State Notifier Provider
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeMode = ref.watch(appThemeStateNotifierProvider.notifier);
    return MaterialApp(
      title: 'Riverpod theme Demo',
      theme: ref.watch(appThemeStateNotifierProvider),
      //setting 'darkTheme' helps enable system dark mode
      //darkTheme: AppTheme.darkTheme,
      //themeMode: appThemeMode!.state ? ThemeMode.dark : ThemeMode.light,
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
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer(builder: (context, ref, child) {
            return ElevatedButton(
              onPressed: () {
                final themeMode =ref.watch(appThemeStateNotifierProvider);
                themeMode.toggleTheme();
              },
              child: Text('Toggle Team'),
            );
          }
              //child:
              ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Light Mode'),
                DarkModeSwitch(),
                Text('Dark Mode'),
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
    final switchThemeMode = ref.watch(appThemeStateNotifierProvider);
    return Switch(
      //value:ref.watch(appThemeChangeNotifierProvider.notifier).isDarkModeEnabled,
      value: switchThemeMode.,
      onChanged: (bool enabled) {
        if (enabled) {
          switchThemeMode.setDarkTheme();
        } else {
          switchThemeMode.setLightTheme();
        }
      },
    );
  }
}
