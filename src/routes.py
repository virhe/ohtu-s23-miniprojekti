from app import app
from flask import jsonify, request, send_from_directory
import dataprocessing

@app.route("/")
def index():
    return app.send_static_file("index.html")

# adding reference
@app.route("/add_reference", methods=["POST"])
def add_reference():
    if request.method == "POST":
        author = request.form["author"]
        title = request.form["title"]
        year = request.form ["year"]
        publisher = request.form ["publisher"]

        print(author,title, year, publisher)

        dataprocessing.add_book(author, title, year, publisher)

    # data_base_manager.add_reference_to_database(author, title, year, publisher)
    return jsonify({"message": "Reference added"}), 200 # TODO: send return code based on whether the db query was successful

@app.route('/<path:path>')
def serve_static(path):
    return send_from_directory('build', path)

if __name__ == "__main__":
    app.run(debug=True)