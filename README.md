# MyAnimeList

Simple sample of using the VIP ([Clean Swift](https://clean-swift.com/clean-swift-ios-architecture/)) architecture for iOS.

**ViewController**: controls the event handling, view life cycle and display logic  
**Interactor**: app's business logic  
**Worker**: interface and implementation of the work that need to be done as managing request and response from database  
**Presenter**: formats data to be presented in View Controller  
**Router**: controlls the screen transition  
**Configurator**: configures delegates dependency  
**Model**: pass data through the classes' boundaries  

## Project Setup

All pods are already commited, but if you want to install others, do:
- Make sure you have ruby > 2.3.7
- Update [Podfile](https://github.com/MaisaMilena/MyAnimeList/blob/master/MyAnimeList/Podfile)
- Run bundle install
- Run bundle exec pod install
- Make sure you commit the pods, Podfile and Podfile.lock

## Hacktoberfest
For beginners:
- You can add an Anime that you like on the Realm Database file (RealmDatabase.swift)

## Contribution
- If you have a feature request, open an issue
- If you want to contribute, submit a pull request
