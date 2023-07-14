import Foundation
import Combine

final class CardViewViewModel: CardViewViewModelProtocol {

	var mainCoordinator: MainCoordinatorProtocol?

	var content: Dish?

	init(content: Dish) {
		self.content = content
	}

	func closeButtonAction() {
		mainCoordinator?.dismissAlertCard()
	}

	func addCardButtonAction(with content: Dish) {

		let basketModel = BasketModel(
			name: content.name ?? "",
			price: content.price ?? 0,
			weight: content.weight ?? 0,
			description: content.description ?? "",
			imageURL: content.imageURL ?? "",
			count: 1
		)

		let priceModel = CustomStepperModel(
			price: content.price ?? 0,
			count: 1)

		Base.shared.currentSettings.content.append(basketModel)
		Base.shared.currentSettings.priceAndCount.append(priceModel)

		makeNotification()

	}

	private func makeNotification() {

		NotificationCenter.default.post(
			name: NSNotification.Name(Constants.NotificationName.basketTable),
			object: nil
		)

	}

}
