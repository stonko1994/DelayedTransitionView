import Foundation

class DelayedPresentationConfiguration: ObservableObject {
    enum DefaultValues {
        static let animationDuration: Double = 0.6
        static let delay: Double = 0.2
        static let offset: Double = 20
    }

    /// Acts as the trigger for the animation
    @Published var isVisible = false

    /// Define the duration of the animation in seconds
    let animationDuration: Double
    /// Define the delay between items in seconds
    let delay: Double
    /// Define the movement when the view appears
    let offset: Double

    init(
        animationDuration: Double,
        delay: Double,
        offset: Double
    ) {
        self.animationDuration = animationDuration
        self.delay = delay
        self.offset = offset
    }
}
