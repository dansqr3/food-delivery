import UIKit

final class CollectionViewCell: UICollectionViewCell {

	private var myView: UIView!
	var imageView: UIImageView!
	var label: UILabel!

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupViews()
		setupHierarchy()
		setupConstraints()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupViews() {

		contentView.layer.cornerRadius = 10

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

		label = UILabel(
			attributedText: NSMutableAttributedString.paragraphAndKern(
				lineHeightMultiple: Constants.LineHeightMultiple.title
			),
			textColor: .label,
			font: .systemFont(ofSize: 14),
			numberOfLines: 0
		)
		label.lineBreakMode = .byWordWrapping

	}

	private func setupHierarchy() {
		myView.addSubview(imageView)
		contentView.addSubview(myView)
		contentView.addSubview(label)
	}

	private func setupConstraints() {
		[
			myView,
			imageView,
			label,
		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
		}

		NSLayoutConstraint.activate([

			myView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			myView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			myView.topAnchor.constraint(equalTo: contentView.topAnchor),
			myView.widthAnchor.constraint(equalToConstant: 109),
			myView.heightAnchor.constraint(equalToConstant: 109),

			imageView.centerXAnchor.constraint(equalTo: myView.centerXAnchor, constant: 2),
			imageView.centerYAnchor.constraint(equalTo: myView.centerYAnchor),

			imageView.leadingAnchor.constraint(greaterThanOrEqualTo: myView.leadingAnchor, constant: 8),
			imageView.trailingAnchor.constraint(lessThanOrEqualTo: myView.trailingAnchor, constant: -4),
			imageView.topAnchor.constraint(greaterThanOrEqualTo: myView.topAnchor, constant: 8),
			imageView.bottomAnchor.constraint(lessThanOrEqualTo: myView.bottomAnchor, constant: -4),

			label.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 5),
			label.leadingAnchor.constraint(equalTo: myView.leadingAnchor),
			label.trailingAnchor.constraint(equalTo: myView.trailingAnchor),

		])
	}
}
