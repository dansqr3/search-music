
import UIKit

class MVVMMainViewController: UIViewController {

	let mvvmMainView = MVVMMainView()

	var mvvmMainViewModel: MVVMMainViewModelProtocol!

	var mvvmProducts: [[MVVMProduct]] = []

	var router: MVVMRouterProtocol!

	var indexPathForUpdate: IndexPath = .init(row: 0, section: 0)

	var urlString = ""

	override func loadView() {
		view = mvvmMainView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setupViews()

		cellRegister()

		setupNotification()

		setupDelegate()

		setupBind()

		updateDataSource()

	}

	private func setupBind() {

		mvvmMainViewModel.productsSignal.bind { [weak self] products in
			guard let self else { return }
			self.mvvmProducts = products
			self.mvvmMainView.tableView.reloadData()
		}

		mvvmMainViewModel.openProductSignal.bind { [weak self] content in
			guard let self,
				  let content = content else { return }
			self.pushVC(with: content)
		}

		mvvmMainViewModel.activityIndicatorSignal.bind { [weak self] bool in
			guard let self else { return }
			self.switchActivityIndicator(sender: bool)
		}

		mvvmMainViewModel.urlStringSignal.bind { [weak self] urlString in
			guard let self else { return }
			self.urlString = urlString
		}

		mvvmMainViewModel.indexPathForUpdateSignal.bind { [weak self] indexPathForUpdate in
			guard let self else { return }
			self.indexPathForUpdate = indexPathForUpdate
		}

	}

	private func updateDataSource() {
		mvvmMainViewModel.updateDataSource()
	}

	private func setupViews() {
		title = Constants.TabBar.Title.Short.mvvm
	}

	private func cellRegister() {
		mvvmMainView.tableView.register(
			MVVMMainTableViewCell.self,
			forCellReuseIdentifier: Constants.Table.MVVM.cellIdentifier
		)
	}

	private func setupDelegate() {
		mvvmMainView.searchBar.delegate = self

		mvvmMainView.tableView.dataSource = self
		mvvmMainView.tableView.delegate = self
	}

	private func setupNotification() {

		NotificationCenter.default.addObserver(
			self,
			selector: #selector(updateTableView),
			name: NSNotification.Name(Constants.NotificationName.mainVC),
			object: nil
		)

	}

	private func pushVC(with content: MVVMProduct) {
		router.pushDetailViewController(content: content)
	}

	// MARK: - ActivityIndicator

	private func switchActivityIndicator(sender: Bool) {
		switch sender {
			case true:
				startActivityIndicator()
			case false:
				stopActivityIndicator()
		}
	}

	private func startActivityIndicator() {
		mvvmMainView.indicatorBackgroundView.alpha = 0.7
		mvvmMainView.activityIndicator.alpha = 1
		mvvmMainView.activityIndicator.startAnimating()
	}

	private func stopActivityIndicator() {
		mvvmMainView.indicatorBackgroundView.alpha = 0
		mvvmMainView.activityIndicator.stopAnimating()
		mvvmMainView.activityIndicator.alpha = 0
	}

	// MARK: - @objc
	@objc func updateTableView() {
		mvvmMainView.tableView.reloadRows(at: [indexPathForUpdate], with: .fade)
	}

}
