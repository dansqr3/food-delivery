import Foundation
import UIKit

protocol NetworkServiceProtocol {

	func getContent(from urlString: String, completion: @escaping (Result<[Dish]?, Error>) -> Void)

	func loadImageFrom(stringURL: String, completion: @escaping (UIImage?) -> Void)

}
