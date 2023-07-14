import Foundation
import UIKit

protocol CategoriesViewControllerDelegate: AnyObject {

	func buttonAction(target: UIButton)

	func cellConfigure(cell: CollectionViewCell, at indexPath: IndexPath)

}
