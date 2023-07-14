import Foundation

final class Base {

	static let shared = Base()

	private let userDefault = UserDefaults.standard

	private let defaultSettings = SettingsModel(
		width: 390,
		content: [BasketModel](),
		priceAndCount: [CustomStepperModel]()
	)

	var currentSettings: SettingsModel {

		get {

			if let data = userDefault.object(forKey: Constants.UserDefaultKey.settings) as? Data {
				let settings = try! PropertyListDecoder().decode(SettingsModel.self, from: data)
				return settings

			} else {

				if let data = try? PropertyListEncoder().encode(defaultSettings) {
					userDefault.set(data, forKey: Constants.UserDefaultKey.settings)
				}

				return defaultSettings
			}

		}

		set {

			if let data = try? PropertyListEncoder().encode(newValue) {
				userDefault.set(data, forKey: Constants.UserDefaultKey.settings)
			}

		}

	}

}
