import 'package:flutter/material.dart';
import 'package:presentation/constants/book_tag.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/layouts/search_layout.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

class SelectBookTagsScreen extends StatefulWidget {
  final Function(List<BookTag>)? onSubmit;
  final List<BookTag> initValue;
  const SelectBookTagsScreen({
    super.key,
    this.initValue = const [],
    this.onSubmit,
  });

  @override
  State<SelectBookTagsScreen> createState() => _SelectBookTagsScreenState();
}

class _SelectBookTagsScreenState extends State<SelectBookTagsScreen> {
  late List<BookTag> tagsSelected;

  @override
  void initState() {
    super.initState();
    tagsSelected = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      child: Column(
        children: [
          SearchBarView(
            autoFocus: false,
            placeHolder: "Search",
            onSubmitted: (value) {},
            debounceDuration: 300,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: BookTag.ITEMS.length,
            itemBuilder: (context, index) {
              final tag = BookTag.ITEMS[index];

              return _ListTagItem(
                onTap: (isSelected) {
                  if (isSelected) {
                    tagsSelected.add(tag);
                    return;
                  }
                  tagsSelected.remove(tag);
                },
                bookTag: tag,
                isSelected: tagsSelected.contains(tag),
              );
            },
          ))
        ],
      ),
    );
  }
}

class _ListTagItem extends StatefulWidget {
  final BookTag bookTag;
  final Function(bool) onTap;
  final bool? isSelected;
  const _ListTagItem({
    required this.onTap,
    required this.bookTag,
    this.isSelected,
  });

  @override
  State<_ListTagItem> createState() => __ListTagItemState();
}

class __ListTagItemState extends State<_ListTagItem> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onTap(_isSelected);
      },
      child: Row(
        children: [
          BodyLText(
            widget.bookTag.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          (_isSelected == true) ? const Icon(Icons.check) : const SizedBox()
        ],
      ),
    );
  }
}
