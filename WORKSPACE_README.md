# Magic 8-Ball iOS SDK Workspace

This Xcode workspace contains both the Magic 8-Ball iOS SDK and a demo app for easy development and testing.

## What's Included

- **Magic8Ball-iOS-SDK.xcodeproj** - The SDK framework project
- **Magic8Ball-iOS-Demo.xcodeproj** - Demo app showcasing the SDK features

## Getting Started

1. **Open the workspace**:
   ```
   open Magic8Ball-iOS-SDK.xcworkspace
   ```

2. **Select your target**:
   - Choose "Magic8Ball-iOS-Demo" to run the demo app
   - Choose "Magic8Ball-iOS-SDKTests" to run the unit tests

3. **Build and run**:
   - Press `Cmd+R` to build and run the demo app
   - Press `Cmd+U` to run the unit tests

## Features Demonstrated

The demo app showcases all SDK features:
- ✅ One-line integration: `Magic8BallView()`
- ✅ Theme customization (light/dark/auto)
- ✅ Corner radius customization
- ✅ Load/error callbacks
- ✅ Offline caching support
- ✅ Status indicators

## SDK Features

- **SwiftUI native** - Built with `UIViewRepresentable`
- **Web-based content** - Dynamic updates without App Store reviews
- **Offline caching** - Works offline after first load
- **Customization** - Theme and corner radius options
- **Callbacks** - `onLoad` and `onError` callbacks
- **Unit tested** - Comprehensive test coverage

## Requirements

- **iOS**: 14.0+
- **Xcode**: 15.0+
- **Swift**: 5.0+

## Quick Integration

```swift
import SwiftUI
import Magic8Ball_iOS_SDK

struct ContentView: View {
    var body: some View {
        Magic8BallView(
            theme: .auto,
            cornerRadius: 10,
            onLoad: { print("Magic 8-Ball ready!") },
            onError: { error in print("Error: \(error)") }
        )
    }
}
```

That's it! Your app now has a fully functional Magic 8-Ball. 