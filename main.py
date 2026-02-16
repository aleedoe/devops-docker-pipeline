from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Update setelah menambahkan docker compose Berhasil! 🚀"

if __name__ == "__main__":
    # Menjalankan aplikasi di host 0.0.0.0 agar bisa diakses dari luar container
    app.run(host="0.0.0.0", port=5000, debug=True) # Tambahkan debug=True