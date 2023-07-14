import Foundation

final class MainViewModel: MainViewModelProtocol {

	var mainCoordinator: MainCoordinatorProtocol?

	private let networkService: NetworkServiceProtocol = NetworkService()
	var source: [Dish]?

	func showBakeries() {
		mainCoordinator?.show(.bakeries, with: source)
	}

	func showFastFood() {
		mainCoordinator?.show(.fastFood, with: source)
	}

	func showAsia() {
		mainCoordinator?.show(.asia, with: source)
	}

	func showSoup() {
		mainCoordinator?.show(.soup, with: source)
	}

	func getContent() {
		networkService.getContent(from: Constants.Urls.categoriesApi) { [weak self] result in
			guard let self else { return }

			switch result {
				case .success(let dish):
					self.source = dish
				case .failure(let error):
					print(error)
			}
		}
	}

}
