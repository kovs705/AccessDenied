<div align="center">
  <img width="300" height="300" src="/Assets/AccessDenied.png" alt="">
  <h1><b>AccessDenied</b></h1>
  <p>
    Library to hide sensitive views
    <br>
    <i>Compatible with iOS 15.0 and later</i>
  </p>
</div>

<div align="center">
  <a href="https://swift.org">
<!--     <img src="https://img.shields.io/badge/Swift-5.9%20%7C%206-orange.svg" alt="Swift Version"> -->
    <img src="https://img.shields.io/badge/Swift-6.1-orange.svg" alt="Swift Version">
  </a>
  <a href="https://www.apple.com/ios/">
    <img src="https://img.shields.io/badge/iOS-15%2B-blue.svg" alt="iOS">
  </a>
  <a href="LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License: MIT">
  </a>
</div>

# AccessDenied

A SwiftUI library that helps protect sensitive content in your iOS apps by automatically hiding content when the app goes to the background or when a screenshot is taken.

## Features

- Multiple privacy styles to choose from:
  - Default
  - Redacted
  - Blur
  - Opacity
  - Custom (with customizable color and corner radius)
- Automatic content protection when app goes to background
- Easy to use SwiftUI view modifier
- iOS 15+ support

## Installation

### Swift Package Manager

Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/kovs705/AccessDenied.git", from: "1.0.0")
]
```

Or add it directly in Xcode:
1. Go to File > Add Packages
2. Enter the repository URL: `https://github.com/kovs705/AccessDenied.git`
3. Click Add Package

## Usage

Simply add the `privacySensitive` modifier to any view you want to protect:

```swift
import SwiftUI
import AccessDenied

struct ContentView: View {
    var body: some View {
        Text("Sensitive Content")
            .privacySensitive(.blur)
    }
}
```

### Available Styles

```swift
// Default style
.privacySensitive(.default)

// Redacted style
.privacySensitive(.redacted)

// Blur style
.privacySensitive(.blur)

// Opacity style
.privacySensitive(.opacity)

// Custom style with color and corner radius
.privacySensitive(.custom(color: .black, cornerRadius: 10))

// Disable privacy protection
.privacySensitive(.default, isEnabled: false)
```

## Requirements

- iOS 15.0+
- Swift 6.1+

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/kovs705/AccessDenied/issues) page
2. Create a new issue with detailed information
3. Include device model, iOS version, and code samples
