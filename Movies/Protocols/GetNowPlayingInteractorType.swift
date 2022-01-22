//
//  GetNowPlayingInteractorTYpe.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import Foundation
import Combine

protocol GetNowPlayingInteractorType {
    func getNowPlaying() -> AnyPublisher<GeneralResult, Error>
}
