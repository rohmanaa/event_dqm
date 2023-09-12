# Gunakan image Node.js sebagai base image
FROM node:14-alpine

# Buat direktori kerja dalam kontainer
RUN mkdir /home/event
WORKDIR /home/event

# Salin semua berkas kecuali di .dockerignore
COPY . .

# Install semua dependensi menggunakan yarn production
RUN yarn install --production

# Build aplikasi
RUN yarn build

# Port yang akan digunakan oleh aplikasi (sesuaikan dengan aplikasi Anda)
EXPOSE 8000

# # Perintah untuk menjalankan server web saat kontainer dimulai
CMD ["serve", "-s", "dist", "-l", "8000"]
