<template>
  <div>
    <div class="container py-5">
      <!-- Header Section -->
      <div
        class="d-flex align-datas-center p-3 text-white rounded shadow-sm mb-3"
        style="background-color: #1a3257 !important"
      >
        <div class="lh-1">
          <h1 class="h6 mb-0 text-white lh-1">Daftar Peserta Event</h1>
          <small>Darul Quran Mulia</small>
        </div>
      </div>

      <!-- Summary Cards -->
      <div class="row mb-3">
        <div class="col-lg-3">
          <div class="card bg-warning text-white">
            <div class="card-header text-center">Hadir</div>
            <div class="card-body text-center">
              <h2 class="card-title">{{ totalHadir }}</h2>
              <p class="card-text">Konfirmasi Kehadiran</p>
            </div>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="card bg-primary text-white">
            <div class="card-header text-center">Konfirmasi</div>
            <div class="card-body text-center">
              <h2 class="card-title">{{ totalDatang }}</h2>
              <p class="card-text">Konfirmasi Datang</p>
            </div>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="card bg-danger text-white">
            <div class="card-header text-center">Konfirmasi</div>
            <div class="card-body text-center">
              <h2 class="card-title">{{ totalTidakDatang }}</h2>
              <p class="card-text">Konfirmasi Tidak Datang</p>
            </div>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="card bg-success text-white">
            <div class="card-header text-center">Konfirmasi</div>
            <div class="card-body text-center">
              <h2 class="card-title">{{ totalLokasi }}</h2>
              <p class="card-text">di Lokasi</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Data Table Section -->
      <div class="container shadow-sm bg-body rounded p-2 table-responsive">
        <table
          id="myTable"
          class="table table-striped table-bordered display"
          style="width: 100% height:fit-content"
        >
          <thead>
            <tr>
              <th width="5px" class="all text-center">No</th>
              <th class="all text-center">Nama Anak</th>
              <th class="desktop text-center">Nama Ayah</th>
              <th class="desktop text-center">Nama Ibu</th>
              <th width="5px" class="all text-center">Konfirmasi Datang</th>
              <th width="5px" class="all text-center">Jumlah Datang</th>
              <th width="5px" class="desktop text-center">Waktu</th>
              <th width="5px" class="desktop text-center">Lokasi</th>
              <th width="5px" class="desktop">Aksi</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import $ from "jquery";
import axios from "axios";
import "bootstrap/dist/css/bootstrap.css";
import "datatables.net-bs4";
import Swal from "sweetalert2";
import "datatables.net-rowreorder";
import "datatables.net-responsive";

export default {
  data() {
    return {
      data: [],
      totalDatang: 0,
      totalTidakDatang: 0,
      totalLokasi: 0,
      totalHadir: 0,
    };
  },
  mounted() {
    axios.get(process.env.VUE_APP_BEURL + "/dataortu").then((response) => {
      this.data = response.data;
      this.calculateTotalCounts();
      this.initDataTable();
    });
  },
  methods: {
    initDataTable() {
      const self = this; // Store the component context
      $("#myTable").DataTable({
        data: this.data,
        responsive: true,
        rowReorder: {
          selector: "td:nth-child(2)",
        },
        lengthMenu: [
          [10, 25, 50, 100, -1],
          ["10 rows", "25 rows", "50 rows", "Show All"],
        ],
        columns: [
          {
            data: null,
            render: function (data, type, row, meta) {
              // Mengembalikan nomor berurut berdasarkan indeks
              return meta.row + 1;
            },
          },
          { data: "nama_anak" },
          { data: "nama_ayah" },
          { data: "nama_ibu" },
          {
            data: "konfirmasi_datang",
            render: function (data) {
              const isDatang = data.toLowerCase() === "datang";
              return isDatang
                ? `<div><span class="badge text-bg-success w-100">${data}</span></div>`
                : `<div><span class="badge text-bg-danger w-100">${data}</span></div>`;
            },
          },
          {
            data: "jumlah_datang",
            render: function (data) {
              const jmldtg = data;
              return jmldtg ? data : ``;
            },
          },
          {
            data: "datang_pukul",
            render: function (data) {
              const dtgpkl = data;
              return dtgpkl ? data : ``;
            },
          },
          {
            data: "is_datang",
            render: function (data) {
              const isdtg = data;
              return isdtg ? data : ``;
            },
          },

          {
            data: null,
            render: function (data, type, row) {
              const buttonGroup = `
                <div class="btn-group">
                  <button class="btn btn-primary btn-sm edit-btn" data-id="${row._id}" @click="openEditModal(row)"><i class="fa fa-edit"></i></button>
                  <button class="btn btn-danger btn-sm delete-btn" data-id="${row._id}" ><i class="fa fa-trash"></i></button>
                </div>`;
              return buttonGroup;
            },
            orderable: false, // Prevent sorting on this column
          },
        ],
      });
      $("#myTable tbody").on("click", "button.btn-danger", function () {
        const _id = $(this).data("id");
        self.confirmDelete(_id); // Call confirmDelete method from the component
      });
    },
    calculateTotalCounts() {
      // Menghitung total Datang
      this.totalDatang = this.data.filter(
        (data) => data.konfirmasi_datang.toLowerCase() === "datang"
      ).length;

      // Menghitung total Tidak Datang
      this.totalTidakDatang = this.data.filter(
        (data) => data.konfirmasi_datang.toLowerCase() === "tidak datang"
      ).length;

      this.totalHadir = this.data.reduce((accumulator, currentItem) => {
        return accumulator + currentItem.jumlah_datang; // Replace 'value' with the actual property you want to sum
      }, 0);
      // Menghitung total Lokasi
      this.totalLokasi = this.data.filter((item) => item.is_datang === true).length;
    },

    async confirmDelete(_id) {
      try {
        const result = await Swal.fire({
          title: "Are you sure?",
          text: "You will not be able to recover this item!",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Yes, delete it!",
          cancelButtonText: "Cancel",
        });

        if (result.isConfirmed) {
          // Panggil API untuk menghapus item
          await axios.delete(process.env.VUE_APP_BEURL + `/dataortu/${_id}`);

          // Hapus item dari data setelah berhasil dihapus
          this.data = this.data.filter((item) => item._id !== _id);

          // Hitung kembali total counts atau yang diperlukan
          this.calculateTotalCounts();

          // Tampilkan pesan sukses
          Swal.fire("Deleted!", "Your item has been deleted successfully.", "success");
        }
      } catch (error) {
        console.error("Error:", error);

        // Tampilkan pesan kesalahan
        Swal.fire("Error", "An error occurred while deleting the item.", "error");
      }
    },
  },
};
</script>

<style>
/* In your CSS file (e.g., App.vue or a dedicated CSS file) */
@import "datatables.net-bs4/css/dataTables.bootstrap4.min.css";
</style>
