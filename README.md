<p align="center">
    <img src="https://github.com/stonko1994/DelayedTransitionView/assets/6216959/d648da53-bfd5-4821-8b89-2b42112e904f)" width="100" height="100"/>
    <h1 align="center">DelayedTransitionView</h1>
    <p align="center">Appear animation transition View for SwiftUI</p>
</p>
<br />

- [Installation](#installation)
    - [Swift Package Manager](#using-swift-package-manager)
- [Usage](#usage)
- [Example](#example)

## Installation
### Using [Swift Package Manager](https://swift.org/package-manager/)
[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift frameworks. It integrates with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

#### Using Xcode
To integrate using Xcode 13, open your Project file and specify it in `Project > Package Dependencies` using the following URL:

```
https://github.com/stonko1994/DelayedTransitionView.git
```

## Usage
```swift
import DelayedTransitionView
```

Add a `DelayedTransitionView` to your view. This view acts as container view for all views that should be animated.

```swift
DelayedTransitionView {
    ...
}
```

_The `DelayedTransitionView` takes additional configuration properties. (See code documentation for details)_ 

Use the `.delayedPresentation(viewIndex: x)` view modifier to specify which views should be animated.

```swift
DelayedTransitionView {
    VStack {
        Spacer()
        Text("First view")
            .delayedPresentation(viewIndex: 0)
        Spacer()
        Text("Second view")
            .delayedPresentation(viewIndex: 1)
        Spacer()
        Text("Third view")
            .delayedPresentation(viewIndex: 2)
        Spacer()
    }
}
```

In this example only the `Text` views will appear be animated.

For more control over the individual animations, checkout the additional configuration properties. (See code documentation for details)
_It is possible to use the same `viewIndex` for multiple views if they should appear at the same time. Also it does not need to start with `0`_

## Example

<p align="center">
    <img src="https://github.com/stonko1994/DelayedTransitionView/assets/6216959/eb3abb8f-e223-4b0f-bada-7330b60464bd)" width="600" height="419"/>
</p>

---

<a href="https://www.buymeacoffee.com/davidsteinacher" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/yellow_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
