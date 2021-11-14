//
//  CreateNewDestination.swift
//  Hello Color
//
//  Created by Nawapon Sangsiri on 14/11/2564 BE.
//

import SwiftUI

//input1
var n: String = ""
var sname: String = ""
var dob: String = ""
var na: String = ""
//input2
var dp: String = ""
var dt: String = ""
var des: String = ""
var at: String = ""
var ts: String = ""
var vc: String = ""
//input3
var vt: String = ""
var vs: String = ""

var complete: Bool = false
var countID: Int = 0


func saveToJsonFile( dataArray: Any ) {
    //e.g. let dataArray =  [["person": ["name": "Dani", "age": "24"]], ["person": ["name": "ray", "age": "70"]]]
    
    /**guard let documentDirectoryUrl = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Couldn't find \(fileName) in main bundle.")
        }*/
    
    guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
    print(documentDirectoryUrl)
    let fileUrl = documentDirectoryUrl.appendingPathComponent("list.json")

    /**fileUrl == file:///Users/nawaponsangsiri/Library/Developer/CoreSimulator/Devices/829C2328-92EE-4D36-A45D-D5358DAE5DB9/data/Containers/Data/Application/4C47309F-20FC-42CA-B0B3-6EC33A24DC33/Documents/list.json
    **/

    // Transform array into data and save it into file
    do {
        let data = try JSONSerialization.data(withJSONObject: dataArray, options: [])
        print("saving to", fileUrl)
        try data.write(to: fileUrl, options: [])
        print("success..")
    } catch {
        print(error)
    }
}

func createDataArray() -> Any {
    countID = countID + 1
    return [["id":countID, "n":n, "sname":sname, "dob":dob, "na":na, "dp":dp, "dt":dt, "des":des, "at":at, "ts":ts, "vc":vc, "vt":vt, "vs":vs ]]
}

struct End: View {
    var body: some View {
        Text("end!")
    }
}

struct Input3: View {
    @State private var visaType: String = ""
    @State private var vaccinationStatus: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View { Button(action: {
        vt = visaType
        vs = vaccinationStatus
        let dataArray = createDataArray()
        saveToJsonFile(dataArray: dataArray)
        complete = true
        self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Submit")
        }
    }
    
    var body: some View{
        VStack{
            Text("Personal Information")
                .font(.title)
            
            VStack{
                HStack{
                    Text("Visa Type: ")
                    TextField("", text: $visaType)
                }
                HStack{
                    Text("Vaccination Status: ")
                    TextField("", text: $vaccinationStatus)
                }
            }
            .padding()
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}



struct Input2: View {
    @State private var departPlace: String = ""
    @State private var departTime: String = ""
    @State private var destination: String = ""
    @State private var arrivalTime: String = ""
    @State private var transitStop: String = ""
    @State private var visitedCountry: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    var body: some View{
        
        VStack{
            Text("Personal Information")
                .font(.title)
            
            VStack{
                HStack{
                    Text("Departure Place: ")
                    TextField("", text: $departPlace)
                }
                HStack{
                    Text("Departure Time: ")
                    TextField("", text: $departTime)
                }
                HStack{
                    Text("Destination: ")
                    TextField("", text: $destination)
                }
                HStack{
                    Text("Arrival Time: ")
                    TextField("", text: $arrivalTime)
                }
                HStack{
                    Text("Transit stop: ")
                    TextField("", text: $transitStop)
                }
                HStack{
                    Text("Visited Country: ")
                    TextField("", text: $visitedCountry)
                }
            }
            .padding()
            
            Spacer()
            
            NavigationLink(destination: Input3()) {
                Text("Next")
            }.simultaneousGesture(TapGesture().onEnded{
                dp = departPlace
                dt = departTime
                des = destination
                at = arrivalTime
                ts = transitStop
                vc = visitedCountry
            })
            
        }.onAppear(perform: {
            if complete==true{
                self.presentationMode.wrappedValue.dismiss()
            }
        })
        
    }
}

struct Input1: View {
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var dateOfBirth: String = ""
    @State private var nationality: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            Text("Personal Information")
                .font(.title)
            
            VStack{
                HStack{
                    Text("Name: ")
                    TextField("", text: $name)
                }
                
                HStack{
                    Text("Surname: ")
                    TextField("", text: $surname)
                    
                }
                
                HStack{
                    Text("Date Of Birth: ")
                    TextField("", text: $dateOfBirth)
                    
                }
                
                HStack{
                    Text("Nationality: ")
                    TextField("", text: $nationality)
                }
                
            }
            .padding()
            
            Spacer()
            
            NavigationLink(destination: Input2()){
                Text("Next")
            }.simultaneousGesture(TapGesture().onEnded{
                n = name
                sname = surname
                dob = dateOfBirth
                na = nationality
            })
                            
        }.onAppear(perform: {
            if complete==true{
                self.presentationMode.wrappedValue.dismiss()
            }
        })
        
    }
}
