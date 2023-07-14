import Foundation
import UIKit

protocol CategoriesViewModelProtocol {

	var mainCoordinator: MainCoordinatorProtocol? { get }

	var productsSignal: Dynamic<[Dish]> { get set }
	var tagSignal: Dynamic<(UIButton, Bool)> { get set }

	func buttonAction(target: UIButton)

	// MARK: - Collection data source, delegate
	var numberOfItemsInSection: Int { get }
	func cellConfigure(cell: CollectionViewCell, at indexPath: IndexPath)

	func didSelectItem(on viewController: UIViewController, at indexPath: IndexPath)

}
