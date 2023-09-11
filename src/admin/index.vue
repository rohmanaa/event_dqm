<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Table</title>
    
    <!-- Tambahkan Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
    <!-- Tambahkan DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
</head>
<body>
    <div class="container mb-2">
        <h2>Data Registrasi Event DQM</h2>
        <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
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
                    <th style="text-align:center;width:100px;">Aksi
                    </th>
                </tr>
            </thead>
            <tbody>
                <!-- Isi data dari data yang diberikan -->
                <!-- Data akan diisi dari API dengan JavaScript -->
            </tbody>
        </table>
    </div>

    <!-- Modal untuk menghapus -->
    <div id="deleteModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Konfirmasi Hapus</h4>
                </div>
                <div class="modal-body">
                    <p>Apakah Anda yakin ingin menghapus data ini?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
                    <button type="button" class="btn btn-danger" id="deleteConfirm">Hapus</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal untuk mengedit -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Row Information</h4>
                </div>
                <div class="modal-body">
                    <!-- Isi informasi baris di sini -->
                    <div class="form-group">
                        <label for="no">No:</label>
                        <input type="text" class="form-control" id="no">
                    </div>
                    <div class="form-group">
                        <label for="nama_anak">Nama Anak:</label>
                        <input type="text" class="form-control" id="nama_anak">
                    </div>
                    <div class="form-group">
                        <label for="nama_ayah">Nama Ayah:</label>
                        <input type="text" class="form-control" id="nama_ayah">
                    </div>
                    <div class="form-group">
                        <label for="nama_ibu">Nama Ibu:</label>
                        <input type="text" class="form-control" id="nama_ibu">
                    </div>
                    <div class="form-group">
                        <label for="jumlah_datang">Jumlah Datang:</label>
                        <input type="text" class="form-control" id="jumlah_datang">
                    </div>
                    <div class="form-group">
                        <label for="status_kehadiran">Status Kehadiran:</label>
                        <input type="text" class="form-control" id="status_kehadiran">
                    </div>
                    <div class="form-group">
                        <label for="hadir_lokasi">Hadir Lokasi:</label>
                        <input type="text" class="form-control" id="hadir_lokasi">
                    </div>
                    <div class="form-group">
                        <label for="waktu">Waktu:</label>
                        <input type="text" class="form-control" id="waktu">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
                    <button type="button" class="btn btn-primary" id="editSave">Simpan</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Tambahkan jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- Tambahkan Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- Tambahkan DataTables JavaScript -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>

    <!-- Script JavaScript untuk DataTables -->
    <script>
        $(document).ready(function() {
            var table = $('#example').DataTable();

            // Tambahkan event handler untuk tombol Edit
            $('#example tbody').on('click', '.dt-edit', function () {
                var data = table.row($(this).parents('tr')).data();
                // Isi modal dengan data yang sesuai
                $('#no').val(data[0]);
                $('#nama_anak').val(data[1]);
                $('#nama_ayah').val(data[2]);
                $('#nama_ibu').val(data[3]);
                $('#jumlah_datang').val(data[4]);
                $('#status_kehadiran').val(data[5]);
                $('#hadir_lokasi').val(data[6]);
                $('#waktu').val(data[7]);
                $('#myModal').modal('show');
            });

            // Tambahkan event handler untuk tombol Delete
            var deleteRowIndex; // Menyimpan indeks baris yang akan dihapus
            $('#example tbody').on('click', '.dt-delete', function () {
                var data = table.row($(this).parents('tr')).data();
                deleteRowIndex = table.row($(this).parents('tr')).index();
                $('#deleteModal').modal('show');
            });

            // Event handler untuk tombol Hapus pada modal konfirmasi
            $('#deleteConfirm').on('click', function () {
                table.row(deleteRowIndex).remove().draw();
                $('#deleteModal').modal('hide');
            });

            // Event handler untuk tombol Simpan pada modal Edit
            $('#editSave').on('click', function () {
                var newData = [
                    $('#no').val(),
                    $('#nama_anak').val(),
                    $('#nama_ayah').val(),
                    $('#nama_ibu').val(),
                    $('#jumlah_datang').val(),
                    $('#status_kehadiran').val(),
                    $('#hadir_lokasi').val(),
                    $('#waktu').val()
                ];

                table.row(deleteRowIndex).data(newData).draw();
                $('#myModal').modal('hide');
            });

            // Tarik data dari API
            $.ajax({
                url: 'URL_API_ANDA', // Ganti dengan URL API yang sesuai
                method: 'GET',
                success: function (data) {
                    // Loop melalui data dari API dan tambahkan ke tabel
                    data.forEach(function (item) {
                        var rowData = [
                            item.no,
                            item.nama_anak,
                            item.nama_ayah,
                            item.nama_ibu,
                            item.jumlah_datang,
                            item.status_kehadiran,
                            item.hadir_lokasi,
                            item.waktu,
                            '<button type="button" class="btn btn-primary btn-xs dt-edit" data-toggle="modal" data-target="#myModal">' +
                            '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>' +
                            '</button>' +
                            '<button type="button" class="btn btn-danger btn-xs dt-delete">' +
                            '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>' +
                            '</button>'
                        ];

                        table.row.add(rowData).draw();
                    });
                },
                error: function () {
                    alert('Gagal mengambil data dari API.');
                }
            });
        });
    </script>
</body>
</html>
