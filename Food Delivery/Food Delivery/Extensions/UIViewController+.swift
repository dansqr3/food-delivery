import Foundation
import UIKit

extension UIViewController {

	func createCustomNavigationBar(city: String, date: String) -> UIView {

		let myView = UIView(
			frame: CGRect(x: 0, y: 0, width: Base.shared.currentSettings.width - 32, height: 57)
		)

		let avatarImage = UIImageView(image: Constants.TabBar.Navigation.photo)
		avatarImage.frame = CGRect(
			x: Base.shared.currentSettings.width - 44 - 32,
			y: 0,
			width: 44,
			height: 44
		)
		avatarImage.layer.cornerRadius = avatarImage.frame.width / 2

		let locationImage = UIImageView(image: Constants.TabBar.Navigation.location)
		locationImage.frame = CGRect(x: 0, y: 2, width: 24, height: 24)

		let cityLabel = UILabel(
			attributedText: NSMutableAttributedString.paragraphAndKern(
				lineHeightMultiple: Constants.LineHeightMultiple.navigator
			), textColor: .label,
			font: .systemFont(ofSize: 18, weight: .medium)
		)
		cityLabel.text = city
		cityLabel.frame = CGRect(x: 30, y: 0, width: 180, height: 22)

		let dateLabel = UILabel(
			attributedText: NSMutableAttributedString.paragraphAndKern(
				lineHeightMultiple: Constants.LineHeightMultiple.navigator
			), textColor: .label.withAlphaComponent(0.5),
			font: .systemFont(ofSize: 14)
		)
		dateLabel.text = date
		dateLabel.frame = CGRect(x: 30, y: 26, width: 150, height: 16)

		[
			locationImage,
			cityLabel,
			dateLabel,
			avatarImage,
		].forEach {
			myView.addSubview($0)
		}

		return myView
	}
}
