import Foundation
import SwiftUI

func load<T: Decodable>() -> T {
    let data: Data
    
    let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    let fileUrl = documentDirectoryUrl!.appendingPathComponent("list.json")
    
    do {
        data = try Data(contentsOf: fileUrl  )
    } catch {
        fatalError("Couldn't load \n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse as \(T.self):\n\(error)")
    }
}

var documents: [Document] = load()

//var documents: [Document] = [Document(), Document()]


struct Document : Hashable, Codable, Identifiable{
    var id = 0
    var n: String = ""
    var sname: String = ""
    var dob: String = ""
    var na: String = ""
    var dp: String = ""
    var dt: String = ""
    var des: String = ""
    var at: String = ""
    var ts: String = ""
    var vc: String = ""
    var vt: String = ""
    var vs: String = ""
    var prep: String = ""
}

let docTHtoHK = Document(n:"Nawapon",sname: "Sangsiri", dob:"02/02/2002", na:"Thai", dp:"Thailand", dt:"1400", des:"Hong Kong", at:"1800", ts:"none", vc:"none", vt:"student", vs:"vaccinated")

let docTHtoEN = Document(n:"Nawapon",sname: "Sangsiri", dob:"02/02/2002", na:"Thai", dp:"Thailand", dt:"1400", des:"England", at:"1800", ts:"none", vc:"none", vt:"traveller", vs:"vaccinated", prep:"Before you travel to England you must \n \t 1. book and pay for a COVID-19 test (to be taken before the end of day 2 in England) \n \t 2. complete a passenger locator form (to be completed in the 48 hours before you arrive in England). \nYou can choose a lateral flow test or a PCR test. \n \t- You will need to enter your COVID-19 test booking reference number on your passenger locator form. \n \t- If you will be in England for less than 2 days you still need to book and pay for a day 2 COVID-19 test. \nWhen you arrive in England \n \t- After you arrive in England you must take a COVID-19 test on or before day 2. The day you arrive is day 0. \n \t- You must book this test before you travel. ")

struct DocumentDetail : View {
    var document: Document
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text( document.dp + " to " + document.des)
                        .font(.title)
                    HStack{
                        Text(document.n + " " + document.sname + ", " + document.na)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()

                    Group{
                        Text("Depart at: " + document.dt)
                        Text("Arrive at: " + document.at)
                        Text("Transit: " + document.ts)
                        Text("Have visited: " + document.vc)
                        Text("Visa type: " + document.vt)
                        Text("Vaccination: " + document.vs)
                    }
                    .padding(.bottom,3)
                }
                Divider()
                
                Text( "Travelling Arangement" )
                        .font( .title2 )
                
                Divider()
                
                Text( document.prep )
            }
            .padding()
            .offset(y:-50)
        }

    }
}




struct DocumentRow : View {
    var document: Document
    
    var body: some View {
        HStack{
            Text( document.dp +  " to " + document.des )
            
        }
        
    }
}

struct DocumentList: View {
    var body: some View {
        VStack {
            List(documents) { document in
                NavigationLink{
                    DocumentDetail(document: document)
                } label : {
                    DocumentRow(document: document)
                }
            }
            
        }
    }
}
