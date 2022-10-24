//
//  VideoCell.swift
//  PrimeiroProjetoViewCode
//
//  Created by Raina Rodrigues de Lima on 19/10/22.
//

import UIKit

class VideoCell: UITableViewCell {
    
    var videoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var videoTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(videoImageView)
        contentView.addSubview(videoTitleLabel)

        configureImageView()
        configureTableLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(video: PostFilmes){
        videoImageView.imageFromServerURL(video.image)
        videoTitleLabel.text = video.title 
    }
    
    func configureImageView(){
        videoImageView.layer.cornerRadius = 10
        videoImageView.clipsToBounds = true
    }
    
    func configureTableLabel(){
        videoTitleLabel.numberOfLines = 0
        videoTitleLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    func setImageConstraints(){
        videoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        videoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        videoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setTitleLabelConstraints(){
        videoTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        videoTitleLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20).isActive = true
        videoTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
    }
}
