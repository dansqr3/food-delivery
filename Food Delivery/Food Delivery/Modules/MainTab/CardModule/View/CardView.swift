import UIKit

final class CardView: UIView {

	var cardViewViewModel: CardViewViewModelProtocol?

	private let networkService: NetworkServiceProtocol = NetworkService()

	private var myView: UIView!
	private var imageView: UIImageView!

	private var nameLabel: UILabel!
	private var priceAndWeightLabel: UILabel!
	private var descriptionLabel: UILabel!

	private var favoriteButton: UIButton!
	private var closeButton: UIButton!

	private var addCardButton: UIButton!

	private var stackView: UIStackView!

	var content: Dish?

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupViews()
		setupHierarchy()
		setupConstraints()
		addTargets()

	}

	convenience init(content: Dish) {
		self.init()
		self.content = content

		configure(content)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func configure(_ content: Dish) {

		nameLabel.text = content.name
		priceAndWeightLabel.attributedText = weightAndPrice(
			price: content.price ?? 0,
			weight: content.weight ?? 0
		)

		descriptionLabel.text = content.description

		guard let urlString = content.imageURL else { return }

		networkService.loadImageFrom(stringURL: urlString) { [weak self] image in
			guard let self else { return }
			self.imageView.image = image
		}
	}

	private func setupViews() {

		backgroundColor = .systemBackground

		layer.cornerRadius = Constants.cornerRadius

		myView = UIView()
		myView.backgroundColor = UIColor(
			named: Constants.Color.CollectionDish.backgroundDish
		)
		myView.layer.cornerRadius = 10

		imageView = UIImageView(
			backgroundColor: UIColor(
				named: Constants.Color.CollectionDish.backgroundDish
			),
			contentMode: .scaleAspectFit,
			cornerRadius: 10
		)

		nameLabel = UILabel(
			attributedText: NSMutableAttributedString.paragraphAndKern(
				lineHeightMultiple: Constants.LineHeightMultiple.title
			),
			textColor: .label,
			font: .systemFont(ofSize: 16, weight: .medium),
			numberOfLines: 0
		)

		priceAndWeightLabel = UILabel(
			attributedText: NSMutableAttributedString.paragraphAndKern(
				lineHeightMultiple: Constants.LineHeightMultiple.title
			),
			textColor: .label,
			font: .systemFont(ofSize: 14),
			numberOfLines: 0
		)

		descriptionLabel = UILabel(
			attributedText: NSMutableAttributedString.paragraphAndKern(
				lineHeightMultiple: Constants.LineHeightMultiple.description
			),
			textColor: .label.withAlphaComponent(0.65),
			font: .systemFont(ofSize: 14),
			numberOfLines: 0
		)
		descriptionLabel.lineBreakMode = .byWordWrapping

		addCardButton = UIButton(
			configuration: .plain(),
			title: "Добавить в корзину",
			titleColorForNormal: .systemBackground,
			titleColorForHighlighted: .systemGray3,
			backgroundColor: UIColor(
				named: Constants.Color.ButtonTag.highlighted
			) ?? .systemBlue,
			cornerRadius: 10
		)

		let favoriteButtonImage = UIImage(
			systemName: Constants.Image.Card.favorite
		   )?.withTintColor(
			   .label, renderingMode: .alwaysOriginal
		   )
		favoriteButton = UIButton(
			image: favoriteButtonImage ?? UIImage(),
			backgroundColor: .systemBackground,
			cornerRadius: Constants.cornerRadius - 2,
			clipsToBounds: true
		)

		let closeButtonImage = UIImage(
			systemName: Constants.Image.Card.close
		   )?.withTintColor(
			   .label, renderingMode: .alwaysOriginal
		   )
		closeButton = UIButton(
			image: closeButtonImage ?? UIImage(),
			backgroundColor: .systemBackground,
			cornerRadius: Constants.cornerRadius - 2,
			clipsToBounds: true
		)

		stackView = UIStackView(
			axis: .vertical,
			spacing: 8,
			distribution: .fill
		)

	}

	private func setupHierarchy() {
		myView.addSubview(imageView)
		myView.addSubview(closeButton)
		myView.addSubview(favoriteButton)
		stackView.addArrangedSubview(myView)
		stackView.addArrangedSubview(nameLabel)
		stackView.addArrangedSubview(priceAndWeightLabel)
		stackView.addArrangedSubview(descriptionLabel)

		addSubview(stackView)
		addSubview(addCardButton)
	}

	private func setupConstraints() {
		[
			myView,
			imageView,
			nameLabel,
			priceAndWeightLabel,
			descriptionLabel,

			stackView,

			closeButton,
			favoriteButton,

			addCardButton,
		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
		}

		NSLayoutConstraint.activate([

			stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

			myView.heightAnchor.constraint(equalToConstant: 232),

			imageView.centerXAnchor.constraint(equalTo: myView.centerXAnchor, constant: 4),
			imageView.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
			imageView.leadingAnchor.constraint(greaterThanOrEqualTo: myView.leadingAnchor, constant: 14),
			imageView.trailingAnchor.constraint(lessThanOrEqualTo: myView.trailingAnchor, constant: -4),
			imageView.topAnchor.constraint(greaterThanOrEqualTo: myView.topAnchor, constant: 14),
			imageView.bottomAnchor.constraint(lessThanOrEqualTo: myView.bottomAnchor, constant: -4),

			addCardButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
			addCardButton.heightAnchor.constraint(equalToConstant: 48),
			addCardButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			addCardButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			addCardButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

			closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 24),
			closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
			closeButton.heightAnchor.constraint(equalToConstant: 40),
			closeButton.widthAnchor.constraint(equalToConstant: 40),

			favoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 24),
			favoriteButton.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -8),
			favoriteButton.heightAnchor.constraint(equalToConstant: 40),
			favoriteButton.widthAnchor.constraint(equalToConstant: 40),

		])
	}

	private func addTargets() {
		closeButton.addTarget(
			self,
			action: #selector(closeButtonAction),
			for: .touchUpInside
		)

		addCardButton.addTarget(
			self,
			action: #selector(addCardButtonAction),
			for: .touchUpInside
		)
	}

	private func closeCard() {
		UIView.animate(withDuration: 0.25) { [weak self] in
			guard let self else { return }
			self.alpha = 0
		} completion: { [weak self] _ in
			guard let self else { return }
			self.removeFromSuperview()
		}
	}

	@objc private func closeButtonAction() {
		closeCard()
		cardViewViewModel?.closeButtonAction()
	}

	@objc private func addCardButtonAction() {
		guard let content else { return }
		cardViewViewModel?.addCardButtonAction(with: content)

		addCardButton.setTitle("Добавлено!", for: .normal)

		DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
			guard let self else { return }
			self.closeButtonAction()
		}

	}

}
