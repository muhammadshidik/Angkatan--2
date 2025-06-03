<?php
// jika user/pengguna mencet tombol simpan
// ambil data dari inputan, email, nama dan password
// masukkan ke dalam table user (name, email, password) nilainya dari masing-masing inputan 
//fungsi insert

include "config/koneksi.php";
if (isset($_POST['simpan'])) {
    $name = $_POST['name'];

    $query = mysqli_query($config, "INSERT INTO instructors (name, gender, education, phone, email, address) 
 VALUES ('$name','$gender','$education','$phone','$email','$address')");
    if ($query) {
        header("location:?page=instructor&tambah=berhasil");
    }
}

//revisian ambil dari pak reza
$header = isset($_GET['edit']) ? "Edit" : "Tambah";
$id_user = isset($_GET['edit']) ? $_GET['edit'] : '';
$queryEdit = mysqli_query($config, "SELECT * FROM instructors WHERE id='$id_user'");
$rowEdit  = mysqli_fetch_assoc($queryEdit);

if (isset($_POST['edit'])) {
    $name = $_POST['name'];

    $queryUpdate = mysqli_query($config, "UPDATE instructors SET name='$name', gender='$gender', education='$education', phone='$phone', email='$email', address='$address'");
    if ($queryUpdate) {
        header("location:?page=instructors&ubah=berhasil");
    }
}

?>
<form action="" method="post" enctype="multipart/form-data">
    <div class="mb-3 row">
        <div class="col-sm-2">
            <label for="">Nama instruktur * </label>
        </div>
        <div class="col-sm-10">
            <input required name="name" type="text"
                class="form-control"
                placeholder="Masukkan nama Instruktur"
                value="<?= isset($_GET['edit']) ? $rowEdit['name'] : '' ?>">
        </div>
    </div>
    <div class="mb-3 row">
        <div class="col-sm-2">
            <label for="">Gender *</label>
        </div>
        <div class="col-sm-10">
            <input type="radio" name="gender" value="1" checked> Man
            <input type="radio" name="gender" value="0"> Wooman
        </div>
    </div>
    <div class="mb-3 row">
        <div class="col-sm-2">
            <label for="">education* </label>
        </div>
        <div class="col-sm-10">
            <input required name="education" type="text"
                class="form-control"
                placeholder=""
                value="<?= isset($_GET['edit']) ? $rowEdit['education'] : '' ?>">
        </div>
    </div>

    <div class="mb-3 row">
        <div class="col-sm-2">
            <label for=""> Phone * </label>
        </div>
        <div class="col-sm-10">
            <input required name="phone" type="text"
                class="form-control"
                placeholder=""
                value="<?= isset($_GET['edit']) ? $rowEdit['phone'] : '' ?>">
        </div>
    </div>

    <div class="mb-3 row">
        <div class="col-sm-2">
            <label for="">Email * </label>
        </div>
        <div class="col-sm-10">
            <input required name="email" type="text"
                class="form-control"
                placeholder="Masukkan kemampuan anda"
                value="<?= isset($_GET['edit']) ? $rowEdit['email'] : '' ?>">
        </div>
    </div>
    <div class="mb-3 row">
        <div class="col-sm-2">
            <label for="">Address * </label>
        </div>
        <div class="col-sm-10">
            <textarea id="summernote" class="form-control" name="description" cols="30" rows="5"><?php echo !isset($row['description']) ? "" : $row['description'] ?></textarea>
        </div>
    </div>




    <div class="mb-3 row">
        <div class="col-sm-12">
            <button name="<?= isset($_GET['edit']) ? 'edit' : 'simpan'; ?>" type="submit"
                class="btn btn-primary">Simpan</button>
        </div>
    </div>
</form>