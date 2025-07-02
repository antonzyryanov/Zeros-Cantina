//
//  Reducer.swift

import Foundation
import Combine

struct Reducer<State, Action> {
    let reduce: (inout State, Action) -> AnyPublisher<Action, Never>?
}

extension Reducer {
    static func updateOptionalArrayStateField<State, T: Identifiable, N: Identifiable>(
        _ state: inout State,
        keyPath: WritableKeyPath<State, Array<T>>,
        object: T,
        nestedKeypath: WritableKeyPath<T, Array<N>?>,
        arrayToUpdate: [N]
    ) {
        var objectFomState = state[keyPath: keyPath].findObject(object)
        objectFomState[keyPath: nestedKeypath] = arrayToUpdate
        state[keyPath: keyPath] = state[keyPath: keyPath].arrayByUpdatingItem(objectFomState)
    }
    
    static func updateStateNestedField<State, T: Identifiable, N: Identifiable>(
        _ state: inout State,
        keyPath: WritableKeyPath<State, Array<T>>,
        object: T,
        nestedKeypath: WritableKeyPath<T, Array<N>?>,
        itemToUpdate: N
    ) {
        var objectFomState = state[keyPath: keyPath].findObject(object)
        objectFomState[keyPath: nestedKeypath] = objectFomState[keyPath: nestedKeypath]?.arrayByUpdatingItem(itemToUpdate) ?? [itemToUpdate]
        state[keyPath: keyPath] = state[keyPath: keyPath].arrayByUpdatingItem(objectFomState)
    }
}
