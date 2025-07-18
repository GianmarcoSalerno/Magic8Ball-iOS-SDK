# Magic8Ball iOS SDK

A simple, lightweight iOS SDK that wraps the Magic 8-Ball web experience in a native SwiftUI component. Add a Magic 8-Ball to your app with just one line of code.

## Features

- **One-line integration**: `Magic8BallView()`
- **SwiftUI native**: Built with SwiftUI for seamless integration
- **Web-based content**: Dynamic updates without App Store reviews
- **Lightweight**: Minimal overhead, just a WebView wrapper

## Installation

### Swift Package Manager

1. In Xcode, go to **File** → **Add Package Dependencies**
2. Enter the repository URL: `https://github.com/yourusername/Magic8Ball-iOS-SDK`
3. Click **Add Package**
4. Select your target and click **Add Package**

### Manual Installation

1. Clone this repository
2. Drag `Sources/Magic8Ball-iOS-SDK` into your Xcode project
3. Ensure the target is added to your app's dependencies

## Quick Start

```swift
import SwiftUI
import Magic8Ball_iOS_SDK

struct ContentView: View {
    var body: some View {
        Magic8BallView()
    }
}
```

That's it! Your app now has a fully functional Magic 8-Ball.

## Requirements

- **iOS**: 14.0+
- **Xcode**: 12.0+
- **Swift**: 5.3+

## How It Works

The SDK wraps a `WKWebView` that loads the Magic 8-Ball web experience from `https://xvehl58kcb.appflowapp.com/chat`. This approach provides:

- **Dynamic updates**: Content can be updated without App Store reviews
- **Cross-platform consistency**: Same experience across iOS, Android, and Web
- **Rapid iteration**: A/B testing and feature updates without app updates

## Limitations

- Requires internet connection to load the web content
- No offline caching in current version
- Limited customization options (planned for future releases)
- WebView performance characteristics apply

## Demo App

See the [Magic8Ball-iOS-Demo](https://github.com/yourusername/Magic8Ball-iOS-Demo) repository for a complete example of how to integrate the SDK.

## License

MIT License - see LICENSE file for details.
