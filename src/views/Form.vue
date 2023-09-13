<template>
  <div id="hello" class="container">
    <div class="row align-items-center justify-content-center">
      <div class="col-lg-6 p-8">
        <div class="custom-form mb-5 mt-n2">
          <h2 class="custom-form-title">Form Registrasi Event</h2>
          <form @submit.prevent="submitForm">
            <img class="img-fluid" src="../assets/event.png" alt="Logo" />

            <div class="mb-3 mt-5 text-start">
              <label for="nama_anak" class="form-label custom-label">Nama Anak</label>
              <input
                type="text"
                class="form-control"
                id="nama_anak"
                v-model="nama_anak"
                placeholder="Nama Anak"
              />
              <span v-if="nama_anakError" class="text-danger"
                >Nama Anak harus diisi.</span
              >
            </div>

            <div class="mb-3 text-start">
              <label for="nama_ayah" class="form-label custom-label">Nama Ayah</label>
              <input
                type="text"
                class="form-control"
                id="nama_ayah"
                v-model="nama_ayah"
                placeholder="Nama Ayah"
              />
              <span v-if="nama_ayahError" class="text-danger"
                >Nama Ayah harus diisi.</span
              >
            </div>

            <div class="mb-3 text-start">
              <label for="nama_ibu" class="form-label custom-label">Nama Ibu</label>
              <input
                type="text"
                class="form-control"
                id="nama_ibu"
                v-model="nama_ibu"
                placeholder="Nama Ibu"
              />
              <span v-if="nama_ibuError" class="text-danger">Nama Ibu harus diisi.</span>
            </div>

            <div class="mb-3 text-start">
              <label for="no_hp" class="form-label custom-label">No HP</label>
              <input
                type="text"
                class="form-control"
                id="no_hp"
                v-model="no_hp"
                placeholder="No HP"
              />
              <span v-if="no_hpError" class="text-danger">No HP harus diisi.</span>
            </div>

            <div class="mb-3 text-start">
              <label class="custom-label">Status Kehadiran</label><br />
              <div class="form-check form-check-inline">
                <input
                  class="form-check-input"
                  type="radio"
                  id="konfirmasi_datang"
                  value="Datang"
                  v-model="konfirmasi_datang"
                  @change="handleKonfirmasiChange"
                />
                <label class="form-check-label" for="konfirmasi_datang">Datang</label>
              </div>
              <div class="form-check form-check-inline">
                <input
                  class="form-check-input"
                  type="radio"
                  id="konfirmasi_tidak_datang"
                  value="Tidak Datang"
                  v-model="konfirmasi_datang"
                  @change="handleKonfirmasiChange"
                />
                <label class="form-check-label" for="konfirmasi_tidak_datang"
                  >Tidak datang</label
                >
              </div>
              <span v-if="konfirmasi_datangError" class="text-danger"
                >Pilih salah satu opsi.</span
              >
            </div>

            <div class="mb-3 text-start">
              <label for="jumlah_datang" class="form-label custom-label"
                >Jumlah datang</label
              >
              <select class="form-select" id="jumlah_datang" v-model="jumlah_datang">
                <option value="0">Tidak Datang</option>
                <option value="1">1 Orang</option>
                <option value="2">2 Orang</option>
              </select>
              <span v-if="jumlah_datangError" class="text-danger"
                >Jumlah datang harus diisi.</span
              >
            </div>

            <!-- Tombol "Submit" dengan gaya yang disesuaikan -->
            <button type="submit" class="btn custom-submit-button" :disabled="isLoading">
              {{ isLoading ? "Sedang Mengirim..." : "Submit" }}
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
body {
  background-color: rgb(230, 230, 230);
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh; /* Membuat form berada di tengah vertikal */
  margin: 0; /* Menghilangkan margin pada body */
}
</style>

<script>
import Swal from "sweetalert2";
import axios from "axios";

export default {
  name: "HelloWorld",

  data() {
    return {
      nama_anak: "",
      nama_ayah: "",
      nama_ibu: "",
      no_hp: "",
      jumlah_datang: "0", // Default value for Jumlah Datang
      konfirmasi_datang: "",
      nama_anakError: false,
      nama_ayahError: false,
      nama_ibuError: false,
      no_hpError: false,
      jumlah_datangError: false,
      konfirmasi_datangError: false,
      isLoading: false, // Tambahkan variabel isLoading
    };
  },
  methods: {
    async submitForm() {
      // Menghapus pesan kesalahan sebelum validasi
      this.clearErrors();

      // Validasi form sebelum mengirimkan data
      if (
        !this.nama_anak ||
        !this.nama_ayah ||
        !this.nama_ibu ||
        !this.no_hp ||
        this.jumlah_datang === null ||
        !this.konfirmasi_datang
      ) {
        this.setFormErrors();
        return;
      }

      // Aktifkan indikator loading
      this.isLoading = true;

      // Data yang akan dikirim ke API
      const dataToSend = {
        nama_anak: this.nama_anak,
        nama_ayah: this.nama_ayah,
        nama_ibu: this.nama_ibu,
        no_hp: this.no_hp,
        jumlah_datang: this.jumlah_datang,
        konfirmasi_datang: this.konfirmasi_datang,
      };

      // Kirim data ke API
      axios.defaults.headers.common["Content-Type"] = "application/json";

      try {
        const response = await axios.post(
          "https://api-1-gtw.dq.akses.live/events/api/dataortu",
          dataToSend
        );

        // Handle respons dari API jika diperlukan
        console.log(response.data);
        alert(response.data._id);

        // Menampilkan SweetAlert "Berhasil Terdaftar"
        await Swal.fire({
          icon: "success",
          title: "Berhasil Terdaftar",
          text: "Data Anda telah berhasil terdaftar.",
          timer: 3000,
          showConfirmButton: false,
        });

        window.location.href = process.env.BASEURL + "/sponsor" + response.data._id;

        // Reset formulir dan nonaktifkan indikator loading
        this.resetForm();
        this.isLoading = false;
      } catch (error) {
        // Handle kesalahan jika terjadi saat mengirim ke API
        console.error(error);

        // Menampilkan SweetAlert kesalahan
        await Swal.fire({
          icon: "error",
          title: "Oops...",
          text: "Terjadi kesalahan saat mengirim data ke server.",
        });

        // Nonaktifkan indikator loading
        this.isLoading = false;
      }
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
    setFormErrors() {
      // Menampilkan pesan kesalahan
      if (!this.nama_anak) this.nama_anakError = true;
      if (!this.nama_ayah) this.nama_ayahError = true;
      if (!this.nama_ibu) this.nama_ibuError = true;
      if (!this.no_hp) this.no_hpError = true;
      if (this.jumlah_datang === null) this.jumlah_datangError = true;
      if (!this.konfirmasi_datang) this.konfirmasi_datangError = true;
    },
    resetForm() {
      // Mereset nilai-nilai dalam formulir
      this.nama_anak = "";
      this.nama_ayah = "";
      this.nama_ibu = "";
      this.no_hp = "";
      this.jumlah_datang = null;
      this.konfirmasi_datang = "";
    },
    handleKonfirmasiChange() {
      if (this.konfirmasi_datang === "Tidak Datang") {
        this.jumlah_datang = "0";
      }
    },
  },
};
</script>
