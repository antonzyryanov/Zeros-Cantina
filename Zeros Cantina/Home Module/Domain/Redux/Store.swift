//
//  Store.swift
//  Redux-example-ios
//

import SwiftUI
import Combine

final class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>
    private var effectCancellables: Set<AnyCancellable> = []
    
    init(initialState: State, reducer: Reducer<State, Action>) {
        self.state = initialState
        self.reducer = reducer
    }
    
    func send(_ action: Action) {
        guard let effect = reducer.reduce(&state, action) else {
            return
        }
        
        var didComplete = false
        var cancellable: AnyCancellable?
        
        cancellable = effect
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self, weak cancellable] _ in
                    didComplete = true
                    _ = cancellable.map { self?.effectCancellables.remove($0) }
                },
                receiveValue: { [weak self] in self?.send($0) })
        
        if !didComplete, let cancellable = cancellable {
            effectCancellables.insert(cancellable)
        }
    }
}

extension Store {
    func binding<Value>(for keyPath: KeyPath<State, Value>,
                        _ action: @escaping (Value) -> Action) -> Binding<Value> {
        Binding<Value>(
            get: { self.state[keyPath: keyPath] },
            set: { self.send(action($0)) }
        )
    }
    
    func binding<Value>(getValue: @escaping (_ state: State) -> Value,
                        _ action: @escaping (Value) -> Action) -> Binding<Value> {
        Binding<Value>(
            get: { getValue(self.state) },
            set: { self.send(action($0)) }
        )
    }
    
    func nestedBinding<Value, NestedValue>(for keyPath: KeyPath<State, Value>,
                                           nestedKeypath: KeyPath<Value, NestedValue>,
                                           _ action: @escaping (NestedValue) -> Action) -> Binding<NestedValue> {
        Binding<NestedValue>(
            get: { self.state[keyPath: keyPath][keyPath: nestedKeypath] },
            set: { self.send(action($0)) }
        )
    }
}
