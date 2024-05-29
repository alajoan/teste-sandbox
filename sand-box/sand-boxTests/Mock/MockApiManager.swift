//
//  MockApiManager.swift
//  sand-boxTests
//
//  Created by Jonathan Rocha on 28/05/24.
//

import Foundation

class MockApiManager: APIManager {
    override func fetchData(completion: @escaping (Result<ProductData, Error>) -> Void) {
        let mockData = MockProductData().createMockSuccess()
        completion(.success(mockData))
    }
}
