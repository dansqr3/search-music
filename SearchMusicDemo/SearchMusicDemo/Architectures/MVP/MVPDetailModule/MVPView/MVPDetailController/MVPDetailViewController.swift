
import UIKit

class MVPDetailViewController: UIViewController {

	var mvpDetailPresenter: MVPDetailViewOutput!

	let mvpDetailView = MVPDetailView()
	let fetchData: FetchDataProtocol = FetchData()

	override func loadView() {
		view = mvpDetailView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setupDelegate()

	}

	init(content: MVPProduct) {

		super.init(nibName: nil, bundle: nil)

		configure(content)

	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		makeNotification()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
