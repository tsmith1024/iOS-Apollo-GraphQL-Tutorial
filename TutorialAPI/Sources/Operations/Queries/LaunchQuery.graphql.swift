// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LaunchQuery: GraphQLQuery {
  public static let operationName: String = "Launch"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Launch($launchId: ID!) { launch(id: $launchId) { __typename id site isBooked rocket { __typename id name type } mission { __typename missionPatch name } } }"#
    ))

  public var launchId: ID

  public init(launchId: ID) {
    self.launchId = launchId
  }

  public var __variables: Variables? { ["launchId": launchId] }

  public struct Data: TutorialAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { TutorialAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("launch", Launch?.self, arguments: ["id": .variable("launchId")]),
    ] }

    public var launch: Launch? { __data["launch"] }

    /// Launch
    ///
    /// Parent Type: `Launch`
    public struct Launch: TutorialAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { TutorialAPI.Objects.Launch }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", TutorialAPI.ID.self),
        .field("site", String?.self),
        .field("isBooked", Bool.self),
        .field("rocket", Rocket?.self),
        .field("mission", Mission?.self),
      ] }

      public var id: TutorialAPI.ID { __data["id"] }
      public var site: String? { __data["site"] }
      public var isBooked: Bool { __data["isBooked"] }
      public var rocket: Rocket? { __data["rocket"] }
      public var mission: Mission? { __data["mission"] }

      /// Launch.Rocket
      ///
      /// Parent Type: `Rocket`
      public struct Rocket: TutorialAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { TutorialAPI.Objects.Rocket }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", TutorialAPI.ID.self),
          .field("name", String?.self),
          .field("type", String?.self),
        ] }

        public var id: TutorialAPI.ID { __data["id"] }
        public var name: String? { __data["name"] }
        public var type: String? { __data["type"] }
      }

      /// Launch.Mission
      ///
      /// Parent Type: `Mission`
      public struct Mission: TutorialAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { TutorialAPI.Objects.Mission }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("missionPatch", String?.self),
          .field("name", String?.self),
        ] }

        public var missionPatch: String? { __data["missionPatch"] }
        public var name: String? { __data["name"] }
      }
    }
  }
}
