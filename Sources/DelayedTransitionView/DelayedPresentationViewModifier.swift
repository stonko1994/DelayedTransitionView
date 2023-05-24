import SwiftUI

struct DelayedPresentationViewModifier: ViewModifier {
    @EnvironmentObject var delayedPresentationState: DelayedPresentationConfiguration

    let viewNumber: Int
    let showAnimationDuration: Double?
    let itemDelay: Double?
    let offset: Double?
    let orientation: Axis.Set?

    func body(content: Content) -> some View {
        content
            .opacity(delayedPresentationState.isVisible ? 1 : 0)
            .modifier(ConditionalOffsetViewModifier(offset: offset, orientation: orientation))
            .animation(
                .easeOut(duration: showAnimationDuration ?? delayedPresentationState.animationDuration)
                    .delay(0.1 + (Double(viewNumber) * (itemDelay ?? delayedPresentationState.delay))),
                value: delayedPresentationState.isVisible
            )
    }
}

private struct ConditionalOffsetViewModifier: ViewModifier {
    @EnvironmentObject var delayedPresentationState: DelayedPresentationConfiguration

    let offset: Double?
    let orientation: Axis.Set?

    func body(content: Content) -> some View {
        if (orientation ?? delayedPresentationState.orientation) == .vertical {
            content
                .offset(y: delayedPresentationState.isVisible ? 0 : (offset ?? delayedPresentationState.offset))
        } else {
            content
                .offset(x: delayedPresentationState.isVisible ? 0 : (offset ?? delayedPresentationState.offset))
        }
    }
}

public extension View {
    /// Enables the view to be transitioned. Must be used within a `DelayedTransitionView`
    /// - Parameters:
    ///   - viewIndex: The index of the view. Starts at `0`.
    ///   - animationDuration: The duration of the animation in seconds. Default `0.6`. Overrides the value of `DelayedTransitionView`.
    ///   - delay: The delay before the animation starts. Default `0.2`. Overrides the value of `DelayedTransitionView`.
    ///   - offset: The `y` offset for the view which will be animated. Default is `20`. Overrides the value of `DelayedTransitionView`.
    ///   - orientation: The orientation in which the view should appear. Default is `.vertical`. Overrides the value of `DelayedTransitionView`.
    func delayedPresentation(
        viewIndex: Int,
        animationDuration: Double? = nil,
        delay: Double? = nil,
        offset: Double? = nil,
        orientation: Axis.Set? = nil
    ) -> some View {
        modifier(
            DelayedPresentationViewModifier(
                viewNumber: viewIndex,
                showAnimationDuration: animationDuration,
                itemDelay: delay,
                offset: offset,
                orientation: orientation
            )
        )
    }
}
