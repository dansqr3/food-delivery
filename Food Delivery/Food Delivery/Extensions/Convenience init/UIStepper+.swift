import Foundation
import UIKit

extension UIStepper {

	convenience init(
		minimumValue: Double,
		maximumValue: Double,
		stepValue: Double = 1,
		wraps: Bool = false

	) {
		self.init()

		self.minimumValue = minimumValue
		self.maximumValue = maximumValue
		self.stepValue = stepValue
		self.wraps = wraps
	}

}
