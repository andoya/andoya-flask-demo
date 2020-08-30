from flask import Response, Flask, jsonify


app = Flask(__name__)

@app.route("/ping")
def ping():
    return jsonify({
        "ping": "pong!",
    })
