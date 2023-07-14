import Foundation

// MARK: - CategoriesModel
struct CategoriesModel: Codable {
	let dishes: [Dish]?
}

// MARK: - Dish
struct Dish: Codable {
	let id: Int?
	let name: String?
	let price, weight: Int?
	let description: String?
	let imageURL: String?
	let tegs: [Teg]?

	enum CodingKeys: String, CodingKey {
		case id, name, price, weight, description
		case imageURL = "image_url"
		case tegs
	}
}

enum Teg: String, Codable {
	case allMenu = "Все меню"
	case withRice = "С рисом"
	case withFish = "С рыбой"
	case salad = "Салаты"
	case rolls = "Роллы"
}
