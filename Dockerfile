# 1. Gunakan adonan dasar Python 3.9
FROM python:3.9

# 2. Tentukan folder kerja
WORKDIR /app

# 3. Salin semua file dari laptop ke container
COPY . .

# 4. Install library Flask (Perintahnya: RUN pip install -r requirements.txt)
RUN pip install -r requirements.txt

# 5. Jalankan aplikasinya (Perintahnya: CMD ["python", "main.py"])
CMD ["python", "main.py"]