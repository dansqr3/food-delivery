import Foundation
import UIKit

extension NSMutableAttributedString {

	static func paragraphAndKern(lineHeightMultiple: CGFloat) -> NSMutableAttributedString {
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineHeightMultiple = lineHeightMultiple

		return NSMutableAttributedString(
			string: "",
			attributes: [
				NSAttributedString.Key.kern: 0.14,
				NSAttributedString.Key.paragraphStyle: paragraphStyle
			]
		)
	}

}
