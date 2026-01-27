import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4a47d4),
      surfaceTint: Color(0xff4c49d7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6362ef),
      onPrimaryContainer: Color(0xfffffbff),
      secondary: Color(0xff585992),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffbebeff),
      onSecondaryContainer: Color(0xff4b4b83),
      tertiary: Color(0xff6e42c5),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa278fd),
      onTertiaryContainer: Color(0xff35007f),
      error: Color.fromARGB(255, 206, 212, 32),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color.fromARGB(255, 190, 153, 219),
      onSurface: Color.fromARGB(255, 29, 35, 27),
      onSurfaceVariant: Color(0xff464554),
      outline: Color(0xff777586),
      outlineVariant: Color(0xffc7c4d7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff302f39),
      inversePrimary: Color(0xffc2c1ff),
      primaryFixed: Color(0xffe2dfff),
      onPrimaryFixed: Color(0xff0b006b),
      primaryFixedDim: Color(0xffc2c1ff),
      onPrimaryFixedVariant: Color(0xff332cbf),
      secondaryFixed: Color(0xffe2dfff),
      onSecondaryFixed: Color(0xff14134b),
      secondaryFixedDim: Color(0xffc2c1ff),
      onSecondaryFixedVariant: Color(0xff414179),
      tertiaryFixed: Color(0xffeaddff),
      onTertiaryFixed: Color(0xff24005b),
      tertiaryFixedDim: Color(0xffd1bcff),
      onTertiaryFixedVariant: Color(0xff5525ac),
      surfaceDim: Color(0xffdbd8e4),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f2fe),
      surfaceContainer: Color(0xfff0ecf8),
      surfaceContainerHigh: Color(0xffeae6f3),
      surfaceContainerHighest: Color(0xffe4e1ed),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1f0db0),
      surfaceTint: Color(0xff4c49d7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5c5ae6),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff303067),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6767a2),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff44049b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7d52d5),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff111018),
      onSurfaceVariant: Color(0xff353543),
      outline: Color(0xff525160),
      outlineVariant: Color(0xff6d6b7c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff302f39),
      inversePrimary: Color(0xffc2c1ff),
      primaryFixed: Color(0xff5c5ae6),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff423ecd),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6767a2),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4f4f88),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff7d52d5),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6437bb),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc8c5d1),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f2fe),
      surfaceContainer: Color(0xffeae6f3),
      surfaceContainerHigh: Color(0xffdedbe7),
      surfaceContainerHighest: Color(0xffd3d0dc),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff15009b),
      surfaceTint: Color(0xff4c49d7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff352fc1),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff26255c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff43437b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff380084),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5828af),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2b2b39),
      outlineVariant: Color(0xff484857),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff302f39),
      inversePrimary: Color(0xffc2c1ff),
      primaryFixed: Color(0xff352fc1),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff1a01ad),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff43437b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2c2c63),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5828af),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff400095),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbab7c3),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2effb),
      surfaceContainer: Color(0xffe4e1ed),
      surfaceContainerHigh: Color(0xffd6d3df),
      surfaceContainerHighest: Color(0xffc8c5d1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc2c1ff),
      surfaceTint: Color(0xffc2c1ff),
      onPrimary: Color(0xff1800a7),
      primaryContainer: Color(0xff8383ff),
      onPrimaryContainer: Color(0xff0b006c),
      secondary: Color(0xffc2c1ff),
      onSecondary: Color(0xff2a2a61),
      secondaryContainer: Color(0xff43437b),
      onSecondaryContainer: Color(0xffb3b2f3),
      tertiary: Color(0xffd1bcff),
      onTertiary: Color(0xff3d008f),
      tertiaryContainer: Color(0xffa278fd),
      onTertiaryContainer: Color(0xff35007f),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color.fromARGB(255, 49, 6, 60),
      onSurface: Color(0xffe4e1ed),
      onSurfaceVariant: Color(0xffc7c4d7),
      outline: Color(0xff918fa0),
      outlineVariant: Color(0xff464554),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e1ed),
      inversePrimary: Color(0xff4c49d7),
      primaryFixed: Color(0xffe2dfff),
      onPrimaryFixed: Color(0xff0b006b),
      primaryFixedDim: Color(0xffc2c1ff),
      onPrimaryFixedVariant: Color(0xff332cbf),
      secondaryFixed: Color(0xffe2dfff),
      onSecondaryFixed: Color(0xff14134b),
      secondaryFixedDim: Color(0xffc2c1ff),
      onSecondaryFixedVariant: Color(0xff414179),
      tertiaryFixed: Color(0xffeaddff),
      onTertiaryFixed: Color(0xff24005b),
      tertiaryFixedDim: Color(0xffd1bcff),
      onTertiaryFixedVariant: Color(0xff5525ac),
      surfaceDim: Color(0xff13131b),
      surfaceBright: Color(0xff393841),
      surfaceContainerLowest: Color(0xff0e0d15),
      surfaceContainerLow: Color(0xff1b1b23),
      surfaceContainer: Color(0xff1f1f27),
      surfaceContainerHigh: Color(0xff2a2932),
      surfaceContainerHighest: Color(0xff34343d),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffdbd9ff),
      surfaceTint: Color(0xffc2c1ff),
      onPrimary: Color(0xff110088),
      primaryContainer: Color(0xff8383ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffdbd9ff),
      onSecondary: Color(0xff1f1e55),
      secondaryContainer: Color(0xff8b8bc8),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe4d6ff),
      onTertiary: Color(0xff300074),
      tertiaryContainer: Color(0xffa278fd),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff13131b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdddaed),
      outline: Color(0xffb2b0c2),
      outlineVariant: Color(0xff908ea0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e1ed),
      inversePrimary: Color(0xff342ec0),
      primaryFixed: Color(0xffe2dfff),
      onPrimaryFixed: Color(0xff06004c),
      primaryFixedDim: Color(0xffc2c1ff),
      onPrimaryFixedVariant: Color(0xff1f0db0),
      secondaryFixed: Color(0xffe2dfff),
      onSecondaryFixed: Color(0xff090641),
      secondaryFixedDim: Color(0xffc2c1ff),
      onSecondaryFixedVariant: Color(0xff303067),
      tertiaryFixed: Color(0xffeaddff),
      onTertiaryFixed: Color(0xff180040),
      tertiaryFixedDim: Color(0xffd1bcff),
      onTertiaryFixedVariant: Color(0xff44049b),
      surfaceDim: Color(0xff13131b),
      surfaceBright: Color(0xff44434d),
      surfaceContainerLowest: Color(0xff07070e),
      surfaceContainerLow: Color(0xff1d1d25),
      surfaceContainer: Color(0xff272730),
      surfaceContainerHigh: Color(0xff32323b),
      surfaceContainerHighest: Color(0xff3d3d46),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff1eeff),
      surfaceTint: Color(0xffc2c1ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffbdbcff),
      onPrimaryContainer: Color(0xff03003b),
      secondary: Color(0xfff1eeff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbdbdfe),
      onSecondaryContainer: Color(0xff03003b),
      tertiary: Color(0xfff6ecff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffceb7ff),
      onTertiaryContainer: Color(0xff100031),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff13131b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff1eeff),
      outlineVariant: Color(0xffc3c1d3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e1ed),
      inversePrimary: Color(0xff342ec0),
      primaryFixed: Color(0xffe2dfff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc2c1ff),
      onPrimaryFixedVariant: Color(0xff06004c),
      secondaryFixed: Color(0xffe2dfff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc2c1ff),
      onSecondaryFixedVariant: Color(0xff090641),
      tertiaryFixed: Color(0xffeaddff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd1bcff),
      onTertiaryFixedVariant: Color(0xff180040),
      surfaceDim: Color(0xff13131b),
      surfaceBright: Color(0xff504f59),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1f1f27),
      surfaceContainer: Color(0xff302f39),
      surfaceContainerHigh: Color(0xff3b3a44),
      surfaceContainerHighest: Color(0xff47464f),
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
