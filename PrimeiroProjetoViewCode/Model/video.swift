//
//  video.swift
//  PrimeiroProjetoViewCode
//
//  Created by Raina Rodrigues de Lima on 20/10/22.
//

import UIKit

struct PostFilmes: Codable {
    let id, title, originalTitle, originalTitleRomanised: String
    let image, movieBanner: String
    let postDescription, director, producer, releaseDate: String
    let runningTime, rtScore: String
    let people, species, locations, vehicles: [String]
    let url: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case originalTitle = "original_title"
        case originalTitleRomanised = "original_title_romanised"
        case image
        case movieBanner = "movie_banner"
        case postDescription = "description"
        case director, producer
        case releaseDate = "release_date"
        case runningTime = "running_time"
        case rtScore = "rt_score"
        case people, species, locations, vehicles, url
    }
}
