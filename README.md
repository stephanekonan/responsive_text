# responsive_text

A Flutter package providing a responsive text widget with support for currency formatting, gradient effects, and text truncation.

## Features
- **Responsive Font Size**: Scales text size based on screen width.
- **Currency Support**: Append a custom currency symbol when `isCurrency` is true.
- **Gradient Effect**: Apply a gradient to the text with customizable colors.
- **Text Truncation**: Limit text length with an ellipsis (`...`) when exceeding `maxLength`.
- **Customizable Styling**: Adjust font size, weight, color, alignment, overflow, and line height.

## Installation
Add the following to your `pubspec.yaml`:
```yaml
dependencies:
  responsive_text: ^1.0.0
```

Then run:
```bash
flutter pub get
```

## Usage
Import the package:
```dart
import 'package:responsive_text/responsive_text.dart';
```

Use the `ResponsiveText` widget:
```dart
ResponsiveText(
  'Hello World',
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.blue,
)
```

### Currency Example
```dart
ResponsiveText(
  '1000',
  isCurrency: true,
  currencySymbol: '€',
  fontSize: 18,
  color: Colors.green,
)
```

### Gradient Example
```dart
ResponsiveText(
  'Gradient Text',
  fontSize: 20,
  useGradient: true,
  gradientColors: [Colors.red, Colors.blue],
)
```

### Truncation Example
```dart
ResponsiveText(
  'This is a very long text',
  fontSize: 14,
  maxLength: 10,
  color: Colors.black,
)
```

## Parameters
| Parameter       | Type            | Description                                                                 |
|-----------------|-----------------|-----------------------------------------------------------------------------|
| `text`          | `String`        | The text to display (required).                                             |
| `fontSize`      | `double`        | Base font size, scaled by screen width (default: 14).                       |
| `fontWeight`    | `FontWeight`    | Font weight (default: `FontWeight.normal`).                                 |
| `color`         | `Color`         | Text color (default: `Colors.black`). Ignored if `useGradient` is true.     |
| `textAlign`     | `TextAlign`     | Text alignment (default: `TextAlign.start`).                                |
| `overflow`      | `TextOverflow`  | How to handle text overflow (default: `TextOverflow.clip`).                 |
| `height`        | `double?`       | Line height (optional).                                                    |
| `useGradient`   | `bool`          | Whether to apply a gradient effect (default: `false`).                      |
| `gradientColors`| `List<Color>?`  | List of colors for gradient (requires at least 2 colors).                   |
| `isCurrency`    | `bool`          | Whether to append a currency symbol (default: `false`).                     |
| `currencySymbol`| `String?`       | Currency symbol (required if `isCurrency` is true).                         |
| `maxLength`     | `int`           | Maximum text length before truncation (default: 0, no truncation).          |

## Notes
- If `isCurrency` is `true`, `currencySymbol` must be provided.
- If `currencySymbol` is provided, `isCurrency` must be `true`.
- Gradient effect requires at least two colors in `gradientColors`.

## License
MIT License