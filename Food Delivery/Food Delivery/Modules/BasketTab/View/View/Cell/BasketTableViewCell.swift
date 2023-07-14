import UIKit

final class BasketTableViewCell: UITableViewCell {

	weak var basketViewControllerDelegate: BasketViewControllerDelegate?

	private let networkService: NetworkServiceProtocol = NetworkService()

	private var stackView: UIStackView!
	private var titleLabel: UILabel!
	private var priceAndWeight: UILabel!
	private var myView: UIView!
	private var image: UIImageView!

	private var customStepperView: UIView!
	var buttonStepperMinus: UIButton!
	var buttonStepperPlus: UIButton!
	private var stepperLabel: UILabel!

	var currentStepperValue = 1 {
		didSet {
			currentStepperValue = currentStepperValue > 0 ? currentStepperValue : 0
			stepperLabel.text = "\(currentStepperValue)"
		}
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		setupViews()
		setupCustomStepper()
		setupHierarchy()
		setupConstraints()

		addTargets()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func addTargets() {
		buttonStepperMinus.addTarget(
			self,
			action: #selector(buttonStepperMinusAction(target:)),
			for: .touchUpInside
		)
		buttonStepperPlus.addTarget(
			self,
			action: #selector(buttonStepperPlusAction(target:)),
			for: .touchUpInside
		)
	}

	private func setupViews() {

		stackView = UIStackView(
			axis: .vertical,
			spacing: 4,
			distribution: .fill
		)

		titleLabel = UILabel(
			attributedText: NSMutableAttributedString.paragraphAndKern(
				lineHeightMultiple: Constants.LineHeightMultiple.title
			),
			textColor: .label,
			font: .systemFont(ofSize: 14),
			numberOfLines: 2
		)

		priceAndWeight = UILabel(
			attributedText: NSMutableAttributedString.paragraphAndKern(
				lineHeightMultiple: Constants.LineHeightMultiple.title
			),
			textColor: .label,
			font: .systemFont(ofSize: 14)
		)

		myView = UIView()
		myView.backgroundColor = UIColor(
			named: Constants.Color.CollectionDish.backgroundDish
		)
		myView.layer.cornerRadius = 6

		image = UIImageView(
			backgroundColor: UIColor(
				named: Constants.Color.CollectionDish.backgroundDish
			),
			contentMode: .scaleAspectFit,
			cornerRadius: 0
		)

	}

	private func setupCustomStepper() {

		customStepperView = UIView()
		customStepperView.backgroundColor = UIColor(
			named: Constants.Color.CustomStepper.customStepper
		)
		customStepperView.layer.cornerRadius = Constants.cornerRadius

		let minusButtonImage = UIImage(
			named: Constants.Image.Stepper.minusIcon
		)?.withTintColor(
			.label, renderingMode: .alwaysOriginal
		)
		buttonStepperMinus = UIButton(
			image: minusButtonImage ?? UIImage(),
			backgroundColor: .clear,
			cornerRadius: 0,
			clipsToBounds: false
		)

		let plusButtonImage = UIImage(
			named: Constants.Image.Stepper.plusIcon
		)?.withTintColor(
			.label, renderingMode: .alwaysOriginal
		)
		buttonStepperPlus = UIButton(
			image: plusButtonImage ?? UIImage(),
			backgroundColor: .clear,
			cornerRadius: 0,
			clipsToBounds: false
		)

		stepperLabel = UILabel(
			attributedText: NSMutableAttributedString.paragraphAndKern(
				lineHeightMultiple: Constants.LineHeightMultiple.title
			),
			textColor: .label,
			font: .systemFont(ofSize: 14)
		)
		stepperLabel.text = "\(currentStepperValue)"

	}

	private func setupHierarchy() {
		myView.addSubview(image)
		contentView.addSubview(myView)

		stackView.addArrangedSubview(titleLabel)
		stackView.addArrangedSubview(priceAndWeight)
		contentView.addSubview(stackView)

		customStepperView.addSubview(buttonStepperMinus)
		customStepperView.addSubview(buttonStepperPlus)
		customStepperView.addSubview(stepperLabel)
		contentView.addSubview(customStepperView)
	}

	private func setupConstraints() {
		[
			image,
			myView,
			stackView,

			buttonStepperMinus,
			buttonStepperPlus,
			stepperLabel,
			customStepperView,

		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
		}

		NSLayoutConstraint.activate([
			contentView.heightAnchor.constraint(equalToConstant: 76),

			myView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			myView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
			myView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
			myView.widthAnchor.constraint(equalToConstant: 62),
			myView.heightAnchor.constraint(equalToConstant: 62),

			image.centerXAnchor.constraint(equalTo: myView.centerXAnchor, constant: 2),
			image.centerYAnchor.constraint(equalTo: myView.centerYAnchor),

			image.leadingAnchor.constraint(greaterThanOrEqualTo: myView.leadingAnchor, constant: 8),
			image.trailingAnchor.constraint(lessThanOrEqualTo: myView.trailingAnchor, constant: -4),
			image.topAnchor.constraint(greaterThanOrEqualTo: myView.topAnchor, constant: 8),
			image.bottomAnchor.constraint(lessThanOrEqualTo: myView.bottomAnchor, constant: -4),

			stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			stackView.leadingAnchor.constraint(equalTo: myView.trailingAnchor, constant: 8),
			stackView.trailingAnchor.constraint(equalTo: customStepperView.leadingAnchor, constant: -8),

			// CustomStepper
			customStepperView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
			customStepperView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			customStepperView.widthAnchor.constraint(equalToConstant: 99),
			customStepperView.heightAnchor.constraint(equalToConstant: 32),

			stepperLabel.centerXAnchor.constraint(equalTo: customStepperView.centerXAnchor),
			stepperLabel.centerYAnchor.constraint(equalTo: customStepperView.centerYAnchor),

			buttonStepperMinus.centerYAnchor.constraint(equalTo: customStepperView.centerYAnchor),
			buttonStepperMinus.leadingAnchor.constraint(equalTo: customStepperView.leadingAnchor, constant: 6),
			buttonStepperMinus.topAnchor.constraint(equalTo: customStepperView.topAnchor, constant: 4),
			buttonStepperMinus.bottomAnchor.constraint(equalTo: customStepperView.bottomAnchor, constant: -4),
			buttonStepperMinus.trailingAnchor.constraint(equalTo: customStepperView.centerXAnchor, constant: -16),
			buttonStepperMinus.widthAnchor.constraint(equalToConstant: 24),
			buttonStepperMinus.heightAnchor.constraint(equalToConstant: 24),

			buttonStepperPlus.centerYAnchor.constraint(equalTo: customStepperView.centerYAnchor),
			buttonStepperPlus.trailingAnchor.constraint(equalTo: customStepperView.trailingAnchor, constant: -6),
			buttonStepperPlus.topAnchor.constraint(equalTo: customStepperView.topAnchor, constant: 4),
			buttonStepperPlus.bottomAnchor.constraint(equalTo: customStepperView.bottomAnchor, constant: -4),
			buttonStepperPlus.leadingAnchor.constraint(equalTo: customStepperView.centerXAnchor, constant: 16),
			buttonStepperPlus.widthAnchor.constraint(equalToConstant: 24),
			buttonStepperPlus.heightAnchor.constraint(equalToConstant: 24),

		])
	}

	func configure(_ model: BasketModel, _ priceAndCount: CustomStepperModel) {

		currentStepperValue = priceAndCount.count
		stepperLabel.text = "\(currentStepperValue)"

		let price = priceAndCount.price

		titleLabel.text = model.name
		priceAndWeight.attributedText = weightAndPrice(
			price: price * currentStepperValue,
			weight: model.weight
		)

		networkService.loadImageFrom(stringURL: model.imageURL) { [weak self] picture in
			guard let self else { return }
			self.image.image = picture
		}

	}

	func priceIncrement(_ model: BasketModel, _ count: Int) {
		priceAndWeightLabelUpdate(
			model: model,
			value: currentStepperValue,
			count: count
		)
	}

	func priceDecrement(_ model: BasketModel, _ count: Int) {
		priceAndWeightLabelUpdate(
			model: model,
		 value: currentStepperValue,
		 count: count
		)
	}

	private func priceAndWeightLabelUpdate(
		model: BasketModel,
		value: Int,
		count: Int
	) {
		priceAndWeight.attributedText = weightAndPrice(
			price: model.price * count,
			weight: model.weight
		)
	}

	@objc private func buttonStepperMinusAction(target: UIButton) {
		basketViewControllerDelegate?.buttonStepperMinusAction(target: target)
	}
	@objc private func buttonStepperPlusAction(target: UIButton) {
		basketViewControllerDelegate?.buttonStepperPlusAction(target: target)
	}

}
