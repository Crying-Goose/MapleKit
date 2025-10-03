//
//  MapleService.swift
//  MapleKit
//
//  Created by 라주영 on 7/21/25.
//

import Foundation
import Moya

public protocol MapleAPIServiceProtocol {
    func getId(name: String) async throws -> String
}

struct CustomURLLoggerPlugin: PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        print("🌐 요청 URL:", request.request?.url?.absoluteString ?? "없음")
    }
}

public final class MapleService: MapleAPIServiceProtocol {
    
    private let provider = MoyaProvider<MapleTarget>(plugins: [CustomURLLoggerPlugin()])

    public init() {}
    
    // 캐릭터 아이디 검색
    public func getId(name: String) async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.id(name: name)) { result in
                switch result {
                case .success(let response):
                    do {
                        let dto = try JSONDecoder().decode(OcidDTO.self, from: response.data)
                        continuation.resume(returning: dto.ocid)
                    } catch {
                        print("❌ JSON Decoding Failed:", error)
                        print(String(data: response.data, encoding: .utf8) ?? "No Response")
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
