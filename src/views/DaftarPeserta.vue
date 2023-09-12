<template>
  <div>
    <h2>Daftar Peserta</h2>
    <table class="table align-middle mb-0 bg-white">
      <thead class="bg-light">
        <tr>
          <th>No</th>
          <th>Nama Anak</th>
          <th>Nama Ayah</th>
          <th>Nama Ibu</th>
          <th>Jumlah Datang</th>
          <th>Status Kehadiran</th>
          <th>Hadir Lokasi</th>
          <th>Waktu</th>
          <th>Aksi</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(peserta, index) in daftarPeserta" :key="peserta._id">
          <td>{{ index + 1 }}</td>
          <td>{{ peserta.nama_anak }}</td>
          <td>{{ peserta.nama_ayah }}</td>
          <td>{{ peserta.nama_ibu }}</td>
          <td>{{ peserta.jumlah_datang }}</td>
          <td>{{ peserta.status_kehadiran }}</td>
          <td>{{ peserta.hadir_lokasi }}</td>
          <td>{{ peserta.waktu }}</td>
          <td>
            <button @click="editPeserta(peserta)" class="btn btn-primary btn-sm">
              Edit
            </button>
            <button @click="deletePeserta(peserta._id)" class="btn btn-danger btn-sm">
              Hapus
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      daftarPeserta: [],
    };
  },
  created() {
    // Mengambil data peserta dari API menggunakan Axios
    axios
      .get("https://api-1-gtw.dq.akses.live/events/api/dataortu")
      .then((response) => {
        this.daftarPeserta = response.data;
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  },
  methods: {
    editPeserta(peserta) {
      // Logika untuk mengedit peserta
      // Anda dapat menampilkan formulir pengeditan atau melakukan tindakan lain
      console.log("Edit peserta:", peserta);
    },
    deletePeserta(pesertaId) {
      // Logika untuk menghapus peserta berdasarkan ID
      // Anda dapat menampilkan konfirmasi sebelum menghapus atau melakukan tindakan lain
      console.log("Hapus peserta dengan ID:", pesertaId);
    },
  },
};
</script>
