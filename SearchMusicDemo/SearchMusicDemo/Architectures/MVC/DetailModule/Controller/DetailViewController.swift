
import UIKit

class DetailViewController: UIViewController {

	let detailView = DetailView()
	private let fetchData = FetchData()

	var content: MVCProduct

	override func loadView() {
		view = detailView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setupDelegate()

	}

	init(content: MVCProduct) {

		self.content = content

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

	private func configure(_ content: MVCProduct) {

		if let urlString = content.artworkUrl100 {
			fetchData.loadImageFrom(stringURL: urlString) { [unowned self] picture in
				self.detailView.image.image = picture
			}
		}

		if let artistName = content.artistName {
			if let trackName = content.trackName {
				detailView.title.text = "\(artistName) - \(trackName)"
			}
		}

		if let collectionName = content.collectionName {
			detailView.collectionNameLabel.text = "Collection: \(collectionName)"
		}

		if let releaseDate = content.releaseDate {
			detailView.releaseDateLabel.text = "Release date: \(releaseDate.formate(to: Constants.DateFormat.format1))"
		}

		if let trackViewURL = content.trackViewURL {
			detailView.trackViewURLLabel.text = "Track source: \(trackViewURL)"
		}

	}

	private func makeNotification() {

		NotificationCenter.default.post(
			name: NSNotification.Name(Constants.NotificationName.mainVC),
			object: nil
		)

	}

	private func setupDelegate() {
		detailView.detailViewControllerDelegate = self
	}

}
