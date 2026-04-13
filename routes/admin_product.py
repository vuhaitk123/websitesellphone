from flask import Blueprint, render_template, request, redirect
from models import Product
from extensions import db

admin_product = Blueprint("admin_product", __name__)

@admin_product.route("/admin/products")
def products():
    products = Product.query.all()
    return render_template("admin/products.html", products=products)


@admin_product.route("/admin/products/add", methods=["GET", "POST"])
def add_product():
    if request.method == "POST":
        p = Product(
            name=request.form["name"],
            price=float(request.form["price"]),
            old_price=float(request.form.get("old_price", 0)),
            stock=int(request.form["stock"]),
            image=request.form["image"],
            category=request.form["category"]
        )
        db.session.add(p)
        db.session.commit()
        return redirect("/admin/products")

    return render_template("admin/add_product.html")


@admin_product.route("/admin/products/edit/<int:id>", methods=["GET", "POST"])
def edit_product(id):
    p = Product.query.get_or_404(id)

    if request.method == "POST":
        p.name = request.form["name"]
        p.price = float(request.form["price"])
        p.old_price = float(request.form.get("old_price", 0))
        p.stock = int(request.form["stock"])
        p.image = request.form["image"]
        p.category = request.form["category"]

        db.session.commit()
        return redirect("/admin/products")

    return render_template("admin/edit_product.html", p=p)


@admin_product.route("/admin/products/delete/<int:id>")
def delete_product(id):
    p = Product.query.get_or_404(id)
    db.session.delete(p)
    db.session.commit()
    return redirect("/admin/products")
