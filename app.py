from flask import Flask


app = Flask(__name__)


@app.route("/")
@app.route("/index")
def index():
    """
    This view function handles requests for the index page.
    """

    return "Hello world!"


if __name__ == "__main__":
    app.run()
