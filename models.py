from extensions import db

"""class User(db.Model):
    __tablename__ = 'user'

    id       = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50))
    password = db.Column(db.String(100))
    role     = db.Column(db.String(20), default="user")

"""
class User(db.Model):
    id       = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(200), nullable=False)
    fullname = db.Column(db.String(120), nullable=True)
    phone    = db.Column(db.String(20),  nullable=True)
    address  = db.Column(db.String(255), nullable=True)
    role     = db.Column(db.String(20),  default="user")
class Cart(db.Model):
    __tablename__ = 'cart'

    id         = db.Column(db.Integer, primary_key=True)
    username   = db.Column(db.String(100), nullable=False)  # ← chỉ giữ username, bỏ user_id
    product_id = db.Column(db.String(50))
    name       = db.Column(db.String(200))
    price      = db.Column(db.Integer)
    qty        = db.Column(db.Integer)
    img        = db.Column(db.String(200))
    brand      = db.Column(db.String(50))


class Order(db.Model):
    __tablename__ = 'order'

    id       = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100))
    total    = db.Column(db.Integer)
    name     = db.Column(db.String(100))
    phone    = db.Column(db.String(20))
    address  = db.Column(db.String(255))

    items = db.relationship('OrderItem', backref='order', lazy=True)


class OrderItem(db.Model):
    __tablename__ = 'orderitem'

    id         = db.Column(db.Integer, primary_key=True)
    order_id   = db.Column(db.Integer, db.ForeignKey('order.id'))
    product_id = db.Column(db.String(50))
    name       = db.Column(db.String(200))
    price      = db.Column(db.Integer)
    qty        = db.Column(db.Integer)
    img        = db.Column(db.String(200))
    brand      = db.Column(db.String(50))
class Product(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(200), nullable=False)
    price = db.Column(db.Float, nullable=False)
    old_price = db.Column(db.Float)
    stock = db.Column(db.Integer, default=0)
    image = db.Column(db.Text)
    category = db.Column(db.String(100))

    # Thêm mới
    description = db.Column(db.Text)
    rating = db.Column(db.Float, default=0.0)
    review_count = db.Column(db.Integer, default=0)
    sku = db.Column(db.String(50))
    origin = db.Column(db.String(100))
    brand = db.Column(db.String(100))
    is_hot = db.Column(db.Boolean, default=False)
    def __repr__(self):
        return f"<Product {self.name}>"
