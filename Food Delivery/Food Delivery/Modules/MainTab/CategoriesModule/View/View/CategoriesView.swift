import UIKit

final class CategoriesView: UIView {

	weak var categoriesViewControllerDelegate: CategoriesViewControllerDelegate?

	private let tagsScrollView = TagsScrollView()
	var collectionView = CategoriesCollectionView()

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupDelegate()

		setupViews()
		setupHierarchy()
		setupConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupDelegate() {
		tagsScrollView.categoriesViewDelegate = self
		collectionView.categoriesViewDelegate = self
	}

	private func setupViews() {
	}

	private func setupHierarchy() {
		addSubview(tagsScrollView)
		addSubview(collectionView)
	}

	private func setupConstraints() {
		[
			tagsScrollView,
			collectionView,
		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
		}
		NSLayoutConstraint.activate([
			tagsScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
			tagsScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			tagsScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 13),
			tagsScrollView.heightAnchor.constraint(equalToConstant: 35),

			collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
			collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
			collectionView.topAnchor.constraint(equalTo: tagsScrollView.bottomAnchor, constant: 16),
			collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
		])
	}

}
