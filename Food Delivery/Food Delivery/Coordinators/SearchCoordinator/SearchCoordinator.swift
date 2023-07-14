import Foundation
import UIKit

final class SearchCoordinator: SearchCoordinatorProtocol {

	var rootViewController: UINavigationController = UINavigationController()
	private var searchViewController = SearchViewController()
	private var searchViewModel: SearchViewModelProtocol = SearchViewModel()

	init() {
		assembly()
	}

	func start() {
		rootViewController.setViewControllers([searchViewController], animated: true)
	}

	private func assembly() {
		searchViewController.searchViewModel = searchViewModel
	}

}
