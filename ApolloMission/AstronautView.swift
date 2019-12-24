//
//  AstronautView.swift
//  ApolloMission
//
//  Created by Alexander Römer on 20.12.19.
//  Copyright © 2019 Alexander Römer. All rights reserved.
//
import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id).resizable().scaledToFit().frame(maxWidth: geo.size.width).padding(.top)
                    Text(self.astronaut.description).padding()
                        .layoutPriority(1)
                    //                        Spacer(minLength: 25)
                }
                .navigationBarTitle(Text(self.astronaut.name), displayMode: .inline)
            }
        }
    }
    
}

struct AstronautView_Previews: PreviewProvider {
    
    static let astronaut: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronaut[0])
    }
}
