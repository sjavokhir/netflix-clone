//
//  UpcomingTableViewCell.swift
//  netlfix-clone
//
//  Created by Javokhir Savriev on 17/11/22.
//

import UIKit
import SDWebImage

class UpcomingTableViewCell: UITableViewCell {

    static let identifier = "UpcomingTableViewCell"

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let movieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(posterImageView)
        contentView.addSubview(movieLabel)
        contentView.addSubview(playButton)
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func applyConstraints() {
        let posterImageViewConstraints = [
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            posterImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        let movieLabelViewConstraints = [
            movieLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            movieLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        let playButtonViewConstraints = [
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(posterImageViewConstraints)
        NSLayoutConstraint.activate(movieLabelViewConstraints)
        NSLayoutConstraint.activate(playButtonViewConstraints)
    }
    
    public func configure(with model: UpcomingViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else { return }
        
        posterImageView.sd_setImage(with: url, completed: nil)
        movieLabel.text = model.movieName
    }
}
