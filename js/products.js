let iphones = [
    {
        name: "iPhone 15 ",
        img: "iphone1.jpg",
        price: "15.990.000đ",
        old: "14.990.000đ",
        sale: "1.000.000đ",
        rate: "30"
    },
    {
        name: "iPhone 16",
        img: "iphone2.jpg",
        price: "17.690.000đ",
        old: "19.990.000đ",
        sale: "2.300.000đ",
        rate: "10"
    },
    {
        name: "iPhone 17",
        img: "iphone3.jpg",
        price: "21.000.000đ",
        old: "19.000.000đ",
        sale: "2.000.000đ",
        rate: "5"
    },
    {
        name: "iPhone 12",
        img: "iphone4.jpg",
        price: "15.000.000đ",
        old: "12.000.000đ",
        sale: "3.000.000đ",
        rate: "5"
    },
    {
        name: "iPhone 11",
        img: "iphone5.jpg",
        price: "11.000.000đ",
        old: "9.000.000đ",
        sale: "2.000.000đ",
        rate: "5"
    },
    {
        name: "iPhone 14 pro max",
        img: "iphone6.jpg",
        price: "21.000.000đ",
        old: "19.000.000đ",
        sale: "2.000.000đ",
        rate: "5"
    },
    {
        name: "iPhone 17 pro max",
        img: "iphone7.jpg",
        price: "32.000.000đ",
        old: "29.000.000đ",
        sale: "2.000.000đ",
        rate: "5"
    },
    {
        name: "iPhone 15 pro max",
        img: "iphone8.jpg",
        price: "24.000.000đ",
        old: "20.000.000đ",
        sale: "3.000.000đ",
        rate: "7"
    },
    {
        name: "iPhone 16 pro max",
        img: "iphone9.jpg",
        price: "28.000.000đ",
        old: "25.000.000đ",
        sale: "3.000.000đ",
        rate: "5"
    },
    {
        name: "iPhone 11 pro max",
        img: "iphone10.jpg",
        price: "12.000.000đ",
        old: "9.000.000đ",
        sale: "3.000.000đ",
        rate: "25"
    },

];

// render ra HTML
let container = document.getElementById("iphone-list");

if(container){
    iphones.forEach(p => {
        container.innerHTML += `
            <div class="product-card">
                <img src="static/images/iphone/${p.img}">
                <h3>${p.name}</h3>

                <p class="price">${p.price}</p>
                <p class="old-price">${p.old}</p>

                <div class="sale">🔥 Giảm ${p.sale}</div>

                <div class="rating">
                    ⭐⭐⭐⭐⭐ <span>${p.rate} đánh giá</span>
                </div>
            </div>
        `;
    });
}
// samsung
let samsung = [
    {
        name: "OPPO A79 5G",
        img: "ss1.jpg",
        price: "Liên hệ",
        old: "",
        sale: "",
        rate: "5"
    },
    {
        name: "Samsung Galaxy S25 5G Chính hãng",
        img: "ss2.jpg",
        price: "13.490.000đ",
        old: "18.490.000đ",
        sale: "5.000.000đ",
        rate: "4"
    },
    {
        name: "Samsung Galaxy A36 5G",
        img: "ss3.jpg",
        price: "6.190.000đ",
        old: "7.490.000đ",
        sale: "1.300.000đ",
        rate: "4"
    },
    {
        name: "Samsung Galaxy Tab S8 Ultra Wifi 5G Chính hãng",
        img: "ss4.jpg",
        price: "12.490.000đ",
        old: "13.990.000đ",
        sale: "1.500.000đ",
        rate: "5"
    },
    {
        name: "Samsung Galaxy Tab S8 Wifi 5G chính hãng",
        img: "ss5.jpg",
        price: "7.990.000đ",
        old: "9.990.000đ",
        sale: "2.000.000đ",
        rate: "5"
    },
    {
        name: "Samsung Galaxy S25 Ultra 5G 12GB/512GB Chính hãng",
        img: "ss6.jpg",
        price: "24.490.000đ",
        old: "28.490.000đ",
        sale: "4.000.000đ",
        rate: "5"
    },
    {
        name: "OPPO Reno15 F 5G chính hãng",
        img: "ss7.jpg",
        price: "8.290.000đ",
        old: "10.290.000đ",
        sale: "2.000.000đ",
        rate: "4"
    },
    {
        name: "OPPO Reno14 F 5G chính hãng",
        img: "ss8.jpg",
        price: "7.290.000đ",
        old: "9.190.000đ",
        sale: "1.900.000đ",
        rate: "4"
    },
    {
        name: "Honor X7d Chính hãng",
        img: "ss9.jpg",
        price: "3.990.000đ",
        old: "5.890.000đ",
        sale: "1.900.000đ",
        rate: "5"
    },
    {
        name: "Honor X9c 5G 12GB/256GB Chính hãng",
        img: "ss10.jpg",
        price: "5.990.000đ",
        old: "7.290.000đ",
        sale: "1.300.000đ",
        rate: "5"
    }
];

// render ra HTML
let containers = document.getElementById("samsung-list");

if(containers){
    samsung.forEach(p => {
        containers.innerHTML += `
            <div class="product-card">
                <img src="static/images/samsung/${p.img}">
                <h3>${p.name}</h3>

                <p class="price">${p.price}</p>
                <p class="old-price">${p.old}</p>

                <div class="sale">🔥 Giảm ${p.sale}</div>

                <div class="rating">
                    ⭐⭐⭐⭐⭐ <span>${p.rate} đánh giá</span>
                </div>
            </div>
        `;
    });
}
// XIAOMI
let xiaomi = [
    {
        name: "Xiaomi 17 Ultra",
        img: "x1.jpg",
        price: "26.690.000đ",
        old: "",
        sale: "",
        rate: "4"
    },
    {
        name: "Xiaomi REDMI K90",
        img: "x2.jpg",
        price: "9.990.000đ",
        old: "",
        sale: "",
        rate: "5"
    },
    {
        name: "Xiaomi 17 Pro",
        img: "x3.jpg",
        price: "18.990.000đ",
        old: "",
        sale: "",
        rate: "5"
    },
    {
        name: "Xiaomi Redmi Note 15 5G",
        img: "x4.jpg",
        price: "3.450.000đ",
        old: "3.950.000đ",
        sale: "500.000đ",
        rate: "5"
    },
    {
        name: "Xiaomi Redmi Turbo 5 Max 5G",
        img: "x5.jpg",
        price: "8.890.000đ",
        old: "9.690.000đ",
        sale: "800.000đ",
        rate: "5"
    },
    {
        name: "Xiaomi Redmi Note 15 Pro 5G",
        img: "x6.jpg",
        price: "5.690.000đ",
        old: "6.090.000đ",
        sale: "400.000đ",
        rate: "5"
    },
    {
        name: "Xiaomi Redmi Turbo 5 5G",
        img: "x7.jpg",
        price: "8.090.000đ",
        old: "9.090.000đ",
        sale: "1.000.000đ",
        rate: "4"
    },
    {
        name: "Xiaomi Redmi Note 15 Pro Plus 5G",
        img: "x8.jpg",
        price: "7.590.000đ",
        old: "8.390.000đ",
        sale: "800.000đ",
        rate: "4"
    },
    {
        name: "Xiaomi Redmi Turbo 4 5G",
        img: "x9.jpg",
        price: "6.290.000đ",
        old: "7.390.000đ",
        sale: "1.100.000đ",
        rate: "5"
    },
    {
        name: "Xiaomi Redmi Turbo 4 Pro 5G",
        img: "x10.jpg",
        price: "7.450.000đ",
        old: "7.950.000đ",
        sale: "500.000đ",
        rate: "5"
    }
];

let containers_x = document.getElementById("xiaomi-list");

if(containers_x){
    xiaomi.forEach(p => {
        containers_x.innerHTML += `
            <div class="product-card">
                <img src="static/images/xiaomi/${p.img}">
                <h3>${p.name}</h3>

                <p class="price">${p.price}</p>
                <p class="old-price">${p.old}</p>

                <div class="sale">🔥 Giảm ${p.sale}</div>

                <div class="rating">
                    ⭐⭐⭐⭐⭐ <span>${p.rate} đánh giá</span>
                </div>
            </div>
        `;
    });
}
//REALME
let realme = [
    {
        name: "Realme Neo8",
        img: "r1.jpg",
        price: "9.390.000đ",
        old: "",
        sale: "",
        rate: "5"
    },
    {
        name: "Realme GT8 Pro",
        img: "r2.jpg",
        price: "14.990.000đ",
        old: "",
        sale: "",
        rate: "5"
    },
    {
        name: "Realme GT8",
        img: "r3.jpg",
        price: "10.990.000đ",
        old: "",
        sale: "",
        rate: "5"
    },
    {
        name: "Realme C65s",
        img: "r4.jpg",
        price: "Liên hệ",
        old: "",
        sale: "",
        rate: "5"
    },
    {
        name: "Realme GT7 Pro (Racing Edition)",
        img: "r5.jpg",
        price: "11.290.000đ",
        old: "",
        sale: "",
        rate: "5"
    },
    {
        name: "Realme GT7 Pro",
        img: "r6.jpg",
        price: "12.990.000đ",
        old: "",
        sale: "",
        rate: "5"
    },
    {
        name: "Realme V30T 5G",
        img: "r7.png",
        price: "2.390.000đ",
        old: "3.390.000đ",
        sale: "1.000.000đ",
        rate: "5"
    },
    {
        name: "Realme 12 Pro Plus 5G",
        img: "r8.jpg",
        price: "6.390.000đ",
        old: "9.990.000đ",
        sale: "3.600.000đ",
        rate: "5"
    },
    {
        name: "Realme GT6 5G",
        img: "r9.png",
        price: "7.650.000đ",
        old: "11.890.000đ",
        sale: "4.240.000đ",
        rate: "5"
    },
    {
        name: "Realme GT Neo6 5G",
        img: "r10.png",
        price: "6.490.000đ",
        old: "9.690.000đ",
        sale: "3.200.000đ",
        rate: "5"
    }
];
let containers_r = document.getElementById("realme-list");

if(containers_r){
    realme.forEach(p => {
        containers_r.innerHTML += `
            <div class="product-card">
                <img src="static/images/realme/${p.img}">
                <h3>${p.name}</h3>

                <p class="price">${p.price}</p>
                <p class="old-price">${p.old}</p>

                <div class="sale">🔥 Giảm ${p.sale}</div>

                <div class="rating">
                    ⭐⭐⭐⭐⭐ <span>${p.rate} đánh giá</span>
                </div>
            </div>
        `;
    });
}