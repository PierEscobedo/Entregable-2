from flask import Flask, jsonify, request, render_template
from categories import Categories
app = Flask(__name__)

@app.route('/')
def index():
    return render_template('categories.html')

@app.route('/categories', methods=['POST'])
def create():
    categoryId = request.json['category_id']
    name = request.json['name']
    description = request.json['description']
    indLevel = request.json['ind_level']
    categories = Categories()
    result = categories.create(categoryId, name, description, indLevel)
    return jsonify(result), 200, {'Access-Control-Allow-Origin':'*'}

@app.route('/categories/<int:id>', methods=['PUT'])
def update(id):
    categoryId = request.json['category_id']
    name = request.json['name']
    description = request.json['description']
    indLevel = request.json['ind_level']
    categories = Categories()
    result = categories.update(id, categoryId, name, description, indLevel)
    return jsonify(result), 200, {'Access-Control-Allow-Origin':'*'}

@app.route('/categories/<int:id>', methods=['DELETE'])
def delete(id):
    categories = Categories()
    result = categories.delete(id)
    return jsonify(result), 200, {'Access-Control-Allow-Origin':'*'}

@app.route('/categories', methods=['GET'])
def getAll():
    categories = Categories()
    result = categories.getAll()
    return jsonify(result), 200, {'Access-Control-Allow-Origin':'*'}

@app.route('/categories/<int:id>', methods=['GET'])
def getitem(id):
    categories = Categories()
    result = categories.getById(id)
    return jsonify(result), 200, {'Access-Control-Allow-Origin':'*'}

if __name__ == '__main__':
    app.run(debug=True, port=4000)