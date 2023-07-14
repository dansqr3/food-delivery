import UIKit

final class TagsScrollView: UIScrollView {

	weak var categoriesViewDelegate: CategoriesViewDelegate?

	private var stackView: UIStackView!
	private var allMenuButton: UIButton!
	private var saladButton: UIButton!
	private var riceButton: UIButton!
	private var fishButton: UIButton!
	private var rollsButton: UIButton!

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupButtons()
		setupViews()
		setupHierarchy()
		setupConstraints()
		addTargets()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupButtons() {
		allMenuButton = UIButton(
			configuration: .plain(),
			title: Constants.Title.ButtonTag.allMenu,
			titleColorForNormal: .systemBackground,
			titleColorForHighlighted: .systemGray2,
			backgroundColor: UIColor(named: Constants.Color.ButtonTag.highlighted) ?? .systemGray6,
			cornerRadius: Constants.cornerRadius,
			tag: 1
		)

		saladButton = UIButton(
			configuration: .plain(),
			title: Constants.Title.ButtonTag.salad,
			titleColorForNormal: .label,
			titleColorForHighlighted: .systemGray2,
			backgroundColor: UIColor(named: Constants.Color.ButtonTag.background) ?? .systemGray6,
			cornerRadius: Constants.cornerRadius,
			tag: 2
		)

		riceButton = UIButton(
			configuration: .plain(),
			title: Constants.Title.ButtonTag.rice,
			titleColorForNormal: .label,
			titleColorForHighlighted: .systemGray2,
			backgroundColor: UIColor(named: Constants.Color.ButtonTag.background) ?? .systemGray6,
			cornerRadius: Constants.cornerRadius,
			tag: 3
		)

		fishButton = UIButton(
			configuration: .plain(),
			title: Constants.Title.ButtonTag.fish,
			titleColorForNormal: .label,
			titleColorForHighlighted: .systemGray2,
			backgroundColor: UIColor(named: Constants.Color.ButtonTag.background) ?? .systemGray6,
			cornerRadius: Constants.cornerRadius,
			tag: 4
		)

		rollsButton = UIButton(
			configuration: .plain(),
			title: Constants.Title.ButtonTag.rolls,
			titleColorForNormal: .label,
			titleColorForHighlighted: .systemGray2,
			backgroundColor: UIColor(named: Constants.Color.ButtonTag.background) ?? .systemGray6,
			cornerRadius: Constants.cornerRadius,
			tag: 5
		)
	}

	private func setupViews() {

		showsHorizontalScrollIndicator = false

		stackView = UIStackView(
			axis: .horizontal,
			spacing: 8,
			distribution: .fillProportionally
		)

	}

	private func setupHierarchy() {
		stackView.addArrangedSubview(allMenuButton)
		stackView.addArrangedSubview(saladButton)
		stackView.addArrangedSubview(riceButton)
		stackView.addArrangedSubview(fishButton)
		stackView.addArrangedSubview(rollsButton)
		addSubview(stackView)
	}

	private func setupConstraints() {
		stackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
		])
	}

	private func addTargets() {
		[
			allMenuButton,
			saladButton,
			riceButton,
			fishButton,
			rollsButton,
		].forEach {
			$0.addTarget(
				self,
				action: #selector(buttonAction(target:)),
				for: .touchUpInside
			)
		}
	}

	@objc private func buttonAction(target: UIButton) {
		categoriesViewDelegate?.buttonAction(target: target)
	}

}
