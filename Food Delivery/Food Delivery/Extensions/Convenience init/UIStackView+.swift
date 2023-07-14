import Foundation
import UIKit

extension UIStackView {

	convenience init(
		axis: NSLayoutConstraint.Axis,
		spacing: CGFloat,
		distribution: UIStackView.Distribution
	) {
		self.init()

		self.axis = axis
		self.spacing = spacing
		self.distribution = distribution
	}

}
