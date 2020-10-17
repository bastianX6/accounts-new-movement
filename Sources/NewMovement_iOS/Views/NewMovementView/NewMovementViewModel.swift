//
//  NewMovementBaseManager.swift
//
//
//  Created by Bastián Véliz Vega on 17-09-20.
//

import AccountsUI
import Combine
import DataManagement
import Foundation

class NewMovementViewModel: ObservableObject {
    // MARK: - UI management

    @Published var model: NewMovementViewInternal.DataModel
    @Published var state: NewMovementViewState = NewMovementInitialState()

    private lazy var savingState: NewMovementViewState = NewMovementSavingState(viewModel: self)
    private lazy var errorState: NewMovementViewState = NewMovementErrorState(viewModel: self)
    private(set) lazy var endState = NewMovementEndState(viewModel: self)

    private var dataSource: DataSourceModify
    var isIncome: Bool = false {
        didSet {
            self.updateIsIncome()
        }
    }

    private let incomeData: MovementResources
    private let expeditureData: MovementResources

    var stores: [CategoryStoreModel] {
        return self.isIncome ? self.incomeData.stores : self.expeditureData.stores
    }

    var categories: [CategoryStoreModel] {
        return self.isIncome ? self.incomeData.categories : self.expeditureData.categories
    }

    init(model: NewMovementViewInternal.DataModel,
         dataSource: DataSourceModify,
         incomeData: MovementResources,
         expeditureData: MovementResources,
         onEnd: @escaping () -> Void) {
        self.model = model
        self.dataSource = dataSource
        self.incomeData = incomeData
        self.expeditureData = expeditureData
        self.endState.onEnd = onEnd
    }

    convenience init(dataSource: DataSourceModify,
                     incomeData: MovementResources,
                     expeditureData: MovementResources,
                     onEnd: @escaping () -> Void) {
        let model = NewMovementViewInternal.DataModel(currentStore: UUID(),
                                                      currentCategory: UUID())
        self.init(model: model,
                  dataSource: dataSource,
                  incomeData: incomeData,
                  expeditureData: expeditureData,
                  onEnd: onEnd)
    }

    func setState(_ state: NewMovementViewStateEnum) {
        switch state {
        case .saving:
            self.state = self.savingState
        case .error:
            self.state = self.errorState
        case .end:
            self.state = self.endState
            self.state.endAction()
        }
    }

    func saveMovement() -> AnyPublisher<Void, Error> {
        let movement = NewMovementAdapter(model: self.model)
        if self.model.isNew {
            return self.dataSource.save(movement: movement)
        } else {
            return self.dataSource.update(movement: movement)
        }
    }

    private func updateIsIncome() {
        self.savingState.isIncome = self.isIncome
        self.errorState.isIncome = self.isIncome
        self.endState.isIncome = self.isIncome
        self.state.isIncome = self.isIncome

        guard self.model.isNew else { return }

        if let currentStore = self.stores.first?.id,
            let currentCategory = self.categories.first?.id {
            self.model = NewMovementViewInternal.DataModel(currentStore: currentStore,
                                                           currentCategory: currentCategory)
        } else {
            fatalError("Can't init NewMovementViewModel with empty store and category arrays")
        }
    }
}
