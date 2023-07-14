import Foundation
import UIKit

protocol MainCoordinatorProtocol: AppCoordinatorProtocol {

	var rootViewController: UINavigationController { get }

	func show(_ type: CategoriesType, with content: [Dish]?)

	func popViewController()

	func showAlertCard(on viewController: UIViewController, with content: Dish)

	func dismissAlertCard()

}
