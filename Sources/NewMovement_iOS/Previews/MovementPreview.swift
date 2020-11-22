//
//  MovementPreview.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import Combine
import DataManagement

class MovementPreview: DataSourceModify {
    private var movements: [Movement] = []

    func save(movement: Movement) -> AnyPublisher<Void, Error> {
        let future = Future<Void, Error>() { [weak self] promise in
            guard let strongSelf = self else {
                return promise(.failure(MovementPreviewError.other))
            }
            strongSelf.movements.append(movement)
            promise(.success(()))
        }
        return future.eraseToAnyPublisher()
    }

    func delete(movement: Movement) -> AnyPublisher<Void, Error> {
        let future = Future<Void, Error>() { [weak self] promise in
            guard let strongSelf = self else {
                return promise(.failure(MovementPreviewError.other))
            }
            strongSelf.movements.removeAll(where: { $0.id == movement.id })
            promise(.success(()))
        }
        return future.eraseToAnyPublisher()
    }

    func update(movement: Movement) -> AnyPublisher<Void, Error> {
        let future = Future<Void, Error>() { [weak self] promise in
            guard let strongSelf = self else {
                return promise(.failure(MovementPreviewError.other))
            }
            strongSelf.movements.removeAll(where: { $0.id == movement.id })
            strongSelf.movements.append(movement)
            promise(.success(()))
        }
        return future.eraseToAnyPublisher()
    }
}

enum MovementPreviewError: Error {
    case other
}
