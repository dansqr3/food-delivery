import UIKit

final class BasketViewController: UIViewController {

	var basketViewModel: BasketViewModelProtocol?

	let basketView = BasketView()

	private var customView: UIView!

	var content: [BasketModel]? {
		Base.shared.currentSettings.content
	}

	override func loadView() {
		view = basketView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setupViews()
		cellRegister()

		setupDelegate()

		setupNotification()

		setupBind()

	}

	private func setupBind() {
		basketViewModel?.buttonSumSignal.bind { [weak self] value in
			guard let self else { return }
			buttonTitleUpdate(value)
		}

		basketViewModel?.updateButtonsTagSignal.bind { [weak self] content in
			guard let self else { return }
			updateButtonsTag(content)
		}
	}

	private func cellRegister() {
		basketView.tableView.register(
			BasketTableViewCell.self,
			forCellReuseIdentifier: Constants.CellIdentifier.tableViewCell
		)
	}

	private func setupViews() {
		view.backgroundColor = .systemBackground

		let date = Date()
		customView = createCustomNavigationBar(
			city: "Санкт-Петербург",
			date: date.toString
		)
		navigationItem.titleView = customView

	}

	private func setupDelegate() {
		basketView.basketViewControllerDelegate = self
		basketView.tableView.dataSource = self
	}

	private func setupNotification() {

		NotificationCenter.default.addObserver(
			self,
			selector: #selector(updateTableView),
			name: NSNotification.Name(Constants.NotificationName.basketTable),
			object: nil
		)

	}

	private func buttonTitleUpdate(_ value: Int) {

		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.groupingSeparator = " "

		let result = NSNumber(value: value)
		guard let form = formatter.string(from: result) else { return }

		basketView.payButton.setTitle("Оплатить \(form) ₽", for: .normal)

	}

	private func updateButtonsTag(_ content: [BasketModel]) {

		content.indices.forEach {
			guard let cell = basketView.tableView.cellForRow(
				at: IndexPath(row: $0, section: 0)
			) as? BasketTableViewCell else { return }

			cell.buttonStepperMinus.tag = $0
			cell.buttonStepperPlus.tag = $0
		}
	}

	// MARK: - @objc
	@objc func updateTableView() {
		basketView.tableView.reloadData()
	}

}
