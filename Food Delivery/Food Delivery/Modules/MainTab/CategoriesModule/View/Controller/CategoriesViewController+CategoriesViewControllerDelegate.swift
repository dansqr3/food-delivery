import Foundation
import UIKit

extension CategoriesViewController: CategoriesViewControllerDelegate {

	func buttonAction(target: UIButton) {
		categoriesViewModel?.buttonAction(target: target)
	}

	func cellConfigure(cell: CollectionViewCell, at indexPath: IndexPath) {
		categoriesViewModel?.cellConfigure(cell: cell, at: indexPath)
	}

}
