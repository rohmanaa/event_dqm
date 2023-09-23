<template>
    <div>
        <!-- DataTable -->
        <table id="myTable" class="table table-striped table-bordered" style="width: 100%">
            <!-- DataTable columns go here -->
        </table>

        <!-- Edit Modal -->
        <EditModal :editedData="editedData" @edit-submit="saveEditedData" />

        <!-- DataTable initialization and rendering logic -->
    </div>
</template>

<script>
import EditModal from './EditModal.vue'; // Adjust the import path as needed

export default {
    components: {
        EditModal,
    },
    data() {
        return {
            data: [], // Your data for the DataTable
            editedData: {}, // Data to be edited in the modal
        };
    },
    methods: {
        // Function to open the edit modal
        openEditModal(data) {
            this.editedData = { ...data }; // Copy the data to be edited
            $('#editModal').modal('show'); // Show the modal
        },
        // Function to save edited data
        saveEditedData(editedData) {
            // Handle saving the edited data, e.g., make an API request
            // After saving, update this.data or refresh the DataTable as needed
            $('#myTable').DataTable().ajax.reload(); // Reload the DataTable
        },
        // DataTable initialization and rendering logic
        initDataTable() {
            $('#myTable').DataTable({
                // DataTable configuration options
                // Specify columns, data source, etc.
                columns: [
                    // Define your DataTable columns here
                ],
                data: this.data, // Your data source
        // Other DataTable options go here
        // ...
        // Add a column for the "Edit" button
        {
                    data: null,
                    render: function (data, type, row) {
                        return `<button class="btn btn-primary btn-sm edit-btn" data-id="${row._id}" @click="openEditModal(row)">Edit</button>`;
                    },
                    orderable: false, // Prevent sorting on this column
                },
      });
    },
},
mounted() {
    // Load your data and initialize the DataTable
    // You can make an API request to fetch the data here
    // After loading the data, call this.initDataTable() to initialize the DataTable
},
};
</script>
