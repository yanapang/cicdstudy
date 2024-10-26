from flask import Flask

app = Flask(__name__)

@app.route('/') #url
def home():
    return 'new User made a change!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)