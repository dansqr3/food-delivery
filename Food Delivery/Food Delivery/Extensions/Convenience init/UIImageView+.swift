import Foundation
import UIKit

extension UIImageView {

	convenience init(
		backgroundColor: UIColor? = .systemBackground,
		contentMode: UIView.ContentMode = .scaleToFill,
		cornerRadius: CGFloat,
		clipsToBounds: Bool = false
	) {
		self.init()

		self.backgroundColor = backgroundColor
		self.contentMode = contentMode
		self.layer.cornerRadius = cornerRadius
		self.clipsToBounds = clipsToBounds
	}

}
