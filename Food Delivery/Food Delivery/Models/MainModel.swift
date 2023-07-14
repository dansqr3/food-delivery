import Foundation

// MARK: - MainModel
struct MainModel: Codable {
	let сategories: [Content]?
}

// MARK: - Content
struct Content: Codable {
	let id: Int?
	let name: String?
	let imageURL: String?

	enum CodingKeys: String, CodingKey {
		case id, name
		case imageURL = "image_url"
	}
}
