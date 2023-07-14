import Foundation
import UIKit

protocol BasketCoordinatorProtocol: AppCoordinatorProtocol {

	var rootViewController: UINavigationController { get }

	func showAlert(in viewController: UIViewController, with sum: Int)

}
