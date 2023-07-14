import Foundation

extension Int {

	func format() -> String {

		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.groupingSeparator = " "

		let result = NSNumber(value: self)
		guard let form = formatter.string(from: result) else { return "" }

		return form
	}
}
