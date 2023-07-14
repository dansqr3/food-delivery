import Foundation
import UIKit

enum Constants {

	static let cornerRadius: CGFloat = 10

	enum CellIdentifier {
		static let collectionCell = "collectionCell"
		static let tableViewCell = "tableViewCell"
	}

	enum LineHeightMultiple {
		static let navigator: CGFloat = 1.01
		static let date: CGFloat = 0.96
		static let title: CGFloat = 0.88
		static let description: CGFloat = 0.92
	}

	enum Urls {
		static let mainApi = "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54"
		static let categoriesApi = "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b"
	}

	enum Image {
		enum Bakeries {
			static let bakeries = "bakeries"
			static let preview = "bakeriesPreview"
		}

		enum FastFood {
			static let fastFood = "fastfood"
			static let preview = "fastFoodPreview"
		}

		enum Asia {
			static let asia = "asia"
			static let preview = "asiaPreview"
		}

		enum Soup {
			static let soup = "soup"
			static let preview = "soupPreview"
		}

		enum Card {
			static let close = "xmark"
			static let favorite = "heart"
		}

		enum Stepper {
			static let minus = "minus"
			static let plus = "plus"

			static let minusIcon = "minusIcon"
			static let plusIcon = "plusIcon"
		}

	}

	enum Color {

		enum Categories {
			static let bakeries = "Bakeries"
			static let asia = "Asia"
			static let soup = "Soup"
			static let fastfood = "Fastfood"
		}

		enum ButtonTag {
			static let background = "BackgroundButton"
			static let highlighted = "BluePickButton"
		}

		enum CollectionDish {
			static let backgroundDish = "BackgroundDish"
		}

		enum CustomStepper {
			static let customStepper = "CustomStepper"
		}

		enum TabBar {
			static let normalTabBar = "NormalTabBar"
		}

	}

	enum Title {

		enum Categories {
			static let bakeries = "Пекарни и кондитерские"
			static let fastFood = "Фастфуд"
			static let asia = "Азиатская кухня"
			static let soup = "Супы"
		}

		enum ButtonTag {
			static let allMenu = "Все меню"
			static let salad = "Салаты"
			static let rice = "С рисом"
			static let fish = "С рыбой"
			static let rolls = "Роллы"
		}

	}

	enum UserDefaultKey {
		static let settings = "settings"
	}

	enum NotificationName {
		static let addToCard = "addToCard"
		static let basketTable = "basketTable"
	}

	enum Cache {
		static let name = "Cache"
	}

	enum TabBar {

		enum Title {

			static let main = "Главная"
			static let search = "Поиск"
			static let basket = "Корзина"
			static let account = "Аккаунт"

		}

		enum Image {

			static let main = UIImage(named: "main")?
				.withTintColor(
				UIColor(named: Constants.Color.TabBar.normalTabBar
						  ) ?? .systemBlue,
							  renderingMode: .alwaysOriginal)

			static let search = UIImage(systemName: "magnifyingglass")?
				.withTintColor(
				UIColor(named: Constants.Color.TabBar.normalTabBar
						  ) ?? .systemBlue,
							  renderingMode: .alwaysOriginal)

			static let basket = UIImage(systemName: "basket")?
				.withTintColor(
				UIColor(named: Constants.Color.TabBar.normalTabBar
						  ) ?? .systemBlue,
							  renderingMode: .alwaysOriginal)

			static let account = UIImage(systemName: "person.crop.circle")?
				.withTintColor(
				UIColor(named: Constants.Color.TabBar.normalTabBar
						  ) ?? .systemBlue,
							  renderingMode: .alwaysOriginal)

		}

		enum SelectedImage {

			static let main = UIImage(named: "main")?
				.withTintColor(
					UIColor(named: Constants.Color.ButtonTag.highlighted
						   ) ?? .systemBlue,
							   renderingMode: .alwaysOriginal)

			static let search = UIImage(systemName: "magnifyingglass")?
				.withTintColor(
					UIColor(named: Constants.Color.ButtonTag.highlighted
						   ) ?? .systemBlue,
							   renderingMode: .alwaysOriginal)

			static let basket = UIImage(systemName: "basket")?
				.withTintColor(
					UIColor(named: Constants.Color.ButtonTag.highlighted
						   ) ?? .systemBlue,
							   renderingMode: .alwaysOriginal)

			static let account = UIImage(systemName: "person.crop.circle")?
				.withTintColor(
					UIColor(named: Constants.Color.ButtonTag.highlighted
						   ) ?? .systemBlue,
							   renderingMode: .alwaysOriginal)

		}

		enum Navigation {

			static let backwardImage = UIImage(named: "backward")?
				.withTintColor(
					.label,
					renderingMode: .alwaysOriginal
				)

			static let location = UIImage(named: "locationIcon")
			static let photo = UIImage(named: "photo")
		}

	}

}
