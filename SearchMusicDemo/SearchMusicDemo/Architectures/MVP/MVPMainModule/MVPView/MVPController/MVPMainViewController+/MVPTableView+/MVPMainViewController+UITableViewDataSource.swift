
import UIKit

extension MVPMainViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		mvpPresenter.numberOfSections
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		mvpPresenter.numberOfRowsInSection(section: section)

	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: Constants.Table.MVP.cellIdentifier
		) as? MVPMainTableViewCellProtocol else {
			fatalError("dequeueReusableCell error")
		}

		mvpPresenter.cellConfigure(cell: cell, at: indexPath)

		mvpPresenter.stopIndicator()

		guard let cell = cell as? UITableViewCell else { return UITableViewCell() }

		return cell
	}

}
