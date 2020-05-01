//
//  Issues.swift
//  TestApp
//
//  Created by Niraj Kumar on 01/05/2020.
//  Copyright © 2020 NirWorld. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let issues = try? newJSONDecoder().decode(Issues.self, from: jsonData)

import Foundation

// MARK: - Issue
struct Issue: Codable {
    let id: Int
    let nodeID: String
    let url, repositoryURL: String
    let labelsURL: String
    let commentsURL, eventsURL, htmlURL: String
    let number: Int
    let state, title, body: String
    let user: Assignee
    let labels: [Label]
    let assignee: Assignee
    let assignees: [Assignee]
    let milestone: Milestone
    let locked: Bool
    let activeLockReason: String
    let comments: Int
    let pullRequest: PullRequest
    let closedAt: JSONNull?
    let createdAt, updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case url
        case repositoryURL = "repository_url"
        case labelsURL = "labels_url"
        case commentsURL = "comments_url"
        case eventsURL = "events_url"
        case htmlURL = "html_url"
        case number, state, title, body, user, labels, assignee, assignees, milestone, locked
        case activeLockReason = "active_lock_reason"
        case comments
        case pullRequest = "pull_request"
        case closedAt = "closed_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Assignee
struct Assignee: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let siteAdmin: Bool

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}

// MARK: - Label
struct Label: Codable {
    let id: Int
    let nodeID: String
    let url: String
    let name, labelDescription, color: String
    let labelDefault: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case url, name
        case labelDescription = "description"
        case color
        case labelDefault = "default"
    }
}

// MARK: - Milestone
struct Milestone: Codable {
    let url: String
    let htmlURL: String
    let labelsURL: String
    let id: Int
    let nodeID: String
    let number: Int
    let state, title, milestoneDescription: String
    let creator: Assignee
    let openIssues, closedIssues: Int
    let createdAt, updatedAt, closedAt, dueOn: Date

    enum CodingKeys: String, CodingKey {
        case url
        case htmlURL = "html_url"
        case labelsURL = "labels_url"
        case id
        case nodeID = "node_id"
        case number, state, title
        case milestoneDescription = "description"
        case creator
        case openIssues = "open_issues"
        case closedIssues = "closed_issues"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case dueOn = "due_on"
    }
}

// MARK: - PullRequest
struct PullRequest: Codable {
    let url, htmlURL: String
    let diffURL: String
    let patchURL: String

    enum CodingKeys: String, CodingKey {
        case url
        case htmlURL = "html_url"
        case diffURL = "diff_url"
        case patchURL = "patch_url"
    }
}

typealias Issues = [Issue]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
