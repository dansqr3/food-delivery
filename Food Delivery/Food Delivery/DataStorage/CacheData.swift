import Foundation
import UIKit

final class CacheData {

	private var cachedImageData = NSCache<NSString, UIImage>()

	func save(image: UIImage, for key: NSString) {
		guard key != "" else { return }
		cachedImageData.setObject(image, forKey: key)
	}

	func load(_ forKey: NSString) -> UIImage? {
		guard forKey != "",
			  let image = cachedImageData.object(forKey: forKey) else { return nil }
		return image
	}

}
