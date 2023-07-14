import Foundation
import UIKit

extension UILabel {

	convenience init(
		attributedText: NSAttributedString?,
		textColor: UIColor,
		font: UIFont,
		numberOfLines: Int = 0
	) {
		self.init()

		self.attributedText = attributedText
		self.textColor = textColor
		self.font = font
		self.numberOfLines = numberOfLines
	}

}
