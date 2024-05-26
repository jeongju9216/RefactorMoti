//
//  UIView+Combine.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/29/24.
//

import UIKit
import Combine

extension UIView {
    
    func publisher(for gestureType: GestureType) -> GesturePublisher {
        GesturePublisher(view: self, gestureType: gestureType)
    }
}

// MARK: - Publisher

struct GesturePublisher: Publisher {
    
    typealias Output = GestureType
    typealias Failure = Never
    
    // MARK: Interface
    
    func receive<S>(subscriber: S) where S: Subscriber,
                                         GesturePublisher.Failure == S.Failure,
                                         GesturePublisher.Output == S.Input {
        let subscription = GestureSubscription(
            subscriber: subscriber,
            view: view,
            gestureType: gestureType
        )
        subscriber.receive(subscription: subscription)
    }
    
    // MARK: Attribute
    
    private let view: UIView
    private let gestureType: GestureType
    
    // MARK: Initialization
    
    init(view: UIView, gestureType: GestureType) {
        self.view = view
        self.gestureType = gestureType
    }
}

// MARK: - Subscription

final class GestureSubscription<S: Subscriber>: Subscription where S.Input == GestureType, S.Failure == Never {

    // MARK: Interface
    
    func request(_ demand: Subscribers.Demand) { }
    
    func cancel() {
        subscriber = nil
    }
    
    // MARK: Attribute
    
    private var subscriber: S?
    private var gestureType: GestureType
    private var view: UIView
    
    // MARK: - Initializer
    
    init(subscriber: S, view: UIView, gestureType: GestureType) {
        self.subscriber = subscriber
        self.view = view
        self.gestureType = gestureType
        configureGesture(gestureType)
    }
    
    private func configureGesture(_ gestureType: GestureType) {
        let gesture = gestureType.recognizer()
        gesture.addTarget(self, action: #selector(handler))
        view.addGestureRecognizer(gesture)
    }
    
    @objc
    private func handler() {
        _ = subscriber?.receive(gestureType)
    }
}

// MARK: - GestureType

enum GestureType {

    case tap(UITapGestureRecognizer = .init())
    case swipe(UISwipeGestureRecognizer = .init())
    case longPress(UILongPressGestureRecognizer = .init())
    case pan(UIPanGestureRecognizer = .init())
    case pinch(UIPinchGestureRecognizer = .init())
    case edge(UIScreenEdgePanGestureRecognizer = .init())

    func recognizer() -> UIGestureRecognizer {
        switch self {
        case let .tap(tapGesture):
            return tapGesture
        case let .swipe(swipeGesture):
            return swipeGesture
        case let .longPress(longPressGesture):
            return longPressGesture
        case let .pan(panGesture):
            return panGesture
        case let .pinch(pinchGesture):
            return pinchGesture
        case let .edge(edgePanGesture):
            return edgePanGesture
       }
    }
}
