
import UIKit
import CoreData

class MVPMainViewController: UIViewController {

	let mvpMainView = MVPMainView()

	var mvpPresenter: MVPMainPresenterInput!

	var indexPathForUpdate: IndexPath = .init(row: 0, section: 0)

	var urlString = ""

	override func loadView() {
		view = mvpMainView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setupViews()

		cellRegister()

		setupNotification()

		setupDelegate()

	}

	private func setupViews() {
		title = Constants.TabBar.Title.Short.mvp
	}

	private func cellRegister() {
		mvpMainView.tableView.register(MVPMainTableViewCell.self, forCellReuseIdentifier: Constants.Table.MVP.cellIdentifier)
	}

	private func setupDelegate() {
		mvpMainView.searchBar.delegate = self

		mvpMainView.tableView.dataSource = self
		mvpMainView.tableView.delegate = self
	}

	private func setupNotification() {

		NotificationCenter.default.addObserver(
			self,
			selector: #selector(updateTableView),
			name: NSNotification.Name(Constants.NotificationName.mainVC),
			object: nil
		)

	}

	@objc func updateTableView() {
		mvpMainView.tableView.reloadRows(at: [indexPathForUpdate], with: .fade)
	}

}
