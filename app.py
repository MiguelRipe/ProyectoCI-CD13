from flask import Flask, url_for
from flask import render_template, redirect, request, Response, session
from flask_mysqldb import MySQL, MySQLdb
import mysql.connector


app = Flask(__name__, template_folder='template')



conexion1=mysql.connector.connect(host="localhost", user="root", database='desarrollo_pmi', passwd="", port="3306")


@app.route('/')
def home():
    return render_template("indexlogin.html")

@app.route('/admin')
def admin():
    if not session.get('logeado'):
        return redirect(url_for('home'))  # Redirigir a la página de inicio si no está logueado
    return render_template("admin.html")

# Función del login
@app.route('/acceso-login', methods=["GET", "POST"])
def login():
    mensaje_error = None
   
    if request.method == 'POST' and 'txtCorreo' in request.form and 'txtPassword' in request.form:
       
        _email = request.form['txtCorreo']
        _password = request.form['txtPassword']
        
        cursor1=conexion1.cursor()
        cursor1.execute('SELECT * FROM desarrollo_pmi.user WHERE email  = %s and password = %s', (_email, _password,))
        account = cursor1.fetchone()
      
        if account:
            session['logueado'] = True
            id_index = None
            rol_index = None

            for index, column in enumerate(cursor1.description):
                if column[0] == 'id_user':  # Verifica si el nombre de la columna es 'id_user'
                    id_index = index
                    break

            for index, column in enumerate(cursor1.description):
                if column[0] == 'rol':
                    rol_index = index
                    break


            if id_index is not None and rol_index is not None:
                session['id'] = account[id_index]  # Utiliza el índice encontrado para 'id_user'
                session['rol'] = account[rol_index]
                
                if session['rol'] == "ESPECIALISTA":  # Corregido
                    return render_template("especialistaview.html")
                elif session['rol'] == "PACIENTE":  # Corregido
                    return render_template("pacienteview.html")               
        else:
            mensaje_error = "Usuario o contraseña incorrecta"
    # Renderizar la plantilla del formulario de inicio de sesión en cualquier otro caso
    return render_template('indexlogin.html', mensaje_error=mensaje_error)
        

@app.route('/historialmedico')
def redireccionHistorial():
    rol_index = session.get('rol')  # Obtener el rol del usuario desde la sesión
    if rol_index == "ESPECIALISTA":
        return render_template("especialistahistorial.html") # Renderizar la plantilla para el especialista
    elif rol_index == "PACIENTE":
        return render_template("pacientehistorial.html")  # Renderizar la plantilla para el paciente
    else:
        # En caso de que el rol no esté definido o sea otro valor, puedes redirigir a una página de error o a otra página predeterminada
        return redirect(url_for("home"))  # Redirigir a la página de inicio
def home():
    # Renderizar la plantilla para la página de inicio
    return render_template("indexlogin.html")

@app.route('/inicio')
def redireccionInicio():
    rol_index = session.get('rol')  # Obtener el rol del usuario desde la sesión
    if rol_index == "ESPECIALISTA":
        return render_template("especialistaview.html") # Renderizar la plantilla para el especialista
    elif rol_index == "PACIENTE":
        return render_template("pacienteview.html")  # Renderizar la plantilla para el paciente
    else:
        # En caso de que el rol no esté definido o sea otro valor, puedes redirigir a una página de error o a otra página predeterminada
        return redirect(url_for("home"))  # Redirigir a la página de inicio
def home():
    # Renderizar la plantilla para la página de inicio
    return render_template("indexlogin.html")

if __name__ == '__main__':
    app.secret_key = "Salud_Proyect"
    app.run(debug=True, host='0.0.0.0', port=5000, threaded=True) 