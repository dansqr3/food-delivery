import Foundation
import UIKit

final class CategoriesViewModel: CategoriesViewModelProtocol {

	private let networkService: NetworkServiceProtocol = NetworkService()

	var mainCoordinator: MainCoordinatorProtocol?

	private var content: [Dish]?
	private var source: [Dish]?

	var productsSignal: Dynamic<[Dish]> = Dynamic(value: [])
	var tagSignal: Dynamic<(UIButton, Bool)> = Dynamic(value: (UIButton(), true))

	private var buttonsDictionary: Dictionary<String, Bool> = [
		Constants.Title.ButtonTag.allMenu: true,
		Constants.Title.ButtonTag.salad: false,
		Constants.Title.ButtonTag.rice: false,
		Constants.Title.ButtonTag.fish: false,
		Constants.Title.ButtonTag.rolls: false,
	]

	init(content: [Dish]?) {
		self.content = content
		self.source = content
	}

	func popViewController() {
		mainCoordinator?.popViewController()
	}

	func buttonAction(target: UIButton) {

		content = source

		switch target.tag {
			case 1:
				tagHandler(
					target: target,
					key: Constants.Title.ButtonTag.allMenu
				)
			case 2:
				tagHandler(
					target: target,
					key: Constants.Title.ButtonTag.salad
				)
			case 3:
				tagHandler(
					target: target,
					key: Constants.Title.ButtonTag.rice
				)
			case 4:
				tagHandler(
					target: target,
					key: Constants.Title.ButtonTag.fish
				)
			case 5:
				tagHandler(
					target: target,
					key: Constants.Title.ButtonTag.rolls
				)
			default:
				break
		}
	}

	private func tagHandler(target: UIButton, key: String) {

		guard let isTagOn = buttonsDictionary[key] else { return }

		buttonsDictionary[key] = !isTagOn

		let newTags = filterTags()
		content = filterProducts(by: newTags)

		tagSignal.value = (target, isTagOn)
		productsSignal.value = content ?? []

	}

	private func filterTags() -> [String] {

		let newDictionary = buttonsDictionary
			.filter {
			$0.value == true
		}

		let newTags = newDictionary.keys.map { $0 }

		return newTags
	}

	private func filterProducts(by tags: [String]) -> [Dish]? {

		guard !tags.isEmpty else { return [] }

		var filterTags = [Teg]()
		tags.forEach {
			filterTags.append(Teg(rawValue: $0) ?? Teg.rolls)
		}

		let tagsSet: Set<Teg> = Set(filterTags)
		guard let content = content else { return [] }

		let filteredContent = content
			.filter {
				Set($0.tegs!).isSuperset(of: tagsSet)
			}

		return filteredContent
	}

	// MARK: - CollectionViewDataSource
	var numberOfItemsInSection: Int {
		content?.count ?? 0
	}

	func cellConfigure(cell: CollectionViewCell, at indexPath: IndexPath) {
		let model = content?[indexPath.row]

		guard let urlString = model?.imageURL else { return }

		cell.label.attributedText = NSAttributedString(string: model?.name ?? "")

		networkService.loadImageFrom(stringURL: urlString) { image in
			cell.imageView.image = image
		}
	}

	// MARK: - CollectionViewDelegate
	func didSelectItem(on viewController: UIViewController, at indexPath: IndexPath) {
		guard let selectedContent = content?[indexPath.row] else { return }
		mainCoordinator?.showAlertCard(on: viewController, with: selectedContent)
	}

}
