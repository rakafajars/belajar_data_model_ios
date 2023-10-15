//
//  ContentView.swift
//  ModelDataSwift
//
//  Created by Raka Fajar on 14/10/23.
//

import SwiftUI

/// Model Data
struct ProductModel : Identifiable {
    let id: Int
    let namaProduct: String
    let fotoProduct: String
    let hargaProduct: Int
    let lokasi: String
    let ratingCount: Int
    let jumlahRating: Int
    
    init(id: Int, namaProduct: String, fotoProduct: String, hargaProduct: Int, lokasi: String, ratingCount: Int, jumlahRating: Int) {
        self.id = id
        self.namaProduct = namaProduct
        self.fotoProduct = fotoProduct
        self.hargaProduct = hargaProduct
        self.lokasi = lokasi
        self.ratingCount = ratingCount
        self.jumlahRating = jumlahRating
    }
}

struct ContentView: View {
    // data baru
    let data : [ProductModel] = [
        ProductModel(id: 1, namaProduct: "Sepedah BMX", fotoProduct: "sepedah", hargaProduct: 50000000, lokasi: "Kab.Bandung", ratingCount: 4, jumlahRating: 56),
        ProductModel(id: 2, namaProduct: "Sepedah Kuda", fotoProduct: "sepedah1", hargaProduct: 21000000, lokasi: "Kab.Bandung", ratingCount: 1, jumlahRating: 32),
        ProductModel(id: 3, namaProduct: "Sepedah Gunung", fotoProduct: "sepedah2", hargaProduct: 320000000, lokasi: "Kab.Bandung", ratingCount: 2, jumlahRating: 10),
        ProductModel(id: 4, namaProduct: "Sepedah Polygon", fotoProduct: "sepedah3", hargaProduct: 40000000, lokasi: "Kab.Bandung", ratingCount: 4, jumlahRating: 4),
        ProductModel(id: 5, namaProduct: "Sepedah BTM", fotoProduct: "sepedah4", hargaProduct: 34200000, lokasi: "Kab.Bandung", ratingCount: 5, jumlahRating: 80),
    ]
    
    @State var jumlahKeranjang:Int = 0
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(data) {
                    row in
                    VStack(spacing:10) {
                        Product(data: row,
                                jumlahProduct: $jumlahKeranjang
                        )
                    }
                    .padding()
                }
            }
            .navigationTitle("Sepedah MTB")
            .navigationBarItems(
                trailing: HStack(spacing:20) {
                    Button(action: {print("Perosn")})
                    {
                        Image(systemName: "person.fill")
                    }
                    
                    keranjangView(jumlah: $jumlahKeranjang)
                    
                }
            )
        }
        .accentColor(Color.secondary)
        // mengatasi rotate hp
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct keranjangView: View {
    @Binding var jumlah:Int
    var body: some View {
        ZStack {
            Button(action: {print("Cart")})
            {
                Image(systemName: "cart.fill")
            }
            
            // jumlah isi keranjang
            Text("\(jumlah)")
                .foregroundColor(Color.white)
                .frame(width: 10, height: 10)
                .font(.body)
                .padding(5)
                .background(Color.red)
                .clipShape(Circle())
                .offset(x:10, y:-10)

        }
    }
}


struct Product:View {
    let data: ProductModel
    
    
    @Binding var jumlahProduct: Int
    var body: some View {
        VStack(alignment:.leading){
            // foto
            ZStack(alignment:.topTrailing){
                Image(self.data.fotoProduct)
                    .resizable().aspectRatio(contentMode: .fill)
                    .frame(height:200)
                    .clipped()
                
                Button(action: {print("Ok")}){
                    Image(systemName: "heart")
                        .padding()
                        .foregroundColor(Color.red)
                }
            }
            // title
            Text(data.namaProduct)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            Text("Rp. \(self.data.hargaProduct)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.red)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.lokasi)
            }
            .padding(.leading)
            .padding(.trailing)
            
            HStack{
                HStack {
                    ForEach(0..<data.ratingCount, id: \.self){
                        items in
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    }
                }
            }
            .padding(.leading)
            .padding(.trailing)
            
            tambahkeranjang(
                jumlah: $jumlahProduct)
            
   
        }
        .background(Color("warna"))
        .cornerRadius(15)
    }
}


struct tambahkeranjang : View {
    @Binding var jumlah: Int
    var body: some View {
        Button(action: {self.jumlah+=1}) {
            HStack{
                Spacer()
                HStack{
                    Image(systemName: "cart")
                    Text("Tambah Ke Keranjang")
                        .font(.callout)
                        .padding()
                }
                Spacer()
            }
        }
        .background(Color.green)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    ContentView()
}


