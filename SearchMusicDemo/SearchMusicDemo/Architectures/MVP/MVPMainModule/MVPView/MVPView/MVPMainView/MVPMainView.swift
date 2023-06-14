
import UIKit

class MVPMainView: UIView {

	var tableView: UITableView!
	var searchBar: UISearchBar!
	var activityIndicator: UIActivityIndicatorView!
	var indicatorBackgroundView: UIView!

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupViews()
		setupHierarchy()
		setupConstraints()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupViews() {

		backgroundColor = .systemBackground

		tableView = UITableView(
			separatorInset: .init(
				top: 0,
				left: 81,
				bottom: 0,
				right: 0
			)
		)

		searchBar = UISearchBar(
			placeholder: "Search music...",
			showsCancelButton: true
		)

		activityIndicator = UIActivityIndicatorView(
			style: .large,
			alpha: 0
		)

		indicatorBackgroundView = UIView(
			backgroundColor: .secondarySystemBackground
		)

	}

	private func setupHierarchy() {
		addSubview(searchBar)
		addSubview(tableView)
		indicatorBackgroundView.addSubview(activityIndicator)
		addSubview(indicatorBackgroundView)
	}

	private func setupConstraints() {

		[
			tableView,
			searchBar,
			indicatorBackgroundView,
			activityIndicator,
		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
		}

		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

			searchBar.topAnchor.constraint(equalTo: tableView.bottomAnchor),
			searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			searchBar.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor),

			indicatorBackgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			indicatorBackgroundView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			indicatorBackgroundView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			indicatorBackgroundView.bottomAnchor.constraint(equalTo: searchBar.topAnchor),

			activityIndicator.centerXAnchor.constraint(equalTo: indicatorBackgroundView.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: indicatorBackgroundView.centerYAnchor),

		])

	}

}
