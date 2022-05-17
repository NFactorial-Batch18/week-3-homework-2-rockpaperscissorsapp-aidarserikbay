import SwiftUI

struct OpponentPickLoadingScreen: View {
    var body: some View {
        OpponentPickLoading()
    }
}

struct OpponentPickLoading: View {
    
    @State private var isOpponentPickLoadingScreenActive: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                Text("Your opponent is thinking")
                    .foregroundColor(.black)
                    .font(.system(size: 54, weight: .medium))
                    .frame(width: 358, height: 186, alignment: .center)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                NavigationLink(isActive: $isOpponentPickLoadingScreenActive) {
                    OpponentPickScreen()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                            .frame(width: 342, height: 128)
                        Image("Loading")
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isOpponentPickLoadingScreenActive = true
                    }
                }
                .padding(.top, 136)
                
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Round #1")
        .animation(.linear(duration: 1))
    }
}

struct OpponentPickLoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OpponentPickLoadingScreen()
    }
}
