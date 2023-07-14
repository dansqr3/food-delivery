import UIKit

final class BasketView: UIView {

	weak var basketViewControllerDelegate: BasketViewControllerDelegate?

	var tableView: UITableView!
	var payButton: UIButton!

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

		tableView = UITableView(separatorStyle: .none)
		tableView.showsVerticalScrollIndicator = false

		payButton = UIButton(
			configuration: .plain(),
			title: "Оплатить 0 ₽",
			titleColorForNormal: .systemBackground,
			titleColorForHighlighted: .systemGray3,
			backgroundColor: UIColor(named: Constants.Color.ButtonTag.highlighted) ?? .systemBlue,
			cornerRadius: 10
		)

	}

	private func setupHierarchy() {
		addSubview(tableView)
		addSubview(payButton)
	}

	private func setupConstraints() {
		[
			tableView,
			payButton,
		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
		}

		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
			tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
			tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
			tableView.bottomAnchor.constraint(equalTo: payButton.topAnchor, constant: -16),

			payButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
			payButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
			payButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
			payButton.heightAnchor.constraint(equalToConstant: 48),
		])
	}

	private func addTargets() {
		payButton.addTarget(
			self,
			action: #selector(payButtonAction),
			for: .touchUpInside
		)
	}

	@objc private func payButtonAction() {
		basketViewControllerDelegate?.payButtonPressedAction()
	}

}
