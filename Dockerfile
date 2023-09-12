# Gunakan image Node.js sebagai base image
FROM node:14-alpine

# Buat direktori kerja dalam kontainer
RUN mkdir /home/event
WORKDIR /home/event

# Salin package.json dan package-lock.json (jika ada) ke dalam kontainer
COPY package*.json ./

# Install dependensi aplikasi
RUN npm install --production

# Salin berkas .env dari direktori lokal ke dalam kontainer
COPY .env .

# Salin folder src/views dari direktori lokal ke dalam kontainer
COPY src/ .

# Build aplikasi Vue.js dengan perintah yang sesuai
RUN npm run build

# Konfigurasi server HTTP (opsional, tergantung pada aplikasi Anda)
# COPY nginx.conf /etc/nginx/nginx.conf

# Port yang akan digunakan oleh aplikasi (sesuaikan dengan aplikasi Anda)
EXPOSE 8080

# Perintah untuk menjalankan server web saat kontainer dimulai
CMD [ "npm", "run", "start" ]
