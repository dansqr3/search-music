
import UIKit

extension VIPERMainViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		viperMainViewControllerOutput.numberOfSections
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		let numberOfRowsInSec = viperMainViewControllerOutput.numberOfRowsInSection(section: section)
		return numberOfRowsInSec

	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: Constants.Table.VIPER.cellIdentifier
		) as? VIPERMainTableViewCellProtocol else {
			fatalError("dequeueReusableCell error")
		}

		viperMainViewControllerOutput.cellConfigure(cell: cell, at: indexPath)

		viperMainViewControllerOutput.stopActivityIndicator()

		guard let cell = cell as? UITableViewCell else { return UITableViewCell() }

		return cell
	}

}
