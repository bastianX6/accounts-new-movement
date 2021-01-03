//
//  MovementPreview.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import Combine
import DataManagement

class MovementPreview: DataSourceModify {
    var saveSuccess = true
    var deleteSuccess = true
    var updateSuccess = true

    var saveCalled = false
    var deleteCalled = false
    var updateCalled = false

    private var movements: [Movement] = []

    func save(movement: Movement) -> AnyPublisher<Void, Error> {
        self.saveCalled = true
        let future = Future<Void, Error>() { [weak self] promise in
            guard let strongSelf = self else {
                return promise(.failure(MovementPreviewError.other))
            }

            if strongSelf.saveSuccess {
                strongSelf.movements.append(movement)
                promise(.success(()))
            } else {
                promise(.failure(MovementPreviewError.other))
            }
        }
        return future.eraseToAnyPublisher()
    }

    func delete(movement: Movement) -> AnyPublisher<Void, Error> {
        self.deleteCalled = true
        let future = Future<Void, Error>() { [weak self] promise in
            guard let strongSelf = self else {
                return promise(.failure(MovementPreviewError.other))
            }

            if strongSelf.deleteSuccess {
                strongSelf.movements.removeAll(where: { $0.id == movement.id })
                promise(.success(()))
            } else {
                promise(.failure(MovementPreviewError.other))
            }
        }
        return future.eraseToAnyPublisher()
    }

    func update(movement: Movement) -> AnyPublisher<Void, Error> {
        self.updateCalled = true
        let future = Future<Void, Error>() { [weak self] promise in
            guard let strongSelf = self else {
                return promise(.failure(MovementPreviewError.other))
            }

            if strongSelf.updateSuccess {
                strongSelf.movements.removeAll(where: { $0.id == movement.id })
                strongSelf.movements.append(movement)
                promise(.success(()))
            } else {
                promise(.failure(MovementPreviewError.other))
            }
        }
        return future.eraseToAnyPublisher()
    }
}

enum MovementPreviewError: Error {
    case other
}
