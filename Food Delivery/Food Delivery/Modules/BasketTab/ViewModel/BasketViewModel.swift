import Foundation
import UIKit

final class BasketViewModel: BasketViewModelProtocol {

	var basketCoordinator: BasketCoordinatorProtocol?

	var updateButtonsTagSignal: Dynamic<[BasketModel]> = Dynamic(value: [])

	private var sum = 0

	var buttonSumSignal: Dynamic<Int> = Dynamic(value: 0)

	private var content: [BasketModel]? {

		let content = Base.shared.currentSettings.content
		setupButtonPrice(content)

		return content
	}

	var numberOfRowsInSection: Int {
		return content?.count ?? 0
	}

	func cellConfigure(cell: BasketTableViewCell, with indexPath: IndexPath) {

		guard let model = content?[indexPath.row] else { return }
		let priceAndCount = Base.shared.currentSettings.priceAndCount[indexPath.row]

		cell.buttonStepperMinus.tag = indexPath.row
		cell.buttonStepperPlus.tag = indexPath.row

		cell.configure(model, priceAndCount)

	}

	func updateCellPrice(in cell: BasketTableViewCell, with type: StepperButtonType, at index: Int) {

		guard let model = content?[index] else { return }

		switch type {
			case .increment:
				cell.currentStepperValue += 1
				Base.shared.currentSettings.priceAndCount[index].count += 1
				cell.priceIncrement(model, cell.currentStepperValue)
			case .decrement:
				cell.currentStepperValue -= 1
				Base.shared.currentSettings.priceAndCount[index].count -= 1
				cell.priceDecrement(model, cell.currentStepperValue)
		}

		setupButtonPrice(content)

	}

	func updateButtonsTag() {

		let newContent = Base.shared.currentSettings.content

		updateButtonsTagSignal.value = newContent

	}

	func payButtonAction(view: UIViewController) {
		basketCoordinator?.showAlert(in: view, with: sum)
	}

	private func setupButtonPrice(_ content: [BasketModel]?) {

		let countAndPrice = Base.shared.currentSettings.priceAndCount

		sum = 0

		countAndPrice.forEach {
			sum += $0.price * $0.count
		}

		buttonSumSignal.value = sum
	}

}
