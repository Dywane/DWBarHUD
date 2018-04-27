# DWBarHUD


![default-default](https://github.com/Dywane/DWBarHUD/raw/master/GIF/default-default.gif)

DWBarHUD is a **Swfit** based top bar HUD for iOS 9 and above, support iPhoneX.

## Features
* Fully customizable.
* Show on top of view controlles.
* Four styles suit all needs.
* Present/Dismiss animation.

![failed-fade](https://github.com/Dywane/DWBarHUD/raw/master/GIF/fail-fade.gif)

![success-default](https://github.com/Dywane/DWBarHUD/raw/master/GIF/success-default.gif)

![warning-spring](https://github.com/Dywane/DWBarHUD/raw/master/GIF/warning-spring.gif)

## Installation

You want to add `pod 'DWBarHUD', '~> 1.0'` similar to the following to your Podfile:

```ruby
target 'MyApp' do
  pod 'DWBarHUD', '~> 1.0'
end
```
Then run a `pod install` inside your terminal, or from CocoaPods.app.

Alternatively to give it a test run, run the command:`pod try DWBarHUD`

## Usage
In any UIViewController, you need to import the module first

```swift
import DWBarHUD
```

Then you can show an HUD and automatic disappear like this:

```swift
DWBarHUD.showHUD(message: "This is a message", type: .success)
```

## Customization
There are many properties you can customize.

* `DWBarHUD.sharedHUD.config.animationDuration` defines how long to present the HUD animation
* `DWBarHUD.sharedHUD.config.displayDuration` defines how long the HUD show
* `DWBarHUD.sharedHUD.config.barHeight` defines the height of the HUD
* `DWBarHUD.sharedHUD.config.animationType` defines the HUD animation type
* `DWBarHUD.sharedHUD.config.barSuccessIcon` & `DWBarHUD.sharedHUD.config.barSuccessColor` this two define success type's icon and color

more can be seen in Xcode

## Requirements
* iOS 9.0+
* Swift 4
* Xcode 9

## Contribution
You are welcome to fork and submit pull requests or issues.

## License
DWBarHUD is open-sourced software licensed under the MIT license.

## Credits
DWBarHUD is owned and maintained by [Duwei](https://dywane.github.io)