import SwiftUI


struct LoginView: View {
    var body: some View {
        ZStack {
            Color("login_background_color").ignoresSafeArea(.all)
            VStack {
                Image("nutrilog")
                    .resizable()
                    .frame(width: 300, height: 300)
            }
            MyButtonView()
                .padding(.top, 360)
        }
    }
}

struct MyButtonView: View {
    
    var body: some View {
        Button("Se connecter", systemImage: "faceid") {
            
        }
        .buttonStyle(.borderedProminent)
        .accentColor(Color("nutrilog_orange"))
        .foregroundStyle(.white)
    }
}

#Preview {
    LoginView()
}
