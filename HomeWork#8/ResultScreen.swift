import SwiftUI

struct ResultScreen: View {
    var body: some View {
        ResultRound()
    }
}

struct ResultRound: View {
    var body: some View {
        Text("Result")
        
        // could not do rest of the HW on time, I'll do it later for myself
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Round #1")
            .animation(.linear(duration: 1))
    }
}

struct ResultScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResultScreen()
    }
}
