
import Foundation
import UIKit

enum Constants {

	static let distance: CGFloat = 8

	enum URLParameters {

		static let urlBase = "https://itunes.apple.com/search?term="

		static let limit = "50"

	}

	enum Table {

		enum MVC {
			static let cellIdentifier = "MVCCell"
		}

		enum MVP {
			static let cellIdentifier = "MVPCell"
		}

		enum MVVM {
			static let cellIdentifier = "MVVMCell"
		}

		enum VIPER {
			static let cellIdentifier = "VIPERCell"
		}

	}

	enum Size {

		enum Image {
			static let width: CGFloat = 100
			static let height: CGFloat = 100

			static let multiply: CGFloat = width / height
		}

		enum Cell {
			static let height: CGFloat = 80
			static let width: CGFloat = 80

		}

	}

	enum UserDefaultKey {

		static let viewsCount = "viewsCount"

	}

	enum NotificationName {

		static let mainVC = "mainVC"

	}

	enum CoreData {

		enum MVC {

			enum EntityName {
				static let product = "MVCProduct"
				static let viewsNumber = "MVCViewsNumber"
			}

			enum SortName {
				static let releaseDate = #keyPath(MVCProduct.releaseDate)
			}

		}

		enum MVP {

			enum EntityName {
				static let product = "MVPProduct"
				static let viewsNumber = "MVPViewsNumber"
			}

			enum SortName {
				static let releaseDate = #keyPath(MVPProduct.releaseDate)
			}

			enum Ascending {
				static let falseAscending = false
			}

		}

		enum MVVM {

			enum EntityName {
				static let product = "MVVMProduct"
				static let viewsNumber = "MVVMViewsNumber"
			}

			enum SortName {
				static let releaseDate = #keyPath(MVVMProduct.releaseDate)
			}

			enum Ascending {
				static let falseAscending = false
			}

		}

		enum VIPER {

			enum EntityName {
				static let product = "VIPERProduct"
				static let viewsNumber = "VIPERViewsNumber"
			}

			enum SortName {
				static let releaseDate = #keyPath(VIPERProduct.releaseDate)
			}

			enum Ascending {
				static let falseAscending = false
			}

		}

	}

	enum Cache {

		static let name = "Cache"

	}

	enum DateFormat {

		static let format1 = "dd MMMM yyyy"

	}

	enum TabBar {

		enum Title {

			static let mvc = "Model View Controller"
			static let mvp = "Model View Presenter"
			static let mvvm = "Model View ViewModel"
			static let viper = "Viper"

			enum Short {
				static let mvc = "MVC"
				static let mvp = "MVP"
				static let mvvm = "MVVM"
				static let viper = "VIPER"
			}

		}

		enum Image {
			static let mvc = UIImage(systemName: "rays")
			static let mvp = UIImage(systemName: "slowmo")
			static let mvvm = UIImage(systemName: "timelapse")
			static let viper = UIImage(systemName: "aqi.medium")
		}

	}

}
