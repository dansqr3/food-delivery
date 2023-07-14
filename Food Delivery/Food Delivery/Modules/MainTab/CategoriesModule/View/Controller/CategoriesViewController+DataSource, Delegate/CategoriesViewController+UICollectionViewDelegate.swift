import Foundation
import UIKit

extension CategoriesViewController: UICollectionViewDelegate {

	func collectionView(
		_ collectionView: UICollectionView,
		didSelectItemAt indexPath: IndexPath
	) {

		categoriesViewModel?.didSelectItem(on: self, at: indexPath)

	}

}
