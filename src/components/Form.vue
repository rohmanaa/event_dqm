<template>
    <div class="hello">

      

      <div class="custom-form">
            <h2 class="custom-form-title">Form Registrasi Event</h2>
            <form @submit.prevent="submitForm">
                <img class="img-fluid mb-4" src="assets/event.png" alt="Logo" width="100%" height="80">

                <div class="mb-3">
                    <label for="nama_anak" class="form-label custom-label">Nama Anak</label>
                    <input type="text" class="form-control" id="nama_anak" v-model="nama_anak" placeholder="Nama Anak">
                    <span v-if="nama_anakError" class="text-danger">Nama Anak harus diisi.</span>
                </div>

                <div class="mb-3">
                    <label for="nama_ayah" class="form-label custom-label">Nama Ayah</label>
                    <input type="text" class="form-control" id="nama_ayah" v-model="nama_ayah" placeholder="Nama Ayah">
                    <span v-if="nama_ayahError" class="text-danger">Nama Ayah harus diisi.</span>
                </div>

                <div class="mb-3">
                    <label for="nama_ibu" class="form-label custom-label">Nama Ibu</label>
                    <input type="text" class="form-control" id="nama_ibu" v-model="nama_ibu" placeholder="Nama Ibu">
                    <span v-if="nama_ibuError" class="text-danger">Nama Ibu harus diisi.</span>
                </div>

                <div class="mb-3">
                    <label for="n0_hp" class="form-label custom-label">No HP</label>
                    <input type="text" class="form-control" id="no_hp" v-model="no_hp" placeholder="No HP">
                    <span v-if="no_hpError" class="text-danger">No HP harus diisi.</span>
                </div>

                <div class="mb-3">
                    <label for="jumlah_datang" class="form-label custom-label">Jumlah datang</label>
                    <input type="number" class="form-control" id="jumlah_datang" v-model="jumlah_datang" placeholder="Jumlah datang">
                    <span v-if="jumlah_datangError" class="text-danger">Jumlah datang harus diisi.</span>
                </div>

                <div class="mb-3">
                    <label class="custom-label">Status Kehadiran</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="konfirmasi_datang" v-model="konfirmasi_datang" value="Datang">
                        <label class="form-check-label" for="konfirmasi_datang">Datang</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="konfirmasi_datang" v-model="konfirmasi_datang" value="Tidak Datang">
                        <label class="form-check-label" for="konfirmasi_datang">Tidak datang</label>
                    </div>
                    <span v-if="konfirmasi_datangError" class="text-danger">Pilih salah satu opsi.</span>
                </div>


                <!-- Tombol "Submit" dengan gaya yang disesuaikan -->
                <button type="submit" class="btn custom-submit-button">Submit</button>
            </form>
        </div>
      
    </div>


  </template>
  
    <script>
        export default {
            name: 'HelloWorld',
            props: {
                msg: String
            },
            data() {
                return {
                    nama_anak: "",
                    nama_ayah: "",
                    nama_ibu: "",
                    no_hp: "",
                    jumlah_datang: "",
                    konfirmasi_datang: "",
                    nama_anakError: false,
                    nama_ayahError: false,
                    nama_ibuError: false,
                    no_hpError: false,
                    jumlah_datangError: false,
                    konfirmasi_datangError: false
                };
            },
            methods: {
                submitForm() {
                    console.log(
                        'Nama Anak : ' + this.nama_anak + 
                        '; Nama Ayah : ' + this.nama_ayah + 
                        '; Nama Ibu : ' + this.nama_ibu + 
                        '; No HP : ' + this.no_hp + 
                        '; Jumlah Datang : ' + this.jumlah_datang + 
                        '; Konfirmasi Datang : ' + this.konfirmasi_datang + 
                        '; ' 
                    );
                }
            }
        }
    </script>
  
  <!-- Add "scoped" attribute to limit CSS to this component only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style scoped>
        body {
        background-color: rgb(230, 230, 230);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* Membuat form berada di tengah vertikal */
        margin: 0; /* Menghilangkan margin pada body */
        }

        /* Gaya untuk header form */
        .custom-form .custom-form-title {
            background-color: #1A3257 !important;
            color: #fff; /* Warna teks menjadi putih */
            margin: 0; /* Menghilangkan margin atas dan bawah pada header form */
            border-radius: 10px 10px 0 0; /* Melengkungkan sudut atas header */
        }

        /* Gaya untuk tombol "Submit" */
        .custom-submit-button {
            background-color: #1A3257 !important;
            color: #fff;
            width: 100%; /* Membuat tombol menjadi full width */
            border: none;
        }

        /* Kustomisasi tambahan jika diperlukan */
        .custom-label {
            font-weight: bold;
        }

        .custom-form {
            border: 1px solid #ccc;
            border-top: none; /* Menghilangkan border atas pada form */
            padding: 20px;
            border-radius: 10px 10px 10px 10px; /* Melengkungkan sudut bawah form */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            background-color: #fff; /* Latar belakang form tetap putih */
        }

        .custom-form-title {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            padding: 20px;
        }
    </style>
  