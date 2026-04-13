from flask import Blueprint, render_template, request, session, redirect
from models import Product

# ✅ khai báo trước
products = Blueprint("products", __name__)

@products.route("/products")
def products_page():
    if "user" not in session:
        return redirect("/login")

    all_products = Product.query.all()

    brand = request.args.get("brand", "").lower()
    price = request.args.get("price", "")

    if brand:
        all_products = [p for p in all_products if p.category.lower() == brand]

    if price == "1":
        all_products = [p for p in all_products if p.price < 10_000_000]
    elif price == "2":
        all_products = [p for p in all_products if 10_000_000 <= p.price <= 20_000_000]
    elif price == "3":
        all_products = [p for p in all_products if p.price > 20_000_000]

    return render_template("products.html", products=all_products)
