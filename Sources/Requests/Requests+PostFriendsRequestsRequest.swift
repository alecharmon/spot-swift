import Foundation

extension Requests {
    public struct PostFriendsRequestsRequest: Codable, Hashable, Sendable {
        public let friendId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            friendId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.friendId = friendId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.friendId = try container.decode(String.self, forKey: .friendId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.friendId, forKey: .friendId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case friendId
        }
    }
}