import UIKit

final class MainTabBarController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()

		setupTabBar()

	}

	private func setupTabBar() {

		Base.shared.currentSettings.width = view.frame.width

		view.backgroundColor = .systemBackground

	}

}
