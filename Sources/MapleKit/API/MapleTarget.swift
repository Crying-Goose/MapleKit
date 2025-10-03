//
//  MapleTarget.swift
//  MapleKit
//
//  Created by 라주영 on 7/21/25.
//

import Foundation
import Moya

public enum MapleTarget {
    case id(name: String)
    case basicInfo(ocid: String, dateStr: String?)
    case popularity(ocid: String, dateStr: String?)
    case stat(ocid: String, dateStr: String?)
    case hyperStat(ocid: String, dateStr: String?)
    case propensity(ocid: String, dateStr: String?)
    case ability(ocid: String, dateStr: String?)
    case equipment(ocid: String, dateStr: String?)
    case cashEquipment(ocid: String, dateStr: String?)
    case symbolEquipment(ocid: String, dateStr: String?)
    case setEffect(ocid: String, dateStr: String?)
    case beautyEquipment(ocid: String, dateStr: String?)
    case androidEquipment(ocid: String, dateStr: String?)
    case petEquipment(ocid: String, dateStr: String?)
    case skill(ocid: String, dateStr: String?)
    case linkSkill(ocid: String, dateStr: String?)
    case vmatrix(ocid: String, dateStr: String?)
    case hexamatrix(ocid: String, dateStr: String?)
    case hexamatrixStat(ocid: String, dateStr: String?)
    case dojang(ocid: String, dateStr: String?)
    case otherStat(ocid: String, dateStr: String?)
    case ringExchangeSkillEquipment(ocid: String, dateStr: String?)
    case union(ocid: String, dateStr: String?)
    case unionRaider(ocid: String, dateStr: String?)
    case unionArtifact(ocid: String, dateStr: String?)
    case unionChampion(ocid: String, dataStr: String?)
    case guildId(name: String, worldName: String)
    case guildBasicInfo(oguildId: String, dateStr: String?)
}

public enum MapleToken {
    public static let key = "test_83c4e605a458e947b493c62f9ca938431994cd5c753970a91934e9adf5b829faefe8d04e6d233bd35cf2fabdeb93fb0d"
}

extension MapleTarget: TargetType {
    public var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
            "x-nxopen-api-key": MapleToken.key
        ]
    }
    
    public var baseURL: URL {
        URL(string: "https://open.api.nexon.com/maplestory")!
    }
    
    public var path: String {
        switch self {
        case .id:
            "/v1/id"
        case .basicInfo:
            "/v1/character/basic"
        case .popularity:
            "/v1/character/popularity"
        case .stat:
            "/v1/character/stat"
        case .hyperStat:
            "/v1/character/hyper-stat"
        case .propensity:
            "/v1/character/propensity"
        case .ability:
            "/v1/character/ability"
        case .equipment:
            "/v1/character/item-equipment"
        case .cashEquipment:
            "/v1/character/cashitem-equipment"
        case .symbolEquipment:
            "/v1/character/symbol-equipment"
        case .setEffect:
            "/v1/character/set-effect"
        case .beautyEquipment:
            "/v1/character/beauty-equipment"
        case .androidEquipment:
            "/v1/character/android-equipment"
        case .petEquipment:
            "/v1/character/pet-equipment"
        case .skill:
            "/v1/character/skill"
        case .linkSkill:
            "/v1/character/link-skill"
        case .vmatrix:
            "/v1/character/vmatrix"
        case .hexamatrix:
            "/v1/character/hexamatrix"
        case .hexamatrixStat:
            "/v1/character/hexamatrix-stat"
        case .dojang:
            "/v1/character/dojang"
        case .otherStat:
            "/v1/character/other-stat"
        case .ringExchangeSkillEquipment:
            "/v1/character/ring-exchange-skill-equipment"
        case .union:
            "/v1/user/union"
        case .unionRaider:
            "/v1/user/union-raider"
        case .unionArtifact:
            "/v1/user/union-artifact"
        case .unionChampion:
            "/v1/user/union-champion"
        case .guildId:
            "/v1/guild/id"
        case .guildBasicInfo:
            "/v1/guild/basic"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .id(let name):
            return .requestParameters(parameters: [
                "character_name": name
            ], encoding: URLEncoding.default)
        case .basicInfo(let ocid, let dateStr),
                .popularity(let ocid, let dateStr),
                .stat(let ocid, let dateStr),
                .hyperStat(let ocid, let dateStr),
                .propensity(let ocid, let dateStr),
                .ability(let ocid, let dateStr),
                .equipment(let ocid, let dateStr),
                .cashEquipment(let ocid, let dateStr),
                .symbolEquipment(let ocid, let dateStr),
                .setEffect(let ocid, let dateStr),
                .beautyEquipment(let ocid, let dateStr),
                .androidEquipment(let ocid, let dateStr),
                .petEquipment(let ocid, let dateStr),
                .skill(let ocid, let dateStr),
                .linkSkill(let ocid, let dateStr),
                .vmatrix(let ocid, let dateStr),
                .hexamatrix(let ocid, let dateStr),
                .hexamatrixStat(let ocid, let dateStr),
                .dojang(let ocid, let dateStr),
                .otherStat(let ocid, let dateStr),
                .ringExchangeSkillEquipment(let ocid, let dateStr),
                .union(let ocid, let dateStr),
                .unionRaider(let ocid, let dateStr),
                .unionArtifact(let ocid, let dateStr),
                .unionChampion(let ocid, let dateStr):
            return .requestParameters(parameters: [
                "ocid": ocid,
                "date": dateStr ?? ""
            ], encoding: URLEncoding.default)
        case .guildId(let name, let worldName):
            return .requestParameters(parameters: [
                "guild_name": name,
                "world_name": worldName
            ], encoding: URLEncoding.default)
        case .guildBasicInfo(let oguildId, let dateStr):
            return .requestParameters(parameters: [
                "oguild_id": oguildId,
                "date": dateStr ?? ""
            ], encoding: URLEncoding.default)
        }
    }
}
