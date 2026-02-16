from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello Ankur, Welcome to My Python App 🚀"

@app.route("/health")
def health():
    return jsonify(status="OK", message="Application is running")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

