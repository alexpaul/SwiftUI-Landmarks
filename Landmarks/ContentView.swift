//
//  ContentView.swift
//  Landmarks
//
//  Created by Alex Paul on 6/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import SwiftUI

struct ContentView : View {
  var body: some View {
    VStack {
      MapView()
        .edgesIgnoringSafeArea(.top)
        .frame(height: 300)
      CircleImage()
        .offset(y: -130)
        .padding(.bottom, -130)
      VStack (alignment: .leading) {
        Text("Turtle Rock")
          .font(.title)
          .color(.green)
        HStack {
          Text("Joshua Tree National Park")
            .font(.subheadline)
          Spacer()
          Text("California")
            .font(.subheadline)
        }
      }
      .padding()
      
      Spacer()
    }
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
    
    //ContentView()
  }
}
#endif
