# What we'll do

This repo is a modified version of the demo flutter application on github [fireship-io/flutter-firebase-quizapp-course](https://github.com/fireship-io/flutter-firebase-quizapp-course).

I created this readme to walk you through what you need to get this Android app running locally, so you can start learning how to develop with Flutter but editing the project directly, and seeing the changes I made to get it working at the various stages.

Commits:
- `73e8e3cfdbfa3fac979ff151ee8304c455714cce` Initial App
- `67450d61858022e0bedf3307e08a3f5d75fe10ee` Part 1 changes - Simple app name changes, app almost identical
- `27c4d14574a7e1693b1a38178c0bbd4c1819504d` Part 2 changes - Removing and changing the more complex parts of the app so it's just basic text screens and auth

**Flutter Firebase - The Full Course 3.0**

🕊️🔥 Build a realtime Quiz App from scratch with Flutter 3 & Firebase.

**Learn it**

Enroll in the [Flutter Firebase Course](https://fireship.io/courses/flutter-firebase/) on Fireship.

**Learning Goals**

- 👨‍🎤 Build a complete Flutter app with Firebase
- 🐦 Master most common Flutter widgets
- 🔏 User Authentication (Apple, Google, Anonymous)
- ⚒️ State Management with Provider
- 🔥 Model relational Firestore data
- 🎭 Animation for realtime data streams
- ⚓ Organize large Flutter projects
- 🤖 Firestore -> Dart Classes with JSON Serializable
- 🚀 Deploy to the Apple App Store and Google Play

# Expectations

All instructions in this README have been tested on a mac (m1), but Google has instructions for other systems.

Because Flutter development and testing require emulators, and have such deep integration into your native workstation, nothing has been containerized, all steps run on the workstation.

It's possible to use VSCode for Flutter development, but this guide focuses on Android Studio (as it's needed for Android emulators anyway).

# Workstaion Setup

On your workstation will need:
- Flutter (which also takes care of the Dart requriement)
- Java (for build tasks used by your project)
- An IDE (Android Studio) with Flutter plugin (Android Studio includes SDK Manager, which takes care of Android Emulator requirement)

```
# install flutter
brew install --cask flutter

# for things like gradle builds (which are tied to your workstations' version of flutter)
brew install java
export JAVA_HOME=/opt/homebrew/opt/openjdk/

# remember to manually add flutter plugin for android-sudio once installed, 
brew install --cask android-studio
```

# Android Studio Project Setup

First, git clone this repo, and then run `flutter clean` in a terminal. This will ensure any of the previous project-specific files won't cause an issue (this repo contains `.flutter-plugins-dependencies` which you do not want interfering with your new project).

Now you can launch Android Sudio and go to "File > Open". Select this folder.

You should be able to configure a new Android device (eg Pixel 3 XL) using the Device Manager.

You should be able to click "Run main.dart". This will:
- Run `flutter pub get`
- Build the app
- Start the emulator/device and connect to it, and load the app

15 seconds:

![](docs/run.gif)

## Troubeshooting

If you have trouble loading the devcies in a new Android Studio project, open "main.dart > Edit Configuration" and check for the error "Error: Dart SDK is not configured". You may need to go to "Preferences > Languages & Frameworks > Dart" and "Enable Dart support for this project" as well as enter the SDK Path, eg `/opt/homebrew/Caskroom/flutter/3.0.5/flutter/bin/cache/dart-sdk` and "Enable Dart support for the modules".

Do not try and open more than one project at a time, you may have build/run issues and problems connecting to the emulator.

If you get any storage related errors you may need to give the device more storage space.

# Next steps

You're now ready for Flutter app development!

## Making the app your own - Part 1

We have 2 values to create for our new project.
- YOUR_APP_NAME, eg `thenetworkapp`
- REVERSE_DOMAIN_NAME, eg `io.thenetwork.thenetworkapp`

The first change we'll make to the app will be to change references from quizapp to YOUR_APP_NAME.

In `pubspec.yaml` change `name:` to YOUR_APP_NAME.

In `android/app/build.gradle` change `applicationId:` to REVERSE_DOMAIN_NAME for your app.

In `lib/` replace refernces to local packages from `package:quizapp` to `package:YOUR_APP_NAME`

Delete `ios/` folder if you're not planning on doing any iOS development yet.

You can add a `android/app/google-services.json` now if you've configured your Firebase App, or later when you're ready.

Your app should still load, however it may not be able to connect to the Firebase backend to load topics.

## Android Play store and Firebase Setup (small detour to make sure you get the basics setup)

We'll need to deploy a real app soon and that will require:
- A developer account in the play store
- A firebase account

### Firebase setup (needed to test auth locally)

Login to https://console.firebase.google.com/ with a Google Acocunt.

Create a new Android App, using these details:
- REVERSE_DOMAIN_NAME, eg `io.thenetwork.thenetworkapp`
- In a terminal, run `./gradlew signingReport` from your project folder and get the SHA-1 from the `debugAndroidTest` section.

You should now have a `google-services.json` file that you can put in `android/app/` so your app can connect to Firebase.

You should enable auth services like `anonymous` and `google`, otherwise they won't work when you load your app.
### Play store setup (needed to deploy an app)

Follow a guide like this: [How to Publish an Android App on Google Play Store: A Step-by-Step Guide](https://orangesoft.co/blog/how-to-publish-an-android-app-on-google-play-store)
- Signup for a [google play developer account](https://play.google.com/apps/publish/signup/)
  - use a real google account
  - prepare to validate with a photo of your id
  - $25
- You can start creating your store listing, but you will need photos of your app and other things, you can come back to the details later

## Making the app your own - Part 2

We're going to simplify the application by removing some of the quiz specific parts. This will make it easier to deploy a real app, while still keeping the core parts of login and auth. It will also give us a chance to become familar with a real app structure when it come to building something more complicated in the future.

- `lib/about/about.dart` - Update the text to explain what this app does
- In `home/home.dart` replace `topics` to `entry` and `EntryScreen`
- Rename `topics/` to `entry/` and `topics.dart` to `entry.dart` (convert to a simple text page like the about page), and delete `topic_item.dart`, `drawer.dart`
- Update `entry.dart` so that it's just the scafold, with some text in the body, with links to profile and bottom nav (but remove all the topic load and drawer referenecs) ... make sure you update it to say `EntryScreen`
- Update `routes.dart` and `home.dart` to `EntryScreen`
- Update `profile` to remove reference to quizzes
- Remove `quiz/`
- Update `bottom_nav.dart` with custom text/icon for your home/entry
- `firestore.dart` and `models.dart` remove most things here
- remove everything under `JsonSerializableGenerator` in `models.g.dart` 
- `progress_bar.dart` remove `TopicProgress` class
- `main.dart` to keep the code/flow but avoid having to worry too much about firebase structures, use a dummy stream

38 seconds:

![](docs/run-p2.gif)

# Release Process

Coming Soon!
