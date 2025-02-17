from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def hello_world():
    return render_template('index.html')

if __name__ == '__main__':
    # Run the app on port 8080
    app.run(debug=True, host='0.0.0.0', port=8080)
