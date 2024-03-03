class ProductDataProvider {
  // Method to fetch product data
  Future<List<Map<String, dynamic>>> fetchProductData() async {
    // Simulate an API call or database query
    await Future.delayed(const Duration(seconds: 2));
    // Assuming data is fetched from a remote server or local storage
    return [
      {
        "productName": "Laptop",
        "productDescription": "15.6-inch, Intel Core i7, 16GB RAM, 512GB SSD",
        "price": 1299.99,
        "iscart": true,
        "isfav": true,
        "imgurl":
            "https://imgeng.jagran.com/images/2023/sep/best%2015%20inch%20laptops%20in%20India1695872319038.jpg",
      },

      {
        "productName": "Smartphone",
        "productDescription":
            "6.5-inch, 128GB Storage, 8GB RAM, Snapdragon 888",
        "price": 799.99,
        "iscart": false,
        "isfav": false,
        "imgurl": "https://cdn.moglix.com/p/C31GW101Yow1O-xxlarge.jpg",
      },

      {
        "productName": "Headphones",
        "productDescription":
            "Over-ear Bluetooth Headphones with Active Noise Cancellation",
        "price": 199.99,
        "iscart": false,
        "isfav": true,
        "imgurl": "https://m.media-amazon.com/images/I/71VR6c3j2bL.jpg",
      },
      {
        "productName": "Camera",
        "productDescription": "Mirrorless Camera with 24MP Sensor, 4K Video",
        "price": 1499.99,
        "iscart": false,
        "isfav": false,
        "imgurl":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6DQFnoCVrPz6TRX9XjfBpYAow0dNh-YamqEI51kCoVFsZpbOwMXyXfLuOJHVSb4hk-kY&usqp=CAU",
      },

      {
        "productName": "Smartwatch",
        "productDescription":
            "Fitness Tracker with Heart Rate Monitor, GPS, and Waterproof Design",
        "price": 249.99,
        "iscart": true,
        "isfav": false,
        "imgurl":
            "data:image/jpeg;base64,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",
      },

      {
        "productName": "Wireless Mouse",
        "productDescription": "Ergonomic Mouse with 6 Programmable Buttons",
        "price": 39.99,
        "iscart": false,
        "isfav": true,
        "imgurl":
            "https://m.media-amazon.com/images/I/51sTLdrBAPL._AC_UF1000,1000_QL80_.jpg"
      },

      {
        "productName": "External Hard Drive",
        "productDescription": "2TB Portable USB 3.0 External Hard Drive",
        "price": 89.99,
        "iscart": true,
        "isfav": true,
        "imgurl": "https://m.media-amazon.com/images/I/71VR6c3j2bL.jpg",
      },
      {
        "productName": "Gaming Console",
        "productDescription": "Next-gen Gaming Console with 4K HDR Support",
        "price": 499.99,
        "iscart": true,
        "isfav": false,
        "imgurl": "https://cdn.moglix.com/p/C31GW101Yow1O-xxlarge.jpg",
      },

      // Add more dummy data here
    ];
  }
}
