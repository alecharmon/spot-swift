import Foundation

public struct PostFriendsRequestsIdConfirmResponse: Codable, Hashable, Sendable {
    public let status: Approved
    public let approvedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: Approved,
        approvedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.approvedAt = approvedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(Approved.self, forKey: .status)
        self.approvedAt = try container.decode(Date.self, forKey: .approvedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.approvedAt, forKey: .approvedAt)
    }

    public enum Approved: String, Codable, Hashable, CaseIterable, Sendable {
        case approved
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case approvedAt
    }
}