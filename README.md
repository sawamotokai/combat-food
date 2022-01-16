# Combat Food

## Firebase Setup

- ### Install the CLI if not already done so

  `dart pub global activate flutterfire_cli`

- ### Run the `configure` command, select a Firebase project and platforms
  - Run `flutterfire configure`
  - Select `combatfoodapi` and hit enter
  - Check `ios` and `android` and hit enter
  - For ios bundle ID, type in `jp.io.combat-food`

## Installing dependancies (Only once)

```
flutter pub get
```

## Running the project

```
flutter run --no-sound-null-safety
```
