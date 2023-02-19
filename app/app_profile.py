#!/usr/bin/python3
""" Starts a Flash Web Application """
#!/usr/bin/python3
""" Flask Application """
from models import storage
from models.user import User
from app.routes import app_routes
from flask import Flask, jsonify
from flask_login import LoginManager, login_user, logout_user, login_required, current_user



app = Flask(__name__)
app.register_blueprint(app_routes)

login_manager = LoginManager()
login_manager.init_app(app)

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

if __name__ == "__main__":
    """ Main Function """
    app.run(host='0.0.0.0', port=5000, debug=True)
