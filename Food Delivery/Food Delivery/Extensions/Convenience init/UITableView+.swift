import Foundation
import UIKit

extension UITableView {

	convenience init(
		separatorStyle: UITableViewCell.SeparatorStyle = .singleLine,
		separatorInset: UIEdgeInsets = .init(),
		refreshControl: UIRefreshControl? = nil
	) {
		self.init()

		self.separatorStyle = separatorStyle
		self.separatorInset = separatorInset
		self.refreshControl = refreshControl
	}

}
