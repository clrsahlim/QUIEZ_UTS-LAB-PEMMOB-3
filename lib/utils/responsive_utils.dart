// lib/utils/responsive_utils.dart
import 'package:flutter/material.dart';

class ResponsiveUtils {
  final BuildContext context;

  ResponsiveUtils(this.context);

  // Screen dimensions
  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  // Device type detection
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;
  bool get isLandscape => screenWidth > screenHeight;
  bool get isPortrait => screenHeight > screenWidth;

  double fontSize({
    double? mobile,
    double? tablet,
    double? desktop,
    double? landscape,
  }) {
    if (isLandscape && landscape != null) {
      return screenHeight * landscape;
    }
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    if (mobile != null) {
      return isMobile ? screenWidth * mobile : mobile * 16;
    }
    return 14; // default
  }

  // Responsive spacing
  double spacing({
    double? mobile,
    double? tablet,
    double? desktop,
    double? landscape,
  }) {
    if (isLandscape && landscape != null) {
      return screenHeight * landscape;
    }
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    if (mobile != null) {
      return isMobile ? screenHeight * mobile : mobile;
    }
    return 8; // default
  }

  // Responsive width
  double widthPercent(double percent) {
    if (isDesktop) {
      return 600 * (percent / 100);
    }
    return screenWidth * (percent / 100);
  }

  // Responsive height
  double heightPercent(double percent) {
    return screenHeight * (percent / 100);
  }

  // Icon size
  double iconSize({double? mobile, double? desktop, double? landscape}) {
    if (isLandscape && landscape != null) {
      return screenHeight * landscape;
    }
    if (isDesktop && desktop != null) return desktop;
    return mobile != null ? screenWidth * mobile : 24;
  }

  // Padding
  EdgeInsets padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    double multiplier = isDesktop ? 1.0 : (isLandscape ? screenHeight * 0.01 : screenWidth * 0.01);

    return EdgeInsets.only(
      top: (top ?? vertical ?? all ?? 0) * multiplier,
      bottom: (bottom ?? vertical ?? all ?? 0) * multiplier,
      left: (left ?? horizontal ?? all ?? 0) * multiplier,
      right: (right ?? horizontal ?? all ?? 0) * multiplier,
    );
  }

  // Container constraints
  BoxConstraints containerConstraints() {
    return BoxConstraints(
      maxWidth: isDesktop ? 600 : (isLandscape ? 700 : 500),
    );
  }

  // Container width
  double containerWidth() {
    if (isDesktop) return 600;
    if (isLandscape) return screenWidth * 0.7;
    return screenWidth * 0.9;
  }
}