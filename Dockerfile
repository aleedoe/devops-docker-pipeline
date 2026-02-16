# ==========================================
# Tahap 1: Si Koki (Builder) 🍳
# ==========================================
FROM python:3.9-slim AS builder

WORKDIR /app

# 1. Salin daftar belanjaan dulu (biar hemat kuota/cache)
COPY requirements.txt .

# 2. Buat Virtual Environment (Wadah khusus)
# Kita install di folder /opt/venv biar gampang dipindah
RUN python -m venv /opt/venv

# 3. Install library ke dalam wadah tersebut
RUN /opt/venv/bin/pip install --no-cache-dir -r requirements.txt


# ==========================================
# Tahap 2: Piring Saji (Runner) 🍽️
# ==========================================
FROM python:3.9-slim AS runner

WORKDIR /app

# 4. INI RAHASIANYA!
# Kita cuma ambil folder /opt/venv dari tahap 'builder'
# Sisanya (cache pip, tools build, sampah lain) DITINGGAL.
COPY --from=builder /opt/venv /opt/venv

# 5. Salin kode aplikasimu
COPY . .

# 6. Pastikan kita menggunakan python yang ada di dalam venv
ENV PATH="/opt/venv/bin:$PATH"

# 7. Jalankan aplikasi
CMD ["python", "main.py"]