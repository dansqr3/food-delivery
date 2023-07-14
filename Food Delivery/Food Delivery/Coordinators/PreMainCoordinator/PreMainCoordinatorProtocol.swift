import Foundation
import UIKit

protocol PreMainCoordinatorProtocol: AppCoordinatorProtocol {

	var rootViewController: UITabBarController { get }

	var coordinators: [AppCoordinatorProtocol] { get }

}
