import Foundation
import Apollo
import ApolloAPI

class AuthInterceptor: ApolloInterceptor {
    var id: String = "tutorial-auth-interceptor"
    
    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) where Operation : GraphQLOperation {
        // TODO: actually get token here
        let token = "MY_AWESOME_TOKEN"
        request.addHeader(name: "Authorization", value: "Bearer \(token)")
        
        return chain.proceedAsync(
            request: request,
            response: response,
            interceptor: self,
            completion: completion
        )
    }
}

class NetworkInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(AuthInterceptor(), at: 0)
        return interceptors
    }
}
