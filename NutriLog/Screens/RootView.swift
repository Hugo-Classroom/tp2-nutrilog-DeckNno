import SwiftUI
import LocalAuthentication

struct RootView: View {
    // TODO: Cette partie sera vue en classe pour l'expliquer comme il faut
    @State private var isAuthenticated = false
    
    var body: some View {
        if (isAuthenticated) {
            HomeView()
        } else {
            LoginView()
        }
    }
}

func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock data."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                success, error in
                if let error {
                    print(error)
                    return
                }
                if success {
                    print("Authenticated.")
                } else {
                }
             //   isAuthenticated = success
            }
        }
    }

#Preview {
    RootView()
}
