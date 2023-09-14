<template>
  <body class="bg-body-tertiary">
    <header class="p-3 mb-3 border-bottom bg-white sticky-top">
      <div class="container">
        <div
          class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start"
        >
          <ul
            class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0"
          >
            <li>
              <a href="" class="nav-link px-2 link-body-emphasis">
                <i
                  class="fa fa-home text-success"
                  aria-hidden="true"
                  style="text-color: #1a3257 !important"
                ></i
              ></a>
            </li>
          </ul>

          <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
            <input
              type="search"
              class="form-control"
              placeholder="Search..."
              aria-label="Search"
            />
          </form>
        </div>
      </div>
    </header>
    <main class="container py-2">
      <div
        class="d-flex align-items-center p-3 text-white rounded shadow-sm"
        style="background-color: #1a3257 !important"
      >
        <div class="lh-1">
          <h1 class="h6 mb-0 text-white lh-1">Daftar Peserta Event</h1>
          <small>Darul Quran Mulia</small>
        </div>
      </div>

      <div class="my-3 p-3 bg-body rounded shadow-sm">
        <h6 class="border-bottom p-2">Recent updates</h6>
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
                  <div v-if="peserta.konfirmasi_datang.toLowerCase() === 'datang'">
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
                <td>{{ peserta.id_datang }}</td>
                <td>{{ peserta.datang_pukul }}</td>
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
    </main>
  </body>
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
        console.log(response.data);
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
