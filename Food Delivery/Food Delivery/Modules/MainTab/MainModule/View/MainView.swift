import UIKit

final class MainView: UIView {

	weak var mainViewControllerDelegate: MainViewControllerDelegate?

	var bakeriesButton: UIButton!
	var fastFoodButton: UIButton!
	var asiaButton: UIButton!
	var soupButton: UIButton!
	private var stackView: UIStackView!

	private let bakeries = UIImage(named: Constants.Image.Bakeries.bakeries)
	private let bakeriesTitle = UIImageView(image: UIImage(named: Constants.Image.Bakeries.preview))

	private let fastFood = UIImage(named: Constants.Image.FastFood.fastFood)
	private let fastFoodTitle = UIImageView(image: UIImage(named: Constants.Image.FastFood.preview))

	private let asia = UIImage(named: Constants.Image.Asia.asia)
	private let asiaTitle = UIImageView(image: UIImage(named: Constants.Image.Asia.preview))

	private let soup = UIImage(named: Constants.Image.Soup.soup)
	private let soupTitle = UIImageView(image: UIImage(named: Constants.Image.Soup.preview))


	override init(frame: CGRect) {
		super.init(frame: frame)

		setupViews()
		setupHierarchy()
		setupConstraints()
		addTargets()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupViews() {

		bakeriesButton = UIButton(
			image: bakeries ?? UIImage(),
			backgroundColor: .init(named: Constants.Color.Categories.bakeries) ?? .systemGray3,
			cornerRadius: Constants.cornerRadius,
			clipsToBounds: true
		)

		fastFoodButton = UIButton(
			image: fastFood ?? UIImage(),
			backgroundColor: .init(named: Constants.Color.Categories.fastfood) ?? .systemGray3,
			cornerRadius: Constants.cornerRadius,
			clipsToBounds: true
		)

		asiaButton = UIButton(
			image: asia ?? UIImage(),
			backgroundColor: .init(named: Constants.Color.Categories.asia) ?? .systemGray3,
			cornerRadius: Constants.cornerRadius,
			clipsToBounds: true
		)

		soupButton = UIButton(
			image: soup ?? UIImage(),
			backgroundColor: .init(named: Constants.Color.Categories.soup) ?? .systemGray3,
			cornerRadius: Constants.cornerRadius,
			clipsToBounds: true
		)

		stackView = UIStackView(
			axis: .vertical,
			spacing: 8,
			distribution: .fillEqually
		)

	}

	private func setupHierarchy() {

		bakeriesButton.addSubview(bakeriesTitle)
		fastFoodButton.addSubview(fastFoodTitle)
		asiaButton.addSubview(asiaTitle)
		soupButton.addSubview(soupTitle)

		stackView.addArrangedSubview(bakeriesButton)
		stackView.addArrangedSubview(fastFoodButton)
		stackView.addArrangedSubview(asiaButton)
		stackView.addArrangedSubview(soupButton)

		addSubview(stackView)
	}

	private func setupConstraints() {

		[
			stackView,

			bakeriesTitle,
			fastFoodTitle,
			asiaTitle,
			soupTitle,

		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
		}

		NSLayoutConstraint.activate([
			bakeriesTitle.topAnchor.constraint(equalTo: bakeriesButton.topAnchor, constant: 12),
			bakeriesTitle.leadingAnchor.constraint(equalTo: bakeriesButton.leadingAnchor, constant: 16),

			fastFoodTitle.topAnchor.constraint(equalTo: fastFoodButton.topAnchor, constant: 12),
			fastFoodTitle.leadingAnchor.constraint(equalTo: fastFoodButton.leadingAnchor, constant: 16),

			asiaTitle.topAnchor.constraint(equalTo: asiaButton.topAnchor, constant: 12),
			asiaTitle.leadingAnchor.constraint(equalTo: asiaButton.leadingAnchor, constant: 16),

			soupTitle.topAnchor.constraint(equalTo: soupButton.topAnchor, constant: 12),
			soupTitle.leadingAnchor.constraint(equalTo: soupButton.leadingAnchor, constant: 16),

			stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
			stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
			stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
			stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
		])
	}

	private func addTargets() {

		bakeriesButton.addTarget(
			self,
			action: #selector(bakeriesButtonAction),
			for: .touchUpInside
		)

		fastFoodButton.addTarget(
			self,
			action: #selector(fastFoodButtonAction),
			for: .touchUpInside
		)

		asiaButton.addTarget(
			self,
			action: #selector(asiaButtonAction),
			for: .touchUpInside
		)

		soupButton.addTarget(
			self,
			action: #selector(soupButtonAction),
			for: .touchUpInside
		)

	}

	@objc private func bakeriesButtonAction() {
		mainViewControllerDelegate?.bakeriesButtonAction()
	}
	@objc private func fastFoodButtonAction() {
		mainViewControllerDelegate?.fastFoodButtonAction()
	}
	@objc private func asiaButtonAction() {
		mainViewControllerDelegate?.asiaButtonAction()
	}
	@objc private func soupButtonAction() {
		mainViewControllerDelegate?.soupButtonAction()
	}

}
