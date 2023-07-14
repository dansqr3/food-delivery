import Foundation
import UIKit

extension CategoriesView: CategoriesViewDelegate {

	func buttonAction(target: UIButton) {
		categoriesViewControllerDelegate?.buttonAction(target: target)
	}

}
