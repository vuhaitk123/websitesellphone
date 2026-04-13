import re
from flask import Blueprint, render_template, request, redirect, session, flash
from models import User
from extensions import db

auth = Blueprint("auth", __name__)

PASSWORD_REGEX = re.compile(
    r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+\[\]{};:\'",.<>/?\\|`~]).{8,}$'
)

@auth.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        user = User.query.filter_by(username=username, password=password).first()
        if user:
            session["user"] = user.username
            session["role"] = user.role
            return redirect("/")
        else:
            flash("Sai tài khoản hoặc mật khẩu!")
            return redirect("/login")
    return render_template("login.html")


@auth.route("/register", methods=["POST"])
def register():
    username = request.form["username"]
    password = request.form["password"]
    fullname = request.form["fullname"]
    phone    = request.form["phone"]
    address  = request.form["address"]

    # Validate trùng tài khoản
    if User.query.filter_by(username=username).first():
        flash("Tài khoản đã tồn tại!")
        return redirect("/login")

    # Validate mật khẩu
    if not PASSWORD_REGEX.match(password):
        flash("Mật khẩu phải có ít nhất 8 ký tự, gồm chữ hoa, số và ký tự đặc biệt!")
        return redirect("/login")

    # Validate SĐT đơn giản
    if not re.match(r'^(0|\+84)[0-9]{9,10}$', phone):
        flash("Số điện thoại không hợp lệ!")
        return redirect("/login")

    new_user = User(
        username=username,
        password=password,
        fullname=fullname,
        phone=phone,
        address=address
    )
    db.session.add(new_user)
    db.session.commit()
    flash("Đăng ký thành công! Hãy đăng nhập.")
    return redirect("/login")


@auth.route("/logout")
def logout():
    session.pop("user", None)
    session.pop("role", None)
    return redirect("/login")
@auth.route("/profile")
def profile():
    if "user" not in session:
        return redirect("/login")
    
    user = User.query.filter_by(username=session["user"]).first()
    return render_template("profile.html", user=user)


@auth.route("/profile/edit", methods=["POST"])
def profile_edit():
    if "user" not in session:
        return redirect("/login")

    user = User.query.filter_by(username=session["user"]).first()

    user.fullname = request.form.get("fullname", user.fullname)
    user.phone    = request.form.get("phone", user.phone)
    user.address  = request.form.get("address", user.address)

    # Đổi mật khẩu nếu có nhập
    new_pw = request.form.get("new_password", "").strip()
    if new_pw:
        import re
        strong = re.compile(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+]).{8,}$')
        if not strong.match(new_pw):
            flash("Mật khẩu mới không đủ mạnh!")
            return redirect("/profile")
        user.password = new_pw

    db.session.commit()
    flash("Cập nhật thành công!")
    return redirect("/profile")