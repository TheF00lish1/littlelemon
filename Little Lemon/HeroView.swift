//
//  HeroView.swift
//  Little Lemon
//
//  Created by David Duprez-Goulet on 2023-03-04.
//

import SwiftUI

// just to make it easier to style and reach the "wanted finished product styling" I separated the hero section of the ui. makes the code more clean as well


struct HeroView: View {
    var body: some View {
    
        VStack(alignment: .leading){
            Text("Little Lemon")
                .modifier(heading())
            Text("Chicago")
                .modifier(subheading())
            HStack(alignment: .top){
                VStack{
                  
           
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist. ")
                        .frame(width: 230, height: 100)
                        .modifier(about())
                        
                }
                
                    Image("Hero image")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .frame(width: 135, height: 135)
                        .offset( y: -35)
                        .padding(.trailing)
             


            }
     


        }

        .background(Color("Primary green"))
        
    }
       
    
    struct heading: ViewModifier {
    func body(content: Content) ->some View {
           content
            .font(.custom("Helvetica", size: 40))
                .fontWeight(.bold)
                .padding(.leading, 15.0)
                .foregroundColor(Color("Primary yellow"))
                .padding(.top)
                .kerning(0.4)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    struct subheading: ViewModifier {
    func body(content: Content) ->some View {
           content
            .font(.custom("Helvetica", size: 26))
            .fontWeight(.medium)
                .padding(.leading, 15.0)
                .foregroundColor(Color("Highlight off white"))
        }
    }

    struct about: ViewModifier {
    func body(content: Content) ->some View {
           content
            .font(.custom("Helvetica", size: 17))
            .foregroundColor(Color("Highlight off white"))
            .padding(.leading, 15.0)
            
                
        }
    }

       
}




struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
