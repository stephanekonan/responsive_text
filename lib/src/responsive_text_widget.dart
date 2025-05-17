import 'package:flutter/material.dart';

/// A responsive text widget that adapts font size based on screen width,
/// supports currency formatting, gradient text, and text truncation.
class ResponsiveText extends StatelessWidget {
  /// The text to display.
  final String text;

  /// The base font size, which will be scaled based on screen width.
  final double fontSize;

  /// The font weight of the text.
  final FontWeight fontWeight;

  /// The color of the text (ignored if [useGradient] is true).
  final Color color;

  /// The alignment of the text.
  final TextAlign textAlign;

  /// How to handle text overflow.
  final TextOverflow overflow;

  /// The line height of the text.
  final double? height;

  /// Whether to apply a gradient effect to the text.
  final bool useGradient;

  /// List of colors for the gradient effect (requires at least 2 colors).
  final List<Color>? gradientColors;

  /// Whether to append a currency symbol to the text.
  final bool isCurrency;

  /// The currency symbol to append (required if [isCurrency] is true).
  final String? currencySymbol;

  /// Maximum length of the text before truncation with '...'.
  final int maxLength;

  const ResponsiveText(
    this.text, {
    super.key,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.height,
    this.useGradient = false,
    this.gradientColors,
    this.isCurrency = false,
    this.currencySymbol,
    this.maxLength = 0,
  }) : assert(
          (isCurrency && currencySymbol != null) || (!isCurrency && currencySymbol == null),
          'If isCurrency is true, currencySymbol must be provided. If currencySymbol is provided, isCurrency must be true.',
        );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final responsiveFontSize = fontSize * (screenWidth / 375);

    String displayText = text;

    if (maxLength > 0 && text.length > maxLength) {
      displayText = '${text.substring(0, maxLength)}...';
    }

    if (useGradient && gradientColors != null && gradientColors!.length >= 2) {
      return ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: gradientColors!,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
        child: isCurrency
            ? Text.rich(
                TextSpan(
                  text: displayText,
                  style: TextStyle(
                    fontSize: responsiveFontSize,
                    fontWeight: fontWeight,
                    color: Colors.white,
                    height: height,
                  ),
                  children: [
                    TextSpan(
                      text: ' $currencySymbol',
                      style: TextStyle(
                        fontSize: responsiveFontSize * 0.5,
                        fontWeight: fontWeight,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
                textAlign: textAlign,
                overflow: overflow,
              )
            : Text(
                displayText,
                textAlign: textAlign,
                style: TextStyle(
                  fontSize: responsiveFontSize,
                  fontWeight: fontWeight,
                  color: Colors.white,
                  height: height,
                ),
                overflow: overflow,
              ),
      );
    }

    if (isCurrency) {
      return Text.rich(
        TextSpan(
          text: displayText,
          style: TextStyle(
            fontSize: responsiveFontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          ),
          children: [
            TextSpan(
              text: ' $currencySymbol',
              style: TextStyle(
                fontSize: responsiveFontSize * 0.5,
                fontWeight: fontWeight,
                color: color,
                textBaseline: TextBaseline.alphabetic,
                height: 1.5,
              ),
            ),
          ],
        ),
        textAlign: textAlign,
        overflow: overflow,
      );
    }

    return Text(
      displayText,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: responsiveFontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      ),
      overflow: overflow,
    );
  }
}