import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

typedef OnLinkTap = void Function(
  String? url,
  Map<String, String> attributes,
);

class AppTextView extends StatelessWidget {
  final String content;
  final TextStyle? style;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color? color;
  final OnLinkTap? onLinkTap;

  const AppTextView(
    this.content, {
    super.key,
    this.style,
    this.maxLines,
    this.textAlign,
    this.color,
    this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return _isHtml ? _getHtmlTextView(context) : _getPlainTextView(context);
  }

  bool get _isHtml {
    final htmlPattern = RegExp(r'<[^>]*>');

    return htmlPattern.hasMatch(content);
  }

  Widget _getHtmlTextView(BuildContext context) {
    return Html(
      data: content,
      style: {
        "body": Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(style?.fontSize ?? 14.0),
          color: color ?? style?.color ?? Colors.black,
          fontWeight: style?.fontWeight,
          fontFamily: style?.fontFamily,
          maxLines: maxLines,
          textOverflow: _textOverflowType,
          textAlign: textAlign,
        ),
      },
      onLinkTap: (url, attributes, element) {
        onLinkTap?.call(url, attributes);
      },
    );
  }

  Widget _getPlainTextView(BuildContext context) {
    return Text(
      content,
      style: style?.copyWith(color: color),
      maxLines: maxLines,
      overflow: _textOverflowType,
      textAlign: textAlign,
    );
  }

  TextOverflow? get _textOverflowType =>
      maxLines != null ? TextOverflow.ellipsis : null;
}
