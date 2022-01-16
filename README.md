# Combat Food

## Firebase Setup

#concept
Our goal is to minimize expiring food waste from restaurant. To achieve the goal, we designed a mobile application that allows individuals to select and purchase an item from a number of other items; while restaurants can post their left-over or other items with their preferred price. 

Since we are aiming to build accessible and convenient applicatin, we have decided to create a mobile application using flutter, dart and firebase. 

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
