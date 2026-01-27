import 'package:flutter/material.dart';
import 'package:stateless_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

final materialTheme = MaterialTheme(appTextTheme);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple layout demo")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Employee Profile",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 12),
                      const CircleAvatar(
                        radius: 120.0,
                        backgroundImage: AssetImage("images/prison_mike.jpeg"),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Employee Name",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                LabelWidget(key, "Role", "Developer??"),
                LabelWidget(key, "Team", "Front-end Main Product"),
                LabelWidget(key, "Handle", "@NateAtNait"),
                LabelWidget(key, "Supervisor", "Sally Anne"),

                const SizedBox(height: 32),

                const ThemeShowcase(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LabelWidget extends StatelessWidget {
  final String title;
  final String value;

  const LabelWidget(Key? key, this.title, this.value) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "$title: ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        Text(value, style: TextStyle(fontSize: 20.0)),
      ],
    );
  }
}

class ThemeShowcase extends StatelessWidget {
  const ThemeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Theme Showcase', style: textTheme.titleLarge),
          const SizedBox(height: 16),

          // PRIMARY
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              //     color: scheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Primary / onPrimary',
              style: textTheme.bodyLarge?.copyWith(color: scheme.onPrimary),
            ),
          ),

          const SizedBox(height: 16),

          // PRIMARY CONTAINER
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'PrimaryContainer / onPrimaryContainer',
              style: textTheme.bodyLarge?.copyWith(
                color: scheme.onPrimaryContainer,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // SURFACE (Card)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Surface / onSurface (Card)',
                style: textTheme.bodyLarge,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // BUTTON
          ElevatedButton(onPressed: () {}, child: const Text('Primary Button')),
        ],
      ),
    );
  }
}
