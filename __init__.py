import os
from flask import Flask, render_template, request
from flasl_mysqldb import MySQL
import yaml

app = Flask(__name__, instance_relative_config=True)

db = yaml.load(open('db.yaml'))
app.config['MYSQL_HOST'] = db['mysql_host']
app.config['MYSQL_USER'] = db['mysql_user']
app.config['MYSQL_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']

mysql = MySQL(app)

# a simple page that says hello
@app.route('/')
def index():
    return render_template("index.html")

@app.route('/connexion', methods=['GET', 'POST'])
def connexion():
    if request.method == 'POST':
        utilisateurLogin = request.form
        email = utilisateurLogin["email"]
        password = utilisateurLogin["password"]

        depot = mysql.connexion.cursor()
        depot.execute()
        mysql.connexion.commit()
        depot.close()
    return render_template("connexion.html")

@app.route('/inscription', methods=['GET', 'POST'])
def connexion():
    if request.method == 'POST':
        utilisateurInfo = request.form
        nom = utilisateurInfo["nom"]
        prenom = utilisateurInfo["prenom"]
        dateNaissance = utilisateurInfo["dateNaissance"]
        sexe = utilisateurInfo["sexe"]
        email = utilisateurInfo["email"]
        telephone = utilisateurInfo["telephone"]
        password = utilisateurInfo["password"]

        depot = mysql.connexion.cursor()
        depot.execute("INSERT INTO Utilisateur(nom_utilisateur, prenom_utilisateur, date_naissance, sexe, email, telephone, mot_de_passe) VALUES(%s, %s, %s, %s, %s, %s, %s)", (nom, prenom, dateNaissance, sexe, email, telephone, password))
        mysql.connexion.commit()
        depot.close()
        redirect (/main)
    return render_template("inscription.html")

@app.route('/main')
def main():
    return render_template("main.html")

@app.route('/profil')
def profil():
    return render_template("profil.html")


if __name__ == "__main__":
    app.run(debug=True)
return app



