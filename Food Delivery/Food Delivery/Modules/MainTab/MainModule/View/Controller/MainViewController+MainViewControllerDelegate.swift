import Foundation

extension MainViewController: MainViewControllerDelegate {

	func bakeriesButtonAction() {
		mainViewModel?.showBakeries()
	}

	func fastFoodButtonAction() {
		mainViewModel?.showFastFood()
	}

	func asiaButtonAction() {
		mainViewModel?.showAsia()
	}

	func soupButtonAction() {
		mainViewModel?.showSoup()
	}

}
