import SwiftUI

/// Provides delayed visibility transitions.
public struct DelayedTransitionView<Content: View>: View {
    @StateObject private var delayedPresentationConfiguration: DelayedPresentationConfiguration

    private let content: () -> Content

    /// Provides delayed visibility transitions.
    /// - Parameters:
    ///   - animationDuration: The duration of the animation in seconds. Default `0.6`
    ///   - delay: The delay before the animation starts. Default `0.2`
    ///   - offset: The `y` offset for the view which will be animated. Default is `20`
    ///   - orientation: The orientation in which the view should appear. Default is `.vertical`
    ///   - replayOnReappear: Replay the animation when this container reappears. Default `false`.
    ///     The initial appearance always animates. Enable to replay subsequent appearances, such as switching tabs.
    ///     Leave it disabled when returning to an existing screen should preserve visual continuity,
    ///     such as navigation back from a detail screen.
    ///     This observes the container's lifecycle, not each child's appearance. Wrap a `NavigationStack`
    ///     to replay on tab re-entry without replaying when navigating back from a detail screen.
    ///   - content: A view builder that creates the content of this stack.
    public init(
        animationDuration: Double? = nil,
        delay: Double? = nil,
        offset: Double? = nil,
        orientation: Axis.Set? = nil,
        replayOnReappear: Bool? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content

        let configuration = DelayedPresentationConfiguration(
            animationDuration: animationDuration ?? DelayedPresentationConfiguration.DefaultValues.animationDuration,
            delay: delay ?? DelayedPresentationConfiguration.DefaultValues.delay,
            offset: offset ?? DelayedPresentationConfiguration.DefaultValues.offset,
            orientation: orientation ?? DelayedPresentationConfiguration.DefaultValues.orientation,
            replayOnReappear: replayOnReappear ?? DelayedPresentationConfiguration.DefaultValues.replayOnReappear
        )
        self._delayedPresentationConfiguration = StateObject(wrappedValue: configuration)
    }

    public var body: some View {
        content()
            .environmentObject(delayedPresentationConfiguration)
            .onAppear {
                delayedPresentationConfiguration.isVisible = true
            }
            .onDisappear {
                guard delayedPresentationConfiguration.replayOnReappear else { return }

                // Reset immediately without any animation
                var transaction = Transaction(animation: nil)
                transaction.disablesAnimations = true
                withTransaction(transaction) {
                    delayedPresentationConfiguration.isVisible = false
                }
            }
    }
}

struct DelayedTransitionView_Preview: PreviewProvider {
    static var previews: some View {
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
    }
}
