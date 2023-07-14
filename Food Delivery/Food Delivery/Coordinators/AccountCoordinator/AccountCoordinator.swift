import Foundation
import UIKit

final class AccountCoordinator: AccountCoordinatorProtocol {

	var rootViewController: UINavigationController = UINavigationController()
	private var accountViewController = AccountViewController()
	private var accountViewModel: AccountViewModelProtocol = AccountViewModel()

	init() {
		assembly()
	}

	func start() {
		rootViewController.setViewControllers([accountViewController], animated: true)
	}

	func assembly() {
		accountViewController.accountViewModel = accountViewModel
	}

}
