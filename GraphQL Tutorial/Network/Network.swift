import Foundation
import Apollo
import TutorialAPI

let GRAPHQL_URL = "https://apollo-fullstack-tutorial.herokuapp.com/graphql"

class Network {
    static let shared = Network()
    
    private(set) lazy var apollo: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let url = URL(string: GRAPHQL_URL)!
        let transport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: url
        )
        
        return ApolloClient(networkTransport: transport, store: store)
    }()
    
    func fetchLaunches() async throws -> GraphQLResult<LaunchListQuery.Data> {
        return try await withCheckedThrowingContinuation { continuation in
            Network.shared.apollo.fetch(query: LaunchListQuery()) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    func fetchLaunch(launchID: String) async throws -> GraphQLResult<LaunchQuery.Data> {
        return try await withCheckedThrowingContinuation { continuation in
            Network.shared.apollo.fetch(query: LaunchQuery(launchId: launchID)) { result in
                continuation.resume(with: result)
            }
        }
    }
}


