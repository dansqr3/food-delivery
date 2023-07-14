import Foundation
import UIKit

extension BasketViewController: UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		basketViewModel?.numberOfRowsInSection ?? 0
	}

	func tableView(
		_ tableView: UITableView,
		cellForRowAt indexPath: IndexPath
	) -> UITableViewCell {

		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: Constants.CellIdentifier.tableViewCell,
			for: indexPath
		) as? BasketTableViewCell else { return UITableViewCell() }

		cell.selectionStyle = .none
		cell.basketViewControllerDelegate = self

		basketViewModel?.cellConfigure(cell: cell, with: indexPath)

		return cell
	}

}
