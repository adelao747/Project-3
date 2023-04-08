from flask import Flask, jsonify, render_template
import sqlalchemy as sql
import json

app=Flask(__name__)

engine = sql.create_engine("sqlite:///data/db.sqlite")

@app.route("/data")
def return_data():
    results = engine.execute("select * from data").fetchall()
    sf_fires = []
    for each_result in results:
        fires = dict(each_result)
        sf_fires.append(fires)
        return jsonify(sf_fires)

@app.route('/')
def home():
    return render_template('firemap.html')

if __name__=='__main__':
    app.run()
