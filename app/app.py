from flask import Flask, jsonify
import subprocess


app = Flask(__name__)



@app.route("/")
def home():

    return jsonify(
        {
            "service": "Railway Xray",
            "status": "running"
        }
    )



@app.route("/health")
def health():


    xray = subprocess.run(
        ["pgrep", "xray"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    )


    nginx = subprocess.run(
        ["pgrep", "nginx"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    )



    if xray.returncode == 0 and nginx.returncode == 0:

        return jsonify(
            {
                "status":"ok",
                "xray":"running",
                "nginx":"running"
            }
        ),200



    return jsonify(
        {
            "status":"failed"
        }
    ),503
