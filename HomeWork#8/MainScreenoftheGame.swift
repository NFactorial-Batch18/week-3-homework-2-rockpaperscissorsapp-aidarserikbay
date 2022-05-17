import SwiftUI

struct RockPaperScissorsGame: View {
    var body: some View {
        MainScreen()
    }
}

struct MainScreen: View {
    
    @State private var isMainScreenActive: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("BG")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Welcome to the game!")
                        .foregroundColor(.white)
                        .font(.system(size:54,weight:.bold))
                        .frame(width: 358, height: 130, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding(.top, 92)
                    
                    Spacer()
                    
                    Button(action: {
                        isMainScreenActive = true
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 103/255, green: 80/255, blue: 164/255))
                                .frame(width: 358, height: 50)
                            NavigationLink(destination: PickChoiceScreen()){
                                Text("Single player")
                                    .foregroundColor(.white)
                            }
                        }
                    })
                    ZStack {
                        Button("Multi player") {
                            print("Multi Player Button Passed")
                        }
                        .frame(width: 358, height: 50)
                        .background(Color(red: 103/255, green: 80/255, blue: 164/255))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .padding(.bottom, 100)
                    }
                }
            }
        }
    }
}

struct RockPaperScissorsGame_Previews: PreviewProvider {
    static var previews: some View {
        RockPaperScissorsGame()
    }
}
