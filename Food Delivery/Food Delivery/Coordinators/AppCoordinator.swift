import Foundation
import UIKit

final class AppCoordinator: AppCoordinatorProtocol {

	var coordinators: [AppCoordinatorProtocol] = []

	var window: UIWindow?

	init(window: UIWindow?) {
		self.window = window
	}

	func start() {
		let preMainCoordinator = PreMainCoordinator()
		preMainCoordinator.start()
		coordinators.append(preMainCoordinator)
		window?.rootViewController = preMainCoordinator.rootViewController
	}

}
