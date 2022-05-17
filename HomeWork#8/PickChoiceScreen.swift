import SwiftUI

enum picks { // setting picks
    case paper
    case scissors
    case rock
    case none
}

struct PickChoiceScreen: View {
    var body: some View {
        PickScreen()
    }
}

struct PickScreen: View {
    
    //    @State private var scoreOne = Int // how to implement ?
    //    @State private var scoreTwo = Int // how to implement ?
    @State private var choice: picks = .none
    @State private var isPaperBtnActive: Bool = false
    @State private var isScissorsBtnActive: Bool = false
    @State private var isRockBtnActive: Bool = false
    @State private var isChangeMyMindActive: Bool = false
    @State private var isConfirmBtnActive: Bool = false
    @State var roundCounter: Int = 1
    
    var body: some View {
        ZStack {
            VStack{
                Text("Take your pick")
                    .foregroundColor(Color.black)
                    .font(.system(size: 54, weight: .semibold))
                    .frame(width: 358, height: 62, alignment: .center)
                    .padding(.top, 42)
                Text("Score 0:0")                                               // need edit to display count score
                    .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
                    .font(.system(size: 17, weight: .semibold))
                    .frame(width: 358, height: 22, alignment: .center)
                    .padding(.top, 12)
                // Paper Button
                Button {
                    isPaperBtnActive = true
                    isChangeMyMindActive = true
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 48)
                            .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                            .frame(width: 342, height: 128)
                        Image("Paper")
                            .frame(width: 294, height: 80)
                    }
                }
                .opacity(isScissorsBtnActive == true ? 0 : 1)
                .opacity(isRockBtnActive == true ? 0 : 1)
                .padding(.top, 74)
                // Scissors Button
                Button(action: {
                    isScissorsBtnActive = true
                    isChangeMyMindActive = true
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 48)
                            .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                            .frame(width: 342, height: 128)
                        Image("Scissors")
                            .frame(width: 294, height: 80)
                    }
                })
                .opacity(isPaperBtnActive == true ? 0 : 1)
                .opacity(isRockBtnActive == true ? 0 : 1)
                // Rock Button
                Button(action: {
                    isRockBtnActive = true
                    isChangeMyMindActive = true
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 48)
                            .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                            .frame(width: 342, height: 128)
                        Image("Rock")
                            .frame(width: 294, height: 80)
                    }
                })
                .opacity(isScissorsBtnActive == true ? 0 : 1)
                .opacity(isPaperBtnActive == true ? 0 : 1)
                // Confirm Button
                HStack (spacing:10) {
                    Button {
                        isConfirmBtnActive = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
                            //  .frame(width: 100, height: 50)
                            NavigationLink(destination: OpponentPickLoadingScreen()){
                                Text("Confirm")
                                    .foregroundColor(.white)
                            }
                        }
                        .opacity(isChangeMyMindActive == true ? 1 : 0) // not showing button before any pick
                    }
                    // I changed my mind button
                    Button {
                        isPaperBtnActive = false
                        isScissorsBtnActive = false
                        isRockBtnActive = false
                        isChangeMyMindActive = false
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius:8)
                                .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
                            //  .frame(width: 200, height: 50)
                            Text("I changed my mind")
                                .foregroundColor(.white)
                                .font(.system(size: 16,weight: .semibold))
                        }
                        .opacity(isChangeMyMindActive == true ? 1 : 0) // not showing button before any pick
                        
                    }
                }
                .frame(width: 358, height: 50) // HStack's frame
                .padding(.top, 32) // HStack's padding
            }
        }
        // tab bar item name
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Round #1")
        .animation(.linear(duration: 1))
    }
}

struct PickChoiceScreen_Preview: PreviewProvider {
    static var previews: some View {
        PickChoiceScreen()
    }
}
