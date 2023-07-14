import Foundation
import UIKit

extension UIButton {

	convenience init(
		image: UIImage,
		backgroundColor: UIColor,
		cornerRadius: CGFloat = 0,
		clipsToBounds: Bool,
		tag: Int = 0
	) {
		self.init()

		self.setImage(image, for: .normal)
		self.backgroundColor = backgroundColor
		self.layer.cornerRadius = cornerRadius
		self.clipsToBounds = clipsToBounds
		self.tag = tag
	}

	convenience init(
		configuration: UIButton.Configuration,
		title: String,
		titleColorForNormal: UIColor,
		titleColorForHighlighted: UIColor,
		backgroundColor: UIColor,
		cornerRadius: CGFloat = 0,
		tag: Int = 0
	) {
		self.init()

		self.configuration = configuration
		self.setTitle(title, for: .normal)
		self.setTitleColor(titleColorForNormal, for: .normal)
		self.setTitleColor(titleColorForHighlighted, for: .highlighted)
		self.backgroundColor = backgroundColor
		self.layer.cornerRadius = cornerRadius
		self.tag = tag
	}

}
