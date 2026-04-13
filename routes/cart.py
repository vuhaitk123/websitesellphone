from flask import Blueprint, redirect, session, render_template, request, flash
from models import Cart, Order, OrderItem, Product  # 👈 thêm Product
from extensions import db

cart_bp = Blueprint("cart", __name__)


def find_product(pid):
    return Product.query.filter_by(id=pid).first()  # 👈 lấy từ DB


def get_user_cart():
    username = session.get("user")
    return Cart.query.filter_by(username=username).all()


@cart_bp.route("/add/<pid>")
def add(pid):
    if "user" not in session:
        return redirect("/login")

    p = find_product(pid)
    username = session.get("user")

    if p:
        item = Cart.query.filter_by(product_id=pid, username=username).first()

        if item:
            item.qty += 1
        else:
            new_item = Cart(
                username=username,
                product_id=str(pid),
                name=p.name,
                price=int(p.price),
                qty=1,
                img=p.image,      # 👈 "image" không phải "img"
                brand=p.category  # 👈 dùng category làm brand
            )
            db.session.add(new_item)

        db.session.commit()

    return redirect("/cart")

@cart_bp.route("/cart")
def cart():
    if "user" not in session:
        return redirect("/login")

    # ✅ Lấy từ DB, lọc theo username
    items = get_user_cart()
    total = sum(item.price * item.qty for item in items)

    return render_template("cart.html", cart=items, total=total)


@cart_bp.route("/remove/<int:id>")
def remove_item(id):
    if "user" not in session:
        return redirect("/login")

    item = Cart.query.get(id)

    # Chỉ cho xóa nếu item thuộc về user hiện tại
    if item and item.username == session.get("user"):
        db.session.delete(item)
        db.session.commit()

    return redirect("/cart")


@cart_bp.route("/plus/<pid>")
def plus(pid):
    if "user" not in session:
        return redirect("/login")

    item = Cart.query.filter_by(product_id=pid, username=session.get("user")).first()

    if item:
        item.qty += 1
        db.session.commit()

    return redirect("/cart")


@cart_bp.route("/minus/<pid>")
def minus(pid):
    if "user" not in session:
        return redirect("/login")

    item = Cart.query.filter_by(product_id=pid, username=session.get("user")).first()

    if item:
        item.qty -= 1

        if item.qty <= 0:
            db.session.delete(item)

        db.session.commit()

    return redirect("/cart")


@cart_bp.route("/checkout", methods=["GET", "POST"])
def checkout():
    if "user" not in session:
        return redirect("/login")

    items = get_user_cart()
    total = sum(item.price * item.qty for item in items)

    if request.method == "POST":
        name = request.form.get("name")
        phone = request.form.get("phone")
        address = request.form.get("address")

        order = Order(
            username=session.get("user"),
            total=total,
            name=name,
            phone=phone,
            address=address
        )

        db.session.add(order)
        db.session.flush()

        for item in items:
            order_item = OrderItem(
                order_id=order.id,
                product_id=item.product_id,
                name=item.name,
                price=item.price,
                qty=item.qty,
                img=item.img,
                brand=item.brand
            )
            db.session.add(order_item)

        # Chỉ xóa cart của user hiện tại
        Cart.query.filter_by(username=session.get("user")).delete()

        db.session.commit()

        flash("🎉 Đặt hàng thành công!", "success")
        return redirect("/")

    
    return render_template("checkout.html", cart=items, total=total)
