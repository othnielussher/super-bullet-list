library bullet_list;

import 'package:bullet_list/bullet_style.dart';
import 'package:bullet_list/utils.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BulletList extends StatelessWidget {
  /// List of data values.
  final List<Widget> items;

  /// Whether the list is ordered or unordered. When set to true, the default
  /// marker style will be set to `BulletStyle.numeric` unless otherwise specified.
  ///
  /// Defauls to `false`.
  final bool isOrdered;

  /// To specify the bullet type (style) to use to display list items in a
  /// BulletList, set the [BulletStyle] property to one of the bullet types that
  /// are defined by the [BulletStyle] enumeration.
  ///
  /// You can also set a custom style by setting [customBullet] to any
  ///
  /// Defaults to `BulletStyle.discFill`.
  final BulletStyle style;

  /// When set, the marker style (e.g. Roman Numeral) will be indented at the top
  /// by this value, causing the top of the bullet list style to be misaligned
  /// with its corresponding widget. This can be used to achieve any desired
  /// cross-axis alignment.
  ///
  /// The package tries to align the tops of the each of the content with the
  /// specified bullet list style.
  final double? crossAxisMargin;

  /// The spacing between the bullet and its corresponding widget.
  ///
  /// Defaults to a horizontal space of 14 pixels. `Gap(14.0)`
  final double? gap;

  /// If non-null, this widget will be used as a separator for the individual
  /// items of the bullet list.
  ///
  /// Defults to a 16 pixel vertical space.
  /// `Gap(16.0)`
  final Widget? seperator;

  /// If non-null, this widget will replace the default bullet list style, or
  /// override any value which was set using [style].
  final Widget? customBullet;

  /// The textstyle to use for the bullet list if its style falls within
  /// the following options:
  ///
  /// [`asterisk`, `alphabets`, `alphabetsBracketed`, `alphabetsRightBracketed`,
  ///  `numeric`, `numericBracketed`, `numericRightBracketed`, `romanNumerals`,
  ///  `romanNumeralsBracketed`, `romanNumeralsRightBracketed`]
  final TextStyle? textStyle;

  /// The icon size to use for the bullet list if its style falls within the
  /// following options:
  ///
  /// [`disc`, `discFill`, `checkbox`]
  final double? iconSize;

  /// The icon color to use for the bullet list if its style falls within the
  /// following options:
  ///
  /// [`disc`, `discFill`, `checkbox`]
  final Color? iconColor;

  final CrossAxisAlignment? crossAxisAlignment;

  const BulletList({
    super.key,
    required this.items,
    this.isOrdered = false,
    this.style = BulletStyle.discFill,
    this.crossAxisMargin,
    this.gap,
    this.seperator,
    this.customBullet,
    this.textStyle,
    this.iconSize,
    this.iconColor,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return SeparatedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      separatorBuilder: () => seperator ?? const Gap(16.0),
      children: List.generate(items.length, (index) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: crossAxisMargin ?? bulletStylePadding,
              ),
              child: resolveBulletType(index),
            ),
            Gap(gap ?? 14.0),
            Flexible(child: items[index]),
          ],
        );
      }),
    );
  }

  double get bulletStylePadding {
    if (isOrdered) {
      switch (style) {
        case BulletStyle.alphabets:
          return 0;
        case BulletStyle.alphabetsBracketed:
          return 1;
        case BulletStyle.alphabetsRightBracketed:
          return 0;

        case BulletStyle.numeric:
          return 0.5;
        case BulletStyle.numericBracketed:
          return 0.5;
        case BulletStyle.numericRightBracketed:
          return 0;

        case BulletStyle.romanNumerals:
          return 0;
        case BulletStyle.romanNumeralsBracketed:
          return 0.5;
        case BulletStyle.romanNumeralsRightBracketed:
          return 0;
        default:
          return 0;
      }
    }

    switch (style) {
      case BulletStyle.asterisk:
        return 1;
      case BulletStyle.disc:
        return 2.5;
      case BulletStyle.discFill:
        return 3.5;
      case BulletStyle.checkbox:
        return 2;
      default:
        return 0;
    }
  }

  Widget resolveBulletType(int index) {
    if (customBullet != null) {
      return customBullet!;
    }

    if (isOrdered) {
      switch (style) {
        case BulletStyle.alphabets:
          return Text(
            '${Utils.getAlphabetFromNumber(index + 1)}.',
            style: textStyle,
          );
        case BulletStyle.alphabetsBracketed:
          return Text(
            '(${Utils.getAlphabetFromNumber(index + 1)})',
            style: textStyle,
          );
        case BulletStyle.alphabetsRightBracketed:
          return Text(
            '${Utils.getAlphabetFromNumber(index + 1)})',
            style: textStyle,
          );

        case BulletStyle.numeric:
          return Text('${index + 1}.', style: textStyle);
        case BulletStyle.numericBracketed:
          return Text('(${index + 1})', style: textStyle);
        case BulletStyle.numericRightBracketed:
          return Text('${index + 1})', style: textStyle);

        case BulletStyle.romanNumerals:
          return Text(
            '${Utils.getRomanNumeralFromNumber(index + 1)}.',
            style: textStyle,
          );
        case BulletStyle.romanNumeralsBracketed:
          return Text(
            '(${Utils.getRomanNumeralFromNumber(index + 1)})',
            style: textStyle,
          );
        case BulletStyle.romanNumeralsRightBracketed:
          return Text(
            '${Utils.getRomanNumeralFromNumber(index + 1)})',
            style: textStyle,
          );
        default:
          return Text('${index + 1}.', style: textStyle);
      }
    }

    switch (style) {
      case BulletStyle.none:
        return const SizedBox.shrink();

      case BulletStyle.asterisk:
        return const Text('*');
      case BulletStyle.checkbox:
        return Icon(
          Icons.check_box_outline_blank_rounded,
          size: iconSize ?? 12.0,
          color: iconColor,
        );
      case BulletStyle.disc:
        return Icon(
          Icons.circle_outlined,
          size: iconSize ?? 10.0,
          color: iconColor,
        );
      case BulletStyle.discFill:
        return Icon(Icons.circle, size: iconSize ?? 10.0, color: iconColor);
      case BulletStyle.dash:
        return Text('-', style: textStyle);
      default:
        return Icon(Icons.circle, size: iconSize ?? 10.0, color: iconColor);
    }
  }
}
