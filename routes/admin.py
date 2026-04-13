from flask import Blueprint, render_template, session, redirect,request
from models import User, Cart, Order, Product
from extensions import db

admin = Blueprint("admin", __name__)

# ================== CHECK ADMIN ==================
def is_admin():
    user = User.query.filter_by(username=session.get("user")).first()
    return user and user.role == "admin"


# ================== DASHBOARD ==================
@admin.route("/admin")
def dashboard():
    if not is_admin():
        return "Không có quyền!"

    total_users = User.query.count()
    total_cart = Cart.query.count()
    total_orders = Order.query.count()

    return render_template(
        "admin/dashboard.html",
        users=total_users,
        cart=total_cart,
        orders=total_orders
    )


# ================== USER ==================
@admin.route("/admin/users")
def users():
    if not is_admin():
        return "Không có quyền!"

    data = User.query.all()
    return render_template("admin/users.html", users=data)


@admin.route("/admin/delete_user/<int:id>")
def delete_user(id):
    if not is_admin():
        return "Không có quyền!"

    user = User.query.get(id)
    if user:
        db.session.delete(user)
        db.session.commit()
    # Sau khi xóa thì quay lại trang danh sách user
    return redirect("/admin/users")


# ================== ORDERS ==================
@admin.route("/admin/orders")
def orders():
    if not is_admin():
        return "Không có quyền!"

    data = Order.query.all()
    # Render ra trang danh sách đơn hàng
    return render_template("admin/orders.html", orders=data)
#====================== PRODUCTS ============
@admin.route("/admin/products")
def products():
    if not is_admin():
        return "Không có quyền!"

    data = Product.query.all()
    return render_template("admin/products.html", products=data)

@admin.route("/admin/products/add", methods=["GET", "POST"])
def add_product():
    if not is_admin():
        return "Không có quyền!"

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

@admin.route("/admin/products/edit/<int:id>", methods=["GET", "POST"])
def edit_product(id):
    if not is_admin():
        return "Không có quyền!"

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

@admin.route("/admin/products/delete/<int:id>")
def delete_product(id):
    if not is_admin():
        return "Không có quyền!"

    p = Product.query.get_or_404(id)
    db.session.delete(p)
    db.session.commit()
    return redirect("/admin/products")
