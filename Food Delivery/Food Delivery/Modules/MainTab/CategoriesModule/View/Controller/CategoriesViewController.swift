import UIKit

final class CategoriesViewController: UIViewController {

	var type: CategoriesType
	var categoriesViewModel: CategoriesViewModelProtocol?
	private var categoriesView = CategoriesView()

	override func loadView() {
		view = categoriesView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setupViews()

		setupBind()

	}

	init(type: CategoriesType) {
		self.type = type

		super.init(nibName: nil, bundle: nil)

		setupDelegate()
		configure(type)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupBind() {

		categoriesViewModel?.tagSignal.bind { [weak self] (button, isOn) in
			guard let self else { return }
			setPickButton(button: button, tag: isOn)
		}

		categoriesViewModel?.productsSignal.bind { [weak self] _ in
			guard let self else { return }
			self.categoriesView.collectionView.reloadData()
		}

		}

	private func setupDelegate() {
		categoriesView.categoriesViewControllerDelegate = self
		categoriesView.collectionView.dataSource = self
		categoriesView.collectionView.delegate = self
	}

	private func setupViews() {

		view.backgroundColor = .systemBackground

		let leftBarButtonItem = UIBarButtonItem(
			image: Constants.TabBar.Navigation.backwardImage,
			style: .plain,
			target: self,
			action: #selector(leftBarButtonItemAction)
		)

		navigationItem.leftBarButtonItem = leftBarButtonItem

		let rightBarButtonItem = UIBarButtonItem(
			image: Constants.TabBar.Navigation.photo
		)

		navigationItem.rightBarButtonItem = rightBarButtonItem

	}

	private func configure(_ type: CategoriesType) {
		switch type {
			case .bakeries:
				bakeriesConfigure()
			case .fastFood:
				fastFoodConfigure()
			case .asia:
				asiaConfigure()
			case .soup:
				soupConfigure()
		}

	}

	private func setPickButton(button: UIButton, tag: Bool) {

		switch tag {
			case false:
				button.backgroundColor = UIColor(named: Constants.Color.ButtonTag.highlighted)
				button.setTitleColor(.systemBackground, for: .normal)
			case true:
				button.backgroundColor = UIColor(named: Constants.Color.ButtonTag.background)
				button.setTitleColor(.label, for: .normal)
		}
	}

	private func bakeriesConfigure() {
		title = Constants.Title.Categories.bakeries
	}

	private func fastFoodConfigure() {
		title = Constants.Title.Categories.fastFood
	}

	private func asiaConfigure() {
		title = Constants.Title.Categories.asia
	}

	private func soupConfigure() {
		title = Constants.Title.Categories.soup
	}

	@objc private func leftBarButtonItemAction() {
		navigationController?.popViewController(animated: true)
	}

}
