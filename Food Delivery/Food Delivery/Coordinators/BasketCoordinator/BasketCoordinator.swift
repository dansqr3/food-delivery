import Foundation
import UIKit

final class BasketCoordinator: BasketCoordinatorProtocol {

	var rootViewController: UINavigationController = UINavigationController()

	private var basketViewController = BasketViewController()
	private var basketViewModel: BasketViewModelProtocol = BasketViewModel()

	init() {
		assembly()
	}

	func start() {
		rootViewController.setViewControllers([basketViewController], animated: true)
	}

	private func assembly() {
		basketViewController.basketViewModel = basketViewModel
		basketViewModel.basketCoordinator = self
	}

	func showAlert(in viewController: UIViewController, with sum: Int) {

		let alertController = UIAlertController(
			title: "Спасибо за оплату!",
			message: "\(sum.format()) ₽",
			preferredStyle: .alert
		)

		viewController.present(alertController, animated: true)

		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			alertController.dismiss(animated: true)
		}

	}

}
