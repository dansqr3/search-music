
import UIKit

class MVVMDetailViewController: UIViewController {

	let mvvmDetailView = MVVMDetailView()

	var mvvmDetailViewModel: MVVMDetailViewModelProtocol = MVVMDetailViewModel()

	let fetchData: FetchDataProtocol = FetchData()

	override func loadView() {
		view = mvvmDetailView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

	}

	init(content: MVVMProduct) {

		super.init(nibName: nil, bundle: nil)

		setupDelegate()
		setupBind()

		configureViewModel(content)

	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		makeNotification()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupBind() {

		mvvmDetailViewModel.configureSignal.bind { [weak self] product in
			guard let self else { return }
			self.configure(product)
		}

		}

	private func configureViewModel(_ content: MVVMProduct) {
		mvvmDetailViewModel.configure(content)
	}

	private func configure(_ content: ContentConfigure) {

		if let imageString = content.imageString {
			fetchData.loadImageFrom(stringURL: imageString) { [weak self] picture in
				guard let self else { return }
				self.mvvmDetailView.image.image = picture
			}
		}

		if let artistName = content.artistName {
			if let trackName = content.trackName {
				mvvmDetailView.title.text = "\(artistName) - \(trackName)"
			}
		}

		if let collectionName = content.collectionName {
			mvvmDetailView.collectionNameLabel.text = "Collection: \(collectionName)"
		}
		if let releaseDate = content.releaseDate {
			mvvmDetailView.releaseDateLabel.text = "Release date: \(releaseDate.formate(to: Constants.DateFormat.format1))"
		}
		if let trackViewURL = content.trackViewURL {
			mvvmDetailView.trackViewURLLabel.text = "Track source: \(trackViewURL)"
		}

	}

	private func makeNotification() {

		NotificationCenter.default.post(
			name: NSNotification.Name(Constants.NotificationName.mainVC),
			object: nil
		)

	}

	private func setupDelegate() {
		mvvmDetailView.mvvmDetailViewControllerDelegate = self
	}

}
