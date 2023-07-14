import Foundation
import Combine

protocol CardViewViewModelProtocol {

	var mainCoordinator: MainCoordinatorProtocol? { get set }

	func closeButtonAction()

	func addCardButtonAction(with content: Dish)

}
