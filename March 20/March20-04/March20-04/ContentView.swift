//
//  ContentView.swift
//  March20-04
//
//  Created by Paras  on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    
    
    var cities: [City] = [
        City(cityId: 1, name: "Mumbai", landmarks: [Landmark(landmarkId: 15, name: "Gateway of India", photo: "goi", description: "The Gateway of India is an arch-monument built in the early twentieth century in the city of Mumbai, in the Indian state of Maharashtra. It was erected to commemorate the landing in December 1911 at Apollo Bunder, Mumbai (then Bombay) of King-Emperor George V and Queen-Empress Mary, the first British monarch to visit India."),Landmark(landmarkId: 22, name: "Marine Drive", photo: "md", description: "Marine Drive is a 3.6-kilometre-long Promenade along the Netaji Subhash Chandra Bose Road in South Mumbai in the city of Mumbai, India. Often, the names Marine Drive and Netaji Subhash Chandra Bose Road are used interchangeably to refer to this 3.9km stretch.")]),
        
        City(cityId: 2, name: "Pune", landmarks: [Landmark(landmarkId: 30, name: "Dagadusheth Halwai Ganapati Temple", photo: "temple", description: "Shreemant Dagadusheth Halwai Ganapati Temple (Marathi: श्रीमंत दगडूशेठ हलवाई गणपती) in Pune is dedicated to the Hindu God Ganesh. The temple is popular in Maharashtra and is visited by over hundred thousand pilgrims every year."), Landmark(landmarkId: 222, name: "Sinhagad Fort", photo: "fort", description: "Sinhagad is a hill fortress located at around 35 km southwest of the city of Pune, India. Some of the information available at this fort suggests that the fort could have been built 2000 years ago. The caves and the carvings in the Kaundinyeshwar temple stand as proofs for the same.")])
    
    ]
    
    var body: some View {
        
        NavigationView{
            
            List{
                
                ForEach(cities, id: \.cityId) { city in
                    
                    Section(header: Text(city.name)){
                        
                        ForEach(city.landmarks, id: \.landmarkId){
                            landmark in
                            NavigationLink(destination: LandmarkDetailView(landmark: landmark)) {
                                LandmarkRow(landmark: landmark)
                            }
                            
                            //section ends
                        }
                        
                    }
                }
                
                //List ends
            }
            .navigationBarTitle(Text("Landmark"))
            //navigation ends
        }
        //view ends
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
