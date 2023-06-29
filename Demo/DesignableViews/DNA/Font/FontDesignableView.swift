import UIKit
import Designable

struct FontItem {
    let font: UIFont
    let title: String
}

class FontDesignableView: View {
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        view.rowHeight = 60
        return view
    }()

    lazy var items: [FontItem] = {
        return [
            FontItem(font: .headline, title: "Headline"),
            FontItem(font: .headlineSemibold, title: "Headline Semibold"),
            FontItem(font: .headlineBold, title: "Headline Bold"),
            FontItem(font: .body, title: "Body"),
            FontItem(font: .subheadline, title: "Subheadline"),
            FontItem(font: .subheadlineBold, title: "Subheadline Bold"),
            FontItem(font: .caption, title: "Caption")
        ]
    }()

    override func setup() {
        addSubview(tableView)
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        tableView.register(UITableViewCell.self)
    }
}

extension FontDesignableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(UITableViewCell.self, for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title.capitalized
        cell.textLabel?.font = item.font
        cell.textLabel?.textColor = .primaryText
        cell.selectionStyle = .none

        return cell
    }
}
