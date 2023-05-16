import os
import logging
import requests
from dotenv import load_dotenv
from flask import Flask, request

load_dotenv()

BACKEND_URL = os.getenv("BACKEND_URL")
WEBHOOK_URL = os.getenv("WEBHOOK_URL")

logger = logging.getLogger(__name__)

app = Flask(__name__)


@app.route("/api/messages", methods=["POST"])
def messages():
    if request.remote_addr == WEBHOOK_URL:
        payload = request.get_json()
        message = payload.get("text")
        if message.endswith("?"):
            response = call_api(message)
            send_message(payload["conversation"]["id"], response)
        else:
            send_message(payload["conversation"]["id"], f"Echo: {message}")

    return "Forbidden", 403


def call_api(text):
    print("Question: ", text)
    response = requests.post(
        BACKEND_URL,
        json={
            "text": text,
        },
    )
    data = response.json()

    return data


def send_message(conversationId, text):
    print("Answer: ", text)
    requests.post(
        WEBHOOK_URL,
        json={
            "type": "message",
            "conversation": {"id": conversationId},
            "text": text,
        },
    )


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
