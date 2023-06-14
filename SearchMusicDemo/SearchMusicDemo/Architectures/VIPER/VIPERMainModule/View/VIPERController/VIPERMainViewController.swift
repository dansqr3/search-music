
import UIKit

class VIPERMainViewController: UIViewController {

	let viperMainView = VIPERMainView()

	var viperMainViewControllerOutput: VIPERMainViewControllerOutput!

	var indexPathForUpdate: IndexPath = .init(row: 0, section: 0)

	var urlString = ""

	override func loadView() {
		view = viperMainView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setupViews()

		cellRegister()

		setupNotification()

		setupDelegate()

	}

	private func setupViews() {
		title = Constants.TabBar.Title.Short.viper
	}

	private func cellRegister() {
		viperMainView.tableView.register(
			VIPERMainTableViewCell.self,
			forCellReuseIdentifier: Constants.Table.VIPER.cellIdentifier
		)
	}

	private func setupDelegate() {
		viperMainView.searchBar.delegate = self

		viperMainView.tableView.dataSource = self
		viperMainView.tableView.delegate = self
	}

	private func setupNotification() {

		NotificationCenter.default.addObserver(
			self,
			selector: #selector(updateTableView),
			name: NSNotification.Name(Constants.NotificationName.mainVC),
			object: nil
		)

	}

	// MARK: - ActivityIndicator
	func switchActivityIndicator(sender: Bool) {
		switch sender {
			case true:
				startActivityIndicator()
			case false:
				stopActivityIndicator()
		}
	}

	private func startActivityIndicator() {
		viperMainView.indicatorBackgroundView.alpha = 0.7
		viperMainView.activityIndicator.alpha = 1
		viperMainView.activityIndicator.startAnimating()
	}

	private func stopActivityIndicator() {
		viperMainView.indicatorBackgroundView.alpha = 0
		viperMainView.activityIndicator.stopAnimating()
		viperMainView.activityIndicator.alpha = 0
	}

	// MARK: - @objc
	@objc func updateTableView() {
		viperMainView.tableView.reloadRows(at: [indexPathForUpdate], with: .fade)
	}

}
