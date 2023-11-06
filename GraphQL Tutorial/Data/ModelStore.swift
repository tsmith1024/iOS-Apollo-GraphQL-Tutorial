import Foundation
import Observation
import Apollo
import TutorialAPI

typealias LaunchListResult = LaunchListQuery.Data.Launches.Launch
typealias LaunchResult = LaunchQuery.Data.Launch

@Observable
class LaunchModel {
    let network: Network
    
    private(set) var launches: [LaunchListResult] = []
    private(set) var launchDetails: LaunchResult? = nil
    
    init(network: Network) {
        self.network = network
    }
    
    func populateLaunches() async throws {
        let launchResultData = try await populate(request: network.fetchLaunches)
        
        launches = launchResultData?.launches.launches.compactMap { $0 } ?? []
    }
    
    func populateLaunch(launchID: String) async throws {
        let launchData = try await populate {
            try await network.fetchLaunch(launchID: launchID)
        }
        
        launchDetails = launchData?.launch ?? nil
    }
    
    private func populate<T>(
        request: () async throws -> GraphQLResult<T>
    ) async throws -> T? {
        let result = try await request()
        return result.data
    }
}
