import Foundation
import UIKit

extension BasketViewController: BasketViewControllerDelegate {

	func buttonStepperMinusAction(target: UIButton) {
		guard let cell = basketView.tableView.cellForRow(
			at: IndexPath(row: target.tag, section: 0)
		) as? BasketTableViewCell else { return }

		basketViewModel?.updateCellPrice(in: cell, with: .decrement, at: target.tag)

		if cell.currentStepperValue == 0 {
			Base.shared.currentSettings.content.remove(at: target.tag)
			Base.shared.currentSettings.priceAndCount.remove(at: target.tag)
			basketView.tableView.deleteRows(
				at: [.init(row: target.tag, section: 0)], with: .fade
			)
			basketViewModel?.updateButtonsTag()
		}

	}

	func buttonStepperPlusAction(target: UIButton) {
		guard let cell = basketView.tableView.cellForRow(
			at: IndexPath(row: target.tag, section: 0)
		) as? BasketTableViewCell else { return }

		basketViewModel?.updateCellPrice(in: cell, with: .increment, at: target.tag)

	}

	func payButtonPressedAction() {
		basketViewModel?.payButtonAction(view: self)
	}

}
