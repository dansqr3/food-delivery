import Foundation
import UIKit

extension UIView {

	func weightAndPrice(price: Int, weight: Int) -> NSAttributedString {

		let string = "\(price) ₽ · \(weight)г"
		let attributedString = NSMutableAttributedString(string: string)

		if let dotIndex = attributedString.string.firstIndex(of: "·") {
			attributedString.addAttribute(
				.foregroundColor,
				value: UIColor.label.withAlphaComponent(0.4),
				range: NSRange(
					dotIndex..<string.endIndex,
					in: string
				)
			)
		}

		return attributedString
	}

}
