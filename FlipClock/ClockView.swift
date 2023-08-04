//
//  ClockView.swift
//  FlipClock
//
//  Created by 唐浪 on 2023/8/4.
//

import SwiftUI

struct ClockView: View {
    @State var start: Bool = false
    @State var end: Bool = false
    
    @State var num: Int = 9
    
    var body: some View {
        ZStack {
//            Color.black
            
            ZStack {
                RoundedRec(color: .green)
                NumberText(num: num)
                
                ZStack {
                    RoundedRec(color: .red)
                    NumberText(num: num)
                }
                .mask {
                    RoundedRec(height: 120)
                        .offset(y: -60)
                }
                .rotation3DEffect(
                    .degrees(start ? 90 : 0),
                    axis: (x: -1, y: 0, z: 0),
                    anchor: .center,
                    anchorZ: 0,
                    perspective: 0.5
                )
                
                
                ZStack {
                    RoundedRec(color: .red)
                    NumberText(num: num)
                }
                .mask {
                    RoundedRec(height: 120)
                        .offset(y: 60)
                }
                .rotation3DEffect(
                    .degrees(end ? 0 : 90),
                    axis: (x: 1, y: 0, z: 0),
                    anchor: .center,
                    anchorZ: 0,
                    perspective: 0.5
                )
            }
            .onTapGesture {
                withAnimation {
                    start.toggle()
                    end.toggle()
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}

struct RoundedRec: View {
    var width: CGFloat = 169
    var height: CGFloat = 189
    var color: Color = .gray
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .frame(width: width, height: height)
            .foregroundColor(color)
    }
}

struct NumberText: View {
    var num: Int = 0
    
    var body: some View {
        Text("\(num)")
            .fontWeight(.bold)
            .font(.system(size: 180))
    }
}
