import Foundation
import UIKit

protocol BasketViewModelProtocol {

	var basketCoordinator: BasketCoordinatorProtocol? { get set }

	var buttonSumSignal: Dynamic<Int> { get set }
	var updateButtonsTagSignal: Dynamic<[BasketModel]> { get set }

	var numberOfRowsInSection: Int { get }

	func cellConfigure(cell: BasketTableViewCell, with indexPath: IndexPath)

	func updateCellPrice(in cell: BasketTableViewCell, with type: StepperButtonType, at index: Int)

	func updateButtonsTag()

	func payButtonAction(view: UIViewController)

}
