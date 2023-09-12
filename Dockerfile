# Gunakan image Node.js sebagai base image
FROM node:14-alpine

# Buat direktori kerja dalam kontainer
RUN mkdir /home/event
WORKDIR /home/event

# Salin semua berkas kecuali di .dockerignore
COPY . .

# install pnpm
RUN npm install -g pnpm

# Install semua dependensi menggunakan pnpm
RUN pnpm install

# Build aplikasi
RUN pnpm run build

# Port yang akan digunakan oleh aplikasi (sesuaikan dengan aplikasi Anda)
EXPOSE 8000

# # Perintah untuk menjalankan server web saat kontainer dimulai
CMD ["serve", "-s", "dist", "-l", "8000"]
