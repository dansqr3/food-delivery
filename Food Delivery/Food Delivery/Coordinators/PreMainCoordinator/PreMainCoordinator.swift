import Foundation
import UIKit

final class PreMainCoordinator: PreMainCoordinatorProtocol {

	var rootViewController: UITabBarController = MainTabBarController()

	var coordinators: [AppCoordinatorProtocol] = []

	func start() {

		// MainCoordinator
		let mainCoordinator = MainCoordinator()
		mainCoordinator.start()
		coordinators.append(mainCoordinator)
		let mainViewController = mainCoordinator.rootViewController

		setupViewController(
			viewController: mainViewController,
			title: Constants.TabBar.Title.main,
			image: Constants.TabBar.Image.main,
			selectedImage: Constants.TabBar.SelectedImage.main
		)

		// SearchCoordinator
		let searchCoordinator = SearchCoordinator()
		searchCoordinator.start()
		coordinators.append(searchCoordinator)
		let searchViewController = searchCoordinator.rootViewController

		setupViewController(
			viewController: searchViewController,
			title: Constants.TabBar.Title.search,
			image: Constants.TabBar.Image.search,
			selectedImage: Constants.TabBar.SelectedImage.search
		)

		// BasketCoordinator
		let basketCoordinator = BasketCoordinator()
		basketCoordinator.start()
		coordinators.append(basketCoordinator)
		let basketViewController = basketCoordinator.rootViewController

		setupViewController(
			viewController: basketViewController,
			title: Constants.TabBar.Title.basket,
			image: Constants.TabBar.Image.basket,
			selectedImage: Constants.TabBar.SelectedImage.basket
		)

		// AccountCoordinator
		let accountCoordinator = AccountCoordinator()
		accountCoordinator.start()
		coordinators.append(accountCoordinator)
		let accountViewController = accountCoordinator.rootViewController

		setupViewController(
			viewController: accountViewController,
			title: Constants.TabBar.Title.account,
			image: Constants.TabBar.Image.account,
			selectedImage: Constants.TabBar.SelectedImage.account
		)

		// viewControllers
		rootViewController.viewControllers = [
			mainViewController,
			searchViewController,
			basketViewController,
			accountViewController,
		]

	}

	private func setupViewController(
		viewController: UIViewController,
		title: String,
		image: UIImage?,
		selectedImage: UIImage?
	) {
		viewController.title = title

		viewController.tabBarItem.setTitleTextAttributes(
			[
				NSAttributedString.Key.foregroundColor : UIColor(
					named: Constants.Color.TabBar.normalTabBar
				) ?? .systemGray2
			],
			for: .normal
		)

		viewController.tabBarItem.setTitleTextAttributes(
			[
				NSAttributedString.Key.foregroundColor : UIColor(
					named: Constants.Color.ButtonTag.highlighted
				) ?? .systemGray2
			],
			for: .highlighted
		)

		viewController.tabBarItem.image = image
		viewController.tabBarItem.selectedImage = selectedImage
	}

}
