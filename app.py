from flask import Flask
from extensions import db


app = Flask(__name__)           # Tạo ứng dụng Flask, __name__ giúp Flask biết vị trí file
app.secret_key = "secret123"       # Khóa bí mật dùng để mã hóa & bảo vệ session (login, cart,...)

# Cấu hình kết nối đến database MySQL
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:123456@localhost/shopdb"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
# mysql+pymysql://username:password@host/tên_database


db.init_app(app)  # 🔥 quan trọng
# Tắt tính năng theo dõi thay đổi của SQLAlchemy để giảm tốn RAM


# import routes (đặt dưới)
from routes.auth import auth
from routes.cart import cart_bp
from routes.main import main
from routes.products import products
from routes.admin import admin
from routes.admin_product import admin_product



app.register_blueprint(admin)
app.register_blueprint(auth)
app.register_blueprint(products)
app.register_blueprint(cart_bp)
app.register_blueprint(main)
app.register_blueprint(admin_product)
if __name__ == "__main__":
    with app.app_context():     # Tạo môi trường làm việc với Flask (cần cho DB)
        db.create_all()         # Tự động tạo bảng trong database từ các model

    app.run(debug=True) #Tự reload khi sửa code