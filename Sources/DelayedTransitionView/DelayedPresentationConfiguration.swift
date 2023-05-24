import SwiftUI

class DelayedPresentationConfiguration: ObservableObject {
    enum DefaultValues {
        static let animationDuration: Double = 0.6
        static let delay: Double = 0.2
        static let offset: Double = 20
        static let orientation: Axis.Set = .vertical
    }

    /// Acts as the trigger for the animation
    @Published var isVisible = false

    /// Define the duration of the animation in seconds
    let animationDuration: Double
    /// Define the delay between items in seconds
    let delay: Double
    /// Define the movement when the view appears
    let offset: Double
    /// Define the orientation when the view appears
    let orientation: Axis.Set

    init(
        animationDuration: Double,
        delay: Double,
        offset: Double,
        orientation: Axis.Set
    ) {
        self.animationDuration = animationDuration
        self.delay = delay
        self.offset = offset
        self.orientation = orientation
    }
}
