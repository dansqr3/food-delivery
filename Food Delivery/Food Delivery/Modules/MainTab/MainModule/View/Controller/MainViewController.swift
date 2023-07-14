import UIKit

final class MainViewController: UIViewController {

	var mainViewModel: MainViewModelProtocol?
	private let mainView = MainView()

	private var customView: UIView!

	override func loadView() {
		view = mainView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setupViews()
		setupDelegate()

		makeRequest()

	}


	private func setupViews() {

		let date = Date()
		customView = createCustomNavigationBar(
			city: "Санкт-Петербург",
			date: date.toString
		)
		navigationItem.titleView = customView

	}

	private func setupDelegate() {
		mainView.mainViewControllerDelegate = self
	}

	private func makeRequest() {
		mainViewModel?.getContent()
	}

}
