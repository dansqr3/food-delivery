import Foundation
import UIKit

final class NetworkService: NetworkServiceProtocol {

	private let cacheData = CacheData()

	func getContent(from urlString: String, completion: @escaping (Result<[Dish]?, Error>) -> Void) {

		guard let url = URL(string: urlString) else { fatalError("urlString error") }

		URLSession.shared.dataTask(with: url) { data, response, error in

			if let error {
				print("URLSession error:", error)
				DispatchQueue.main.async {
					completion(.failure(error))
				}
			} else {
				guard let data else { return }

				if let dish = try? JSONDecoder().decode(CategoriesModel.self, from: data) {
					DispatchQueue.main.async {
						completion(.success(dish.dishes))
					}
				}

			}
		}.resume()

	}

	func loadImageFrom(stringURL: String, completion: @escaping (UIImage?) -> Void) {

		guard stringURL != "",
			  let url = URL(string: stringURL) else { return }

		let nsStringURL = stringURL as NSString

		if let cachedImage = cacheData.load(nsStringURL) {

			completion(cachedImage)

		} else {

			URLSession.shared.dataTask(with: url) { data, response, error in

				if let error = error {
					print(error)

				} else {

					guard let data else { fatalError("data error") }

					if let picture = UIImage(data: data) {

						self.cacheData.save(image: picture, for: nsStringURL)

						DispatchQueue.main.async {
							completion(picture)
						}

					}

				}

			}.resume()

		}

	}

}
