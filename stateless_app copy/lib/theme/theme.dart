import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2e004f),
      surfaceTint: Color(0xff7e41af),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4c007d),
      onPrimaryContainer: Color(0xffbc7def),
      secondary: Color(0xff6d5480),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffebccff),
      onSecondaryContainer: Color(0xff6c537f),
      tertiary: Color(0xff3d002a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff620046),
      onTertiaryContainer: Color(0xffe272b4),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff7fd),
      onSurface: Color(0xff1e1a21),
      onSurfaceVariant: Color(0xff4c4451),
      outline: Color(0xff7e7482),
      outlineVariant: Color(0xffcfc2d3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f36),
      inversePrimary: Color(0xffe0b6ff),
      primaryFixed: Color(0xfff2daff),
      onPrimaryFixed: Color(0xff2e004e),
      primaryFixedDim: Color(0xffe0b6ff),
      onPrimaryFixedVariant: Color(0xff642695),
      secondaryFixed: Color(0xfff2daff),
      onSecondaryFixed: Color(0xff271139),
      secondaryFixedDim: Color(0xffdabbee),
      onSecondaryFixedVariant: Color(0xff553d67),
      tertiaryFixed: Color(0xffffd8e9),
      onTertiaryFixed: Color(0xff3c002a),
      tertiaryFixedDim: Color(0xffffaed8),
      onTertiaryFixedVariant: Color(0xff7e1f5d),
      surfaceDim: Color(0xffe1d7e1),
      surfaceBright: Color(0xfffff7fd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf1fb),
      surfaceContainer: Color(0xfff5ebf5),
      surfaceContainerHigh: Color(0xffefe5ef),
      surfaceContainerHighest: Color(0xffe9dfea),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2e004f),
      surfaceTint: Color(0xff7e41af),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4c007d),
      onPrimaryContainer: Color(0xffdbacff),
      secondary: Color(0xff432c55),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7d6390),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3d002a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff620046),
      onTertiaryContainer: Color(0xffffa2d4),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff7fd),
      onSurface: Color(0xff141016),
      onSurfaceVariant: Color(0xff3b3340),
      outline: Color(0xff584f5d),
      outlineVariant: Color(0xff736a78),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f36),
      inversePrimary: Color(0xffe0b6ff),
      primaryFixed: Color(0xff8d50bf),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff7336a4),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7d6390),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff634b76),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffae4786),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff902e6c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcdc4ce),
      surfaceBright: Color(0xfffff7fd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf1fb),
      surfaceContainer: Color(0xffefe5ef),
      surfaceContainerHigh: Color(0xffe3dae4),
      surfaceContainerHighest: Color(0xffd8cfd9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2e004f),
      surfaceTint: Color(0xff7e41af),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4c007d),
      onPrimaryContainer: Color(0xfff8e7ff),
      secondary: Color(0xff39224b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff573f6a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3d002a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff620046),
      onTertiaryContainer: Color(0xffffe6f0),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff7fd),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff312936),
      outlineVariant: Color(0xff4f4653),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f36),
      inversePrimary: Color(0xffe0b6ff),
      primaryFixed: Color(0xff672997),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff4e047f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff573f6a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff402952),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff822160),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff640348),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbfb6c0),
      surfaceBright: Color(0xfffff7fd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8eef8),
      surfaceContainer: Color(0xffe9dfea),
      surfaceContainerHigh: Color(0xffdbd1db),
      surfaceContainerHighest: Color(0xffcdc4ce),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe0b6ff),
      surfaceTint: Color(0xffe0b6ff),
      onPrimary: Color(0xff4c007c),
      primaryContainer: Color(0xff4c007d),
      onPrimaryContainer: Color(0xffbc7def),
      secondary: Color(0xffdabbee),
      onSecondary: Color(0xff3d274f),
      secondaryContainer: Color(0xff573f6a),
      onSecondaryContainer: Color(0xffcbaddf),
      tertiary: Color(0xffffaed8),
      onTertiary: Color(0xff610045),
      tertiaryContainer: Color(0xff620046),
      onTertiaryContainer: Color(0xffe272b4),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff161219),
      onSurface: Color(0xffe9dfea),
      onSurfaceVariant: Color(0xffcfc2d3),
      outline: Color(0xff988d9c),
      outlineVariant: Color(0xff4c4451),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9dfea),
      inversePrimary: Color(0xff7e41af),
      primaryFixed: Color(0xfff2daff),
      onPrimaryFixed: Color(0xff2e004e),
      primaryFixedDim: Color(0xffe0b6ff),
      onPrimaryFixedVariant: Color(0xff642695),
      secondaryFixed: Color(0xfff2daff),
      onSecondaryFixed: Color(0xff271139),
      secondaryFixedDim: Color(0xffdabbee),
      onSecondaryFixedVariant: Color(0xff553d67),
      tertiaryFixed: Color(0xffffd8e9),
      onTertiaryFixed: Color(0xff3c002a),
      tertiaryFixedDim: Color(0xffffaed8),
      onTertiaryFixedVariant: Color(0xff7e1f5d),
      surfaceDim: Color(0xff161219),
      surfaceBright: Color(0xff3d373f),
      surfaceContainerLowest: Color(0xff110d13),
      surfaceContainerLow: Color(0xff1e1a21),
      surfaceContainer: Color(0xff231e25),
      surfaceContainerHigh: Color(0xff2d2830),
      surfaceContainerHighest: Color(0xff38333b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffeed2ff),
      surfaceTint: Color(0xffe0b6ff),
      onPrimary: Color(0xff3c0065),
      primaryContainer: Color(0xffb475e6),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffeed2ff),
      onSecondary: Color(0xff321c44),
      secondaryContainer: Color(0xffa286b5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffcfe6),
      onTertiary: Color(0xff4e0037),
      tertiaryContainer: Color(0xffd96bab),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff161219),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe5d8e9),
      outline: Color(0xffbaaebe),
      outlineVariant: Color(0xff978d9c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9dfea),
      inversePrimary: Color(0xff652796),
      primaryFixed: Color(0xfff2daff),
      onPrimaryFixed: Color(0xff1f0037),
      primaryFixedDim: Color(0xffe0b6ff),
      onPrimaryFixedVariant: Color(0xff520c83),
      secondaryFixed: Color(0xfff2daff),
      onSecondaryFixed: Color(0xff1c062e),
      secondaryFixedDim: Color(0xffdabbee),
      onSecondaryFixedVariant: Color(0xff432c55),
      tertiaryFixed: Color(0xffffd8e9),
      onTertiaryFixed: Color(0xff29001c),
      tertiaryFixedDim: Color(0xffffaed8),
      onTertiaryFixedVariant: Color(0xff69084c),
      surfaceDim: Color(0xff161219),
      surfaceBright: Color(0xff48424b),
      surfaceContainerLowest: Color(0xff09060c),
      surfaceContainerLow: Color(0xff201c23),
      surfaceContainer: Color(0xff2b262d),
      surfaceContainerHigh: Color(0xff363138),
      surfaceContainerHighest: Color(0xff413c44),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffaebff),
      surfaceTint: Color(0xffe0b6ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffdeb1ff),
      onPrimaryContainer: Color(0xff16002a),
      secondary: Color(0xfffaebff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd6b7ea),
      onSecondaryContainer: Color(0xff160128),
      tertiary: Color(0xffffebf2),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffa8d6),
      onTertiaryContainer: Color(0xff1f0014),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff161219),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff9ecfd),
      outlineVariant: Color(0xffcbbfcf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9dfea),
      inversePrimary: Color(0xff652796),
      primaryFixed: Color(0xfff2daff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffe0b6ff),
      onPrimaryFixedVariant: Color(0xff1f0037),
      secondaryFixed: Color(0xfff2daff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffdabbee),
      onSecondaryFixedVariant: Color(0xff1c062e),
      tertiaryFixed: Color(0xffffd8e9),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffaed8),
      onTertiaryFixedVariant: Color(0xff29001c),
      surfaceDim: Color(0xff161219),
      surfaceBright: Color(0xff544e56),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff231e25),
      surfaceContainer: Color(0xff342f36),
      surfaceContainerHigh: Color(0xff3f3941),
      surfaceContainerHighest: Color(0xff4b454d),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

const appTextTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
  titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
  bodyMedium: TextStyle(fontSize: 14),
);
