import Foundation

struct SettingsModel: Codable {
	var width: CGFloat
	var content: [BasketModel]
	var priceAndCount: [CustomStepperModel]
}
