Effortlessly create bullet lists with customizable styles and support for multiple levels of nested items.

![Screenshot](https://i.ibb.co/zGVKZpD/Screenshot-2023-06-11-at-3-47-00-AM.png)

## Features

- Ordered and unordered lists.
- Child elements can be any Flutter widget!.
- Nest as deeply as needed, to create a good looking list
- Customize default bullet styles or bring your own!
- Well documented source code

## Usage

Import the package

```dart
import 'package:super_bullet_list/super_bullet_list.dart';
```

Add bullet list to your widget tree

```dart
Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        Text('Action 🔥', style: TextStyle(fontWeight: FontWeight.bold)),
        Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: SuperBulletList(       // <------ here
            isOrdered: false,
            seperator: Gap(24),
            customBullet: Text('🍿'),
            gap: 12,
            items: [
                Text('Morbius'),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text('John Wick'),
                        Padding(
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                                child: SuperBulletList(
                                    isOrdered: true,
                                    items: [
                                        Text('John Wick (2014)'),
                                        Text('John Wick: Chapter 2 (2017'),
                                        Text('John Wick: Chapter 3 - Parabellum (2019)'),
                                    ],
                                ),
                        ),
                    ],
                ),
              ],
            ),
        ),
    ],
),
```

## Properties

| Property        | Description                                                          |
| --------------- | -------------------------------------------------------------------- |
| crossAxisMargin | The top margin of the marker relative to its content                 |
| gap             | The space between the marker and the widget content                  |
| iconColor       | Color of the marker when using unordered lists                       |
| iconSize        | Size of the marker when using unordered lists                        |
| isOrdered       | Creates an ordered list if true and unordered otherwise (required)   |
| items           | List of widgets (required)                                           |
| separator       | The space between individual bullet points                           |
| style           | The marker style. e.g. `BulletStyle.alphabets` or `BulletStyle.disc` |
| textStyle       | Styles the marker when using ordered lists                           |

## Nested lists

Because everything is a widget in Flutter, you can achieve nested lists simply by passing an instance of `SuperBulletList` as one of the child items list of any other SuperBulletList just like this:

```dart
SuperBulletList(
    items: [
        SomeWidget(),

        SuperBulletList(items: []),
        AnotherBulletList(items: []),

        SomeOtherWidget()
    ]
)
```

## Side notes

- When you customize the `iconSize` property of the widget, do make sure to scale the corresponding widget to ensure a good looking design, as the package does not automatically do that. For example, if you make `iconSize` 20 pixels, you might want to bump up the font size of the text to match the size of the icon.
  <br>
- When you create nested lists, consider adding some padding around the nested list, to make it stand out better.
