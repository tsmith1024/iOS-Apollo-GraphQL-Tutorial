import SwiftUI

enum ViewState {
    case idle
    case loading
    case loaded
    case error
}

struct ContentView: View {
    let launchModel: LaunchModel = LaunchModel(network: Network.shared)
    var launchList: [LaunchListResult]  {
        launchModel.launches
    }
    
    @State var loadingState: ViewState = .idle
    
    var body: some View {
        VStack {
            Image(systemName: "airplane.departure")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Launches: \(launchList.count)")
            ForEach(0..<launchList.count, id: \.self) { index in
                let launch = launchList[index]
                Text(launch.site ?? "No Site")
            }
        }
        .task {
            await loadLaunches()
        }
        .padding()
    }
}

/// view functions
extension ContentView {
    private func loadLaunches() async {
        loadingState = .loading
        do {
            try await launchModel.populateLaunches()
        } catch {
            loadingState = .error
            return
        }
        loadingState = .loaded
    }
}

#Preview {
    ContentView()
}
