import UIKit

final class CategoriesCollectionView: UICollectionView {

	weak var categoriesViewDelegate: CategoriesViewDelegate?

	init() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		super.init(frame: .zero, collectionViewLayout: layout)

		layout.minimumLineSpacing = 14
		layout.minimumInteritemSpacing = 8

		let width: CGFloat = Base.shared.currentSettings.width
		layout.itemSize = .init(width: width / 3 - 16, height:  25 + width / 3)

		setupCollectionView()
		cellRegister()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupCollectionView() {
		showsVerticalScrollIndicator = false
	}


	private func cellRegister() {
		register(
			CollectionViewCell.self,
			forCellWithReuseIdentifier: Constants.CellIdentifier.collectionCell
		)
	}

}
