//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Петров Вячеслав on 15.04.2026.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
}
