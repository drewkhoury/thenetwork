# What we'll do

This repo has a copy of a demo flutter application: https://github.com/fireship-io/flutter-firebase-quizapp-course

This readme will walk you through what you need to get this Android app running locally, so you can start learning how to develop with Flutter.

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

![](docs/run.gif)

## Troubeshooting

If you have trouble loading the devcies in a new Android Studio project, open "main.dart > Edit Configuration" and check for the error "Error: Dart SDK is not configured". You may need to go to "Preferences > Languages & Frameworks > Dart" and "Enable Dart support for this project" as well as enter the SDK Path, eg `/opt/homebrew/Caskroom/flutter/3.0.5/flutter/bin/cache/dart-sdk` and "Enable Dart support for the modules".

Do not try and open more than one project at a time, you may have build/run issues and problems connecting to the emulator.

If you get any storage related errors you may need to give the device more storage space.

# Next steps

You're now ready for Flutter app development!

