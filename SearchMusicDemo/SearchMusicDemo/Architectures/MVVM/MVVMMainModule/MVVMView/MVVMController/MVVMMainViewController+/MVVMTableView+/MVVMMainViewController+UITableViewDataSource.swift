
import UIKit

extension MVVMMainViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		mvvmProducts.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		mvvmProducts[section].count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: Constants.Table.MVVM.cellIdentifier
		) as? MVVMMainTableViewCellProtocol else {
			fatalError("dequeueReusableCell error")
		}

		mvvmMainViewModel.cellConfigure(cell: cell, at: indexPath)

		mvvmMainViewModel.activityIndicatorSignal.value = false

		guard let cell = cell as? UITableViewCell else { return UITableViewCell() }

		return cell
	}

}
