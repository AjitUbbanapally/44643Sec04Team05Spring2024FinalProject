
import Foundation
import UIKit

struct CaseDetails: Codable {
    var dateOfIncident: String
    var caseType: String
    var caseDescription: String
    var statuteOfLimitationsDate: String
    var matterValue: String
    var attorneyFees: String
    var courtName: String
    var matterId: String
    var caseTitle: String
    var partyName: String
    var userId: String
    var partyId: String

    enum CodingKeys: String, CodingKey {
        case dateOfIncident
        case caseType
        case caseDescription
        case statuteOfLimitationsDate
        case matterValue
        case attorneyFees
        case courtName
        case matterId
        case caseTitle
        case partyName
        case userId
        case partyId
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(dateOfIncident, forKey: .dateOfIncident)
        try container.encode(caseType, forKey: .caseType)
        try container.encode(caseDescription, forKey: .caseDescription)
        try container.encode(statuteOfLimitationsDate, forKey: .statuteOfLimitationsDate)
        try container.encode(matterValue, forKey: .matterValue)
        try container.encode(attorneyFees, forKey: .attorneyFees)
        try container.encode(courtName, forKey: .courtName)
        try container.encode(matterId, forKey: .matterId)
        try container.encode(caseTitle, forKey: .caseTitle)
        try container.encode(userId, forKey: .userId)
        try container.encode(partyName, forKey: .partyName)
        try container.encode(partyId, forKey: .partyId)
    }
}
