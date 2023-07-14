import Foundation

protocol MainViewModelProtocol {

	var mainCoordinator: MainCoordinatorProtocol? { get set }

	func showBakeries()
	func showFastFood()
	func showAsia()
	func showSoup()

	func getContent()

}
