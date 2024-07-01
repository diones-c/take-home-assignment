<p align="center">
<img src="/assets/kalshi_logo_round.svg" height="100" alt="Kalshi" />
</p>

## Setup
1. We use [fvm](https://fvm.app/) for managing the flutter version within the project. Still using the terminal, navigate to the newly added **project** folder and install the tools dependencies by
   running the following commands:

    ```sh
    dart pub global activate fvm
    ```

    The output of the command will ask to add the folder `./pub-cache/bin` to your PATH variables, if you didn't already. If that is the case, add it to your environment variables, and restart the terminal.

    ```sh
    export PATH="$PATH":"$HOME/.pub-cache/bin" # Add this to your environment variables
    ```

2. Install the project's flutter version using `fvm`.

    ```sh
    fvm use
    ```

3. From now on, you will run all the flutter commands with the `fvm` prefix. Get all the projects dependencies.

    ```sh
    fvm flutter pub get
    ```

4. You can use the makefile to get all dependencies of the project running `make get`


## Features 🎯
- Find Financial Wellness Score
- Financial Wellness Score Result

## Architecture

![architecture]

- Data layer: This layer interacts directly with an API (REST API or a device API).
- Domain layer: This layer transforms or manipulates the data that the API provides.
- Presentation layer: This layer presents the app content and triggers events that modify the application state.

## Application
The application follow the pattern page/view, each feature contains the pattern feature_page.dart and inside a FeaturePage and a FeatureView.

```
├── lib
|   ├── app
|   |   ├── routes
│   │   │   └── routes.dart
│   │   ├── app.dart
│   │   ├── view.dart
|   ├── scan
│   │   ├── cubit
│   │   │   └── find_financial_wellness_score_cubit.dart
|   |   |   └── find_financial_wellness_score_state.dart
│   │   └── view
│   │   |   ├── find_financial_wellness_score_page.dart
|   |   |   └── view.dart
|   |   └── widgets
|   |   |   └── find_financial_wellness_score.dart
│   │   ├── scan.dart
│   ├── bootstrap.dart
│   └── main.dart
├── pubspec.lock
├── pubspec.yaml
```


## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
  "@@locale": "en",
  "findFinancialWellnessScoreTitleFirst": "Let's find out your ",
  "@findFinancialWellnessScoreTitleFirst": {
    "description": "First title part of text shown in the top of the Find Financial Wellness Score"
  },
  "findFinancialWellnessScoreTitleLast": "financial wellness score.",
  "@findFinancialWellnessScoreTitleLast": {
    "description": "Last title part of text shown in the top of the Find Financial Wellness Score"
  }
}
```

2. Then add a new key/value and description

```arb
{
    "findFinancialWellnessTest": "Financial wellness test",
    "@findFinancialWellnessTest": {
        "description": "Text shown in Find Financial Wellness Score"
    }
}
```

3. Use the new string

```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@override
Widget build(BuildContext context) {
  final appLocalizations = AppLocalizations.of(context);
  return Text(appLocalizations.scan);
}
```

## Tests
- To run the tests execute `make testing`

### External packages
* [formz](https://pub.dev/packages/formz) A unified form representation in Dart. Formz aims to simplify form representation and validation in a generic way.
* [Bloc](https://pub.dev/packages/flutter_bloc) A dart package that helps implement the BLoC pattern.
* [intl](https://pub.dev/packages/intl) Provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.
* [Google Fonts](https://pub.dev/packages/google_fonts) A Flutter package to use fonts from fonts.google.com
* [intl](https://github.com/ReactiveX/RxAndroid) Provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.
* [Go router](https://pub.dev/packages/go_router) A declarative routing package for Flutter that uses the Router API to provide a convenient, url-based API for navigating between different screens.
* [Flutter Launcher icons](https://pub.dev/packages/flutter_launcher_icons) A command-line tool which simplifies the task of updating your Flutter app's launcher icon.
* [Very Good Analysis](https://pub.dev/packages/very_good_analysis) This package provides lint rules for Dart and Flutter
* [Equatable](https://pub.dev/packages/equatable) Being able to compare objects in Dart often involves having to override the == operator as well as hashCode.
* [Flutter SVG](https://pub.dev/packages/flutter_svg) Draw SVG files using Flutter.