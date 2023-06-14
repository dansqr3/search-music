
import UIKit

extension MainViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		fetchResultController.sections?.count ?? 0
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if let sections = fetchResultController.sections {
			return sections[section].numberOfObjects
		} else {
			return 0
		}

	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: Constants.Table.MVC.cellIdentifier
		) as? MainTableViewCell else {
			fatalError("dequeueReusableCell error")
		}

		guard let model = fetchResultController.object(at: indexPath) as? MVCProduct else { fatalError("model error") }

		cell.configure(model)

		stopActivityIndicator()

		return cell
	}

}
