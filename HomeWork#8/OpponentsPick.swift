import SwiftUI

enum Picks {
    case paper
    case scissors
    case rock
    case none
}

struct OpponentPickScreen: View {
    var body: some View {
        OpponentPick()
    }
}

struct OpponentPick: View {
    
    //        @State private var number: Int = randomNumberPicker()
    @State private var isShowButtonPressed: Bool = false
    @State private var isZeroNumberOn: Bool = false
    @State private var isOneNumberOn: Bool = false
    @State private var isTwoNumberOn: Bool = false
    @State private var isContinueButtonActive: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                Text("Your opponent's pick")
                    .foregroundColor(.black)
                    .font(.system(size: 54, weight: .medium))
                    .frame(width: 358, height: 195, alignment: .center)
                    .multilineTextAlignment(.center)
                HStack{
                    // Show Opponent's pick
                    Button {
                        isShowButtonPressed = true
                        if randomNumberPicker() == 0 {
                            isZeroNumberOn = true
                        } else if randomNumberPicker() == 1 {
                            isOneNumberOn = true
                        } else {
                            isTwoNumberOn = true
                        }
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
                                .frame(width: 179, height: 50)
                            Text("Show pick")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                        }
                    }
                    // Continue Button
                    Button {
                        isContinueButtonActive = true
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
                                .frame(width: 179, height: 50)
                            NavigationLink(destination: ResultScreen()){
                                Text("Continue")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                        }
                    }
                }
                //                 paper pick
                Button {
                    print("button pressed")
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 48)
                            .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                            .frame(width: 342, height: 128)
                        Image("Paper")
                    }
                    .opacity(isZeroNumberOn == true ? 1 : 0)
                    .opacity(isOneNumberOn == true ? 0 : 1)
                    .opacity(isTwoNumberOn == true ? 0 : 1)
                    .padding(.top, 5)
                }
                
                //                 scissors pick
                Button {
                    print("button pressed")
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 48)
                            .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                            .frame(width: 342, height: 128)
                        Image("Scissors")
                    }
                    .opacity(isZeroNumberOn == true ? 0 : 1)
                    .opacity(isOneNumberOn == true ? 1 : 0)
                    .opacity(isTwoNumberOn == true ? 0 : 1)
                }
                
                //                 rock pick
                Button {
                    print("button pressed")
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 48)
                            .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                            .frame(width: 342, height: 128)
                        Image("Rock")
                    }
                    .opacity(isZeroNumberOn == true ? 0 : 1)
                    .opacity(isOneNumberOn == true ? 0 : 1)
                    .opacity(isTwoNumberOn == true ? 1 : 0)
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Round #1")
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Round #1")
        .animation(.linear(duration: 1))
    }
}

func randomNumberPicker () -> Int {
    let randomNumber = Int.random(in: 0...2)
    return randomNumber
}

struct OpponentPickScreen_Previews: PreviewProvider {
    static var previews: some View {
        OpponentPickScreen()
    }
}

// I could implement movement to next view only through buttons, could not do other way, kinda did not get how to implement functions in the view 
