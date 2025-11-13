import Foundation

public struct PostFriendsRequestsResponse: Codable, Hashable, Sendable {
    public let status: Pending
    public let requestedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: Pending,
        requestedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.requestedAt = requestedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(Pending.self, forKey: .status)
        self.requestedAt = try container.decode(Date.self, forKey: .requestedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.requestedAt, forKey: .requestedAt)
    }

    public enum Pending: String, Codable, Hashable, CaseIterable, Sendable {
        case pending
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case requestedAt
    }
}