import Foundation

extension Date {

	var toString: String {

		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "d MMMM, yyyy"
		dateFormatter.locale = Locale(identifier: "ru_RU")

		let dateString = dateFormatter.string(from: self)

		return dateString
	}
}
