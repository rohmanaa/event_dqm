<template>
    <div id="app" class="container">
        <div class="custom-form">
            <h2 class="custom-form-title">Form Registrasi Event</h2>
            <form @submit.prevent="submitForm">
                <img class="img-fluid mb-4" src="images/event.png" alt="Logo" width="100%" height="80">

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
                    <span v-if="n0_hpError" class="text-danger">No HP harus diisi.</span>
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

    <!-- Toast "Berhasil Terdaftar" -->
    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
        <div id="toast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <strong class="me-auto">Berhasil Terdaftar</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Terima kasih, Anda telah berhasil terdaftar!
            </div>
        </div>
    </div>

    <!-- Tambahkan skrip Vue.js -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script>
        new Vue({
            el: "#app",
            data: {
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
            },
            methods: {
                submitForm() {
                    // Menghapus pesan kesalahan sebelum validasi
                    this.clearErrors();
    
                    // Validasi form sebelum mengirimkan data
                    if (!this.nama_anak || !this.nama_ayah || !this.nama_ibu || || !this.no_hp || this.jumlah_datang === null || !this.konfirmasi_datang) {
                        if (!this.nama_anak) this.nama_anakError = true;
                        if (!this.nama_ayah) this.nama_ayahError = true;
                        if (!this.nama_ibu) this.nama_ibuError = true;
                        if (!this.no_hp) this.no_hpError = true;
                        if (this.jumlah_datang === null) this.jumlah_datangError = true;
                        if (!this.konfirmasi_datang) this.konfirmasi_datangError = true;
                        return;
                    }
    
                    // Data yang akan dikirim ke API
                    const dataToSend = {
                        nama_anak: this.nama_anak,
                        nama_ayah: this.nama_ayah,
                        nama_ibu: this.nama_ibu,
                        no_hp: this.no_hp,
                        jumlah_datang: this.jumlah_datang,
                        konfirmasi_datang: this.konfirmasi_datang
                    };
    
                    // Kirim data ke API
                    axios.post('https://express-event.dev.dqakses.id/api/dataortu', dataToSend)
                        .then(response => {
                            // Handle respons dari API jika diperlukan
                            console.log(response.data);
    
                            // Menampilkan toast "Berhasil Terdaftar"
                            var toast = document.getElementById('toast');
                            toast.classList.add('show');
    
                            // Menutup toast setelah 5 detik
                            setTimeout(() => {
                                toast.classList.remove('show');
                                // Reset formulir
                                this.resetForm();
                            }, 3000);
                        })
                        .catch(error => {
                            // Handle kesalahan jika terjadi saat mengirim ke API
                            console.error(error);
                        });
                },
                clearErrors() {
                    // Menghapus pesan kesalahan
                    this.nama_anakError = false;
                    this.nama_ayahError = false;
                    this.nama_ibuError = false;
                    this.no_hpError = false;
                    this.jumlah_datangError = false;
                    this.konfirmasi_datangError = false;
                },
                resetForm() {
                    // Mereset nilai-nilai dalam formulir
                    this.nama_anak = "";
                    this.nama_ayah = "";
                    this.nama_ibu = "";
                    this.no_hp = "";
                    this.jumlah_datang = "";
                    this.konfirmasi_datang = "";
                }
            }
        });
    </script>
    

    <!-- Tambahkan skrip jQuery dan Bootstrap.js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</template>