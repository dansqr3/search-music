
import UIKit
import CoreData

class MainViewController: UIViewController {

	var fetchResultController: NSFetchedResultsController<NSFetchRequestResult>!
	let coreDataManager = CoreDataManager()

	let mainView = MainView()

	let fetchData = FetchData()

	var indexPathForUpdate: IndexPath = .init(row: 0, section: 0)

	var urlString = ""

	override func loadView() {
		view = mainView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setupViews()

		cellRegister()

		setupNotification()

		setupCoreData()
		setupFetchResultControllerDelegate()

		setupDelegate()

		performFetchData()

	}

	private func setupViews() {
		title = Constants.TabBar.Title.Short.mvc
	}

	private func setupDelegate() {
		mainView.searchBar.delegate = self

		mainView.tableView.dataSource = self
		mainView.tableView.delegate = self
	}

	private func setupNotification() {

		NotificationCenter.default.addObserver(
			self,
			selector: #selector(updateTableView),
			name: NSNotification.Name(Constants.NotificationName.mainVC),
			object: nil
		)

	}

	private func cellRegister() {
		mainView.tableView.register(MainTableViewCell.self, forCellReuseIdentifier: Constants.Table.MVC.cellIdentifier)
	}

	func fetchSearchedData() {

		deleteAllObjects()
		startActivityIndicator()

		fetchData.fetch(urlString: urlString) { [weak self] content in
			guard let self else { return }

			coreDataManager.mvcPrepare(content: content)

		}

	}

	@objc func updateTableView() {
		mainView.tableView.reloadRows(at: [indexPathForUpdate], with: .fade)
	}

}
