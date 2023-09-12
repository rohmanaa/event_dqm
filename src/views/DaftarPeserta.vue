<template>
  <div class="row">
    <div class="col-sm-12 mb-3 mb-sm-0">
      <div class="card m-5 p-5 shadow-xl">
        <div class="card-header">
          <h2 class="text-center">Daftar Peserta Event</h2>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-striped table-hover">
              <thead>
                <tr class="text-center">
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
                <tr
                  v-for="(peserta, index) in daftarPeserta"
                  :key="peserta.id"
                  class="text-center"
                >
                  <td>{{ index + 1 }}</td>
                  <td>{{ peserta.nama_anak }}</td>
                  <td>{{ peserta.nama_ayah }}</td>
                  <td>{{ peserta.nama_ibu }}</td>
                  <td>{{ peserta.jumlah_datang }} Orang</td>
                  <td>
                    <div v-if="peserta.konfirmasi_datang === 'Datang'">
                      <span class="badge text-bg-success w-100">{{
                        peserta.konfirmasi_datang
                      }}</span>
                    </div>
                    <div v-else>
                      <span class="badge text-bg-danger w-100">{{
                        peserta.konfirmasi_datang
                      }}</span>
                    </div>
                  </td>
                  <td>{{ peserta.hadir_lokasi }}</td>
                  <td>{{ peserta.waktu }}</td>
                  <td class="btn-group">
                    <!-- Tombol edit -->
                    <button
                      @click="editPeserta(peserta)"
                      class="btn btn-primary btn-sm me-1"
                    >
                      <i class="fa fa-pencil" aria-hidden="true"></i>
                    </button>
                    <!-- Tombol delete -->
                    <button
                      @click="deletePeserta(peserta.id)"
                      class="btn btn-danger btn-sm"
                    >
                      <i class="fa fa-trash" aria-hidden="true"></i>
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
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
