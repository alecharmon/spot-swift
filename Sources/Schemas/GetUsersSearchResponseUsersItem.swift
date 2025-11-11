import Foundation

public struct GetUsersSearchResponseUsersItem: Codable, Hashable, Sendable {
    public let id: String
    public let username: String?
    public let firstName: String?
    public let lastName: String?
    public let fullName: String?
    public let imageUrl: String?
    public let primaryEmailAddressId: String?
    public let emailAddresses: [GetUsersSearchResponseUsersItemEmailAddressesItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        username: String? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        fullName: String? = nil,
        imageUrl: String? = nil,
        primaryEmailAddressId: String? = nil,
        emailAddresses: [GetUsersSearchResponseUsersItemEmailAddressesItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = fullName
        self.imageUrl = imageUrl
        self.primaryEmailAddressId = primaryEmailAddressId
        self.emailAddresses = emailAddresses
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.username = try container.decodeIfPresent(String.self, forKey: .username)
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        self.fullName = try container.decodeIfPresent(String.self, forKey: .fullName)
        self.imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        self.primaryEmailAddressId = try container.decodeIfPresent(String.self, forKey: .primaryEmailAddressId)
        self.emailAddresses = try container.decode([GetUsersSearchResponseUsersItemEmailAddressesItem].self, forKey: .emailAddresses)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.username, forKey: .username)
        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.fullName, forKey: .fullName)
        try container.encodeIfPresent(self.imageUrl, forKey: .imageUrl)
        try container.encodeIfPresent(self.primaryEmailAddressId, forKey: .primaryEmailAddressId)
        try container.encode(self.emailAddresses, forKey: .emailAddresses)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case username
        case firstName = "first_name"
        case lastName = "last_name"
        case fullName = "full_name"
        case imageUrl = "image_url"
        case primaryEmailAddressId = "primary_email_address_id"
        case emailAddresses = "email_addresses"
    }
}