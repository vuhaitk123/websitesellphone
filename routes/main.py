from flask import Blueprint, render_template, session, redirect, request
from models import Product   # 👈 thêm dòng này

main = Blueprint("main", __name__)

@main.route("/")
def home():
    if "user" not in session:
        return redirect("/login")

    keyword = request.args.get("q", "").lower()

    # lấy dữ liệu từ DB
    products = Product.query.all()

    # filter search
    def filter_products(products):
        if keyword:
            return [
                p for p in products
                if keyword.replace(" ", "") in p.name.lower().replace(" ", "")
            ]
        return products

    # chia theo category
    iphones = filter_products([p for p in products if p.category == "iphone"])
    samsungs = filter_products([p for p in products if p.category == "samsung"])
    xiaomis = filter_products([p for p in products if p.category == "xiaomi"])
    realmes = filter_products([p for p in products if p.category == "realme"])

    return render_template(
        "index.html",
        iphone=iphones,
        samsung=samsungs,
        xiaomi=xiaomis,
        realme=realmes,
        keyword=keyword
    )
