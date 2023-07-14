import Foundation
import UIKit

protocol BasketViewControllerDelegate: AnyObject {

	func buttonStepperMinusAction(target: UIButton)
	func buttonStepperPlusAction(target: UIButton)

	func payButtonPressedAction()

}
