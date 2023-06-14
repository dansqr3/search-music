
import UIKit

class VIPERDetailViewController: UIViewController {

	let viperDetailView = VIPERDetailView()

	var viperDetailViewControllerOutput: VIPERDetailViewControllerOutput!

	let fetchData: FetchDataProtocol = FetchData()

	var content: VIPERProduct

	override func loadView() {
		view = viperDetailView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		viperDetailViewControllerOutput.configure(content)

	}

	init(content: VIPERProduct) {

		self.content = content

		super.init(nibName: nil, bundle: nil)

		setupDelegate()

	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		makeNotification()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func makeNotification() {

		NotificationCenter.default.post(
			name: NSNotification.Name(Constants.NotificationName.mainVC),
			object: nil
		)

	}

	private func setupDelegate() {
		viperDetailView.viperDetailViewControllerDelegate = self
	}

}
