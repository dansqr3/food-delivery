import Foundation
import UIKit

extension CategoriesViewController: UICollectionViewDataSource {

	func collectionView(
		_ collectionView: UICollectionView,
		numberOfItemsInSection section: Int
	) -> Int {
		categoriesViewModel?.numberOfItemsInSection ?? 0
	}

	func collectionView(
		_ collectionView: UICollectionView,
		cellForItemAt indexPath: IndexPath
	) -> UICollectionViewCell {

		guard let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: Constants.CellIdentifier.collectionCell,
			for: indexPath
		) as? CollectionViewCell else { return UICollectionViewCell() }

		categoriesViewModel?.cellConfigure(cell: cell, at: indexPath)

		return cell
	}

}
