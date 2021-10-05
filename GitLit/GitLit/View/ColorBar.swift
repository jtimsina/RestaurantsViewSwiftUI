//
//  ColorBar.swift
//  GitLit
//
//  Created by Field Employee on 28/09/2021.
//

import SwiftUI

struct ColorBar: View {
    
    @State var colorIndex = 0
    let colors = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.purple]
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
        Rectangle()
            .fill(colors[colorIndex])
            .frame(width: geometry.size.width, height: 20)
            .onReceive(timer) { _ in
                                            
                if colorIndex == colors.count - 1 {
                    timer.upstream.connect().cancel()
                                                
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(.linear(duration: 2)) { self.colorIndex = 0 }
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    }
                                                
                } else {
                    withAnimation(.linear(duration: 1)) { self.colorIndex += 1 }
                }
            }
        }
    }
}

struct ColorBar_Previews: PreviewProvider {
    static var previews: some View {
        ColorBar()
    }
}
