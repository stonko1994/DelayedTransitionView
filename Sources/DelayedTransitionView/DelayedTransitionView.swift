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
    ///   - content: A view builder that creates the content of this stack.
    public init(
        animationDuration: Double? = nil,
        delay: Double? = nil,
        offset: Double? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content

        let configuration = DelayedPresentationConfiguration(
            animationDuration: animationDuration ?? DelayedPresentationConfiguration.DefaultValues.animationDuration,
            delay: delay ?? DelayedPresentationConfiguration.DefaultValues.delay,
            offset: offset ?? DelayedPresentationConfiguration.DefaultValues.offset
        )
        self._delayedPresentationConfiguration = StateObject(wrappedValue: configuration)
    }

    public var body: some View {
        content()
            .environmentObject(delayedPresentationConfiguration)
            .onAppear {
                delayedPresentationConfiguration.isVisible = true
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
