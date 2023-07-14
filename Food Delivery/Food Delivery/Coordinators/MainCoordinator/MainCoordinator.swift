import Foundation
import UIKit

final class MainCoordinator: MainCoordinatorProtocol {

	private let backgroundView = UIView()

	var rootViewController: UINavigationController = UINavigationController()
	private var mainViewController = MainViewController()
	private var mainViewModel: MainViewModelProtocol = MainViewModel()

	init() {
		assembly()
	}

	func start() {
		rootViewController.setViewControllers([mainViewController], animated: true)
	}

	private func assembly() {
		mainViewController.mainViewModel = mainViewModel
		mainViewModel.mainCoordinator = self
	}

	func show(_ type: CategoriesType, with content: [Dish]?) {
		let categoriesViewController = CategoriesViewController(type: type)
		let categoriesViewModel = CategoriesViewModel(content: content)

		categoriesViewController.categoriesViewModel = categoriesViewModel
		categoriesViewModel.mainCoordinator = self

		rootViewController.pushViewController(categoriesViewController, animated: true)
	}

	func popViewController() {
		rootViewController.popViewController(animated: true)
	}

	func showAlertCard(on viewController: UIViewController, with content: Dish) {

		guard let view = viewController.view else { return }

		backgroundView.backgroundColor = .black
		backgroundView.alpha = 0
		backgroundView.frame = view.bounds

		let card = CardView(content: content)
		card.alpha = 0

		var cardViewViewModel: CardViewViewModelProtocol = CardViewViewModel(content: content)
		cardViewViewModel.mainCoordinator = self

		card.cardViewViewModel = cardViewViewModel

		view.addSubview(backgroundView)
		view.addSubview(card)

		card.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			card.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			card.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			card.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
			card.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),

			card.heightAnchor.constraint(greaterThanOrEqualToConstant: 446),
			card.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			card.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])

		UIView.animate(withDuration: 0.25) { [weak self] in
			guard let self else { return }
			card.alpha = 1
			self.backgroundView.alpha = 0.4
		}

	}

	func dismissAlertCard() {
		UIView.animate(withDuration: 0.25) { [weak self] in
			guard let self else { return }
			self.backgroundView.alpha = 0
		}
	}

}
