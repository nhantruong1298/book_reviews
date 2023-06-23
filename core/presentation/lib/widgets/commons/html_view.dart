import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

export 'package:flutter_html/flutter_html.dart';

class HtmlView extends StatelessWidget {
  final String? data;

  final OnTap? onLinkTap;
  final OnTap? onAnchorTap;
  final Map<String, Style> style;

  const HtmlView(
      {super.key,
      required this.data,
      this.onAnchorTap,
      this.onLinkTap,
      this.style = const {}});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: data,
      // customRenders: {
      //   tableMatcher(): tableRender(),
      //   svgTagMatcher(): svgTagRender(),
      //   svgDataUriMatcher(): svgDataImageRender(),
      //   svgAssetUriMatcher(): svgAssetImageRender(),
      //   svgNetworkSourceMatcher(): svgNetworkImageRender(),
      // },
      onLinkTap: onLinkTap,
      onAnchorTap: onAnchorTap,
      style: style,
    );
  }
}
