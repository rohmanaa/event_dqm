<template>
  <body class="bg-body-tertiary">
    <main class="container py-5">
      <div
        class="d-flex align-items-center p-3 text-white rounded shadow-sm mb-3"
        style="background-color: #1a3257 !important"
      >
        <div class="lh-1">
          <h1 class="h6 mb-0 text-white lh-1">Daftar Peserta Event</h1>
          <small>Darul Quran Mulia</small>
        </div>
      </div>

      <div class="row mb-3">
        <div class="col-lg-4">
          <div class="card bg-primary text-white">
            <div class="card-header">Konfirmasi</div>
            <div class="card-body">
              <h2 class="card-title">Special title treatment</h2>
              <p class="card-text">Konfirmasi Datang</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="card bg-danger text-white">
            <div class="card-header">Konfirmasi</div>
            <div class="card-body">
              <h2 class="card-title">Special title treatment</h2>
              <p class="card-text">Konfirmasi Tidak Datang</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="card bg-success text-white">
            <div class="card-header">Konfirmasi</div>
            <div class="card-body">
              <h2 class="card-title">Special title treatment</h2>
              <p class="card-text">di Lokasi</p>
            </div>
          </div>
        </div>
      </div>

      <div class="container shadow-sm bg-body rounded p-2">
        <table
          id="myTable"
          class="table table-striped table-bordered"
          style="width: 100%"
        >
          <thead>
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
        </table>
      </div>
    </main>
  </body>
</template>

<script>
import $ from "jquery";
import axios from "axios";
import "datatables.net-bs4";

const apiKey = process.env.API_KEY;

export default {
  mounted() {
    this.loadData();
  },
  methods: {
    async loadData() {
      try {
        const response = await axios.get(apiKey);
        const dataWithNumber = response.data.map((item, index) => ({
          nomor_urut: index + 1,
          nama_anak: item.nama_anak,
          nama_ayah: item.nama_ayah,
          nama_ibu: item.nama_ibu,
          jumlah_datang: item.jumlah_datang,
          konfirmasi_datang: item.konfirmasi_datang,
          is_datang: item.is_datang,
          datang_pukul: item.datang_pukul,
        }));

        $("#myTable").DataTable({
          data: dataWithNumber,
          columns: [
            { data: "nomor_urut" },
            { data: "nama_anak" },
            { data: "nama_ayah" },
            { data: "nama_ibu" },
            { data: "jumlah_datang" },
            {
              data: "konfirmasi_datang",
              render: function (data) {
                const badgeClass =
                  data.toLowerCase() === "datang" ? "bg-success" : "bg-danger";
                return `<span class="badge text-white ${badgeClass} w-100">${data}</span>`;
              },
            },
            {
              data: "is_datang",
              render: function (data) {
                return data ? "TRUE" : "FALSE";
              },
            },
            {
              data: "datang_pukul",
              render: function (data) {
                return data ? "TRUE" : "FALSE";
              },
            },
          ],
        });
      } catch (error) {
        console.error("Error:", error);
      }
    },
  },
};
</script>

<style></style>
