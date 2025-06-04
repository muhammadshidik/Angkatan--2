<?php
// jika user/pengguna mencet tombol simpan
// ambil data dari inputan, email, nama dan password
// masukkan ke dalam table user (name, email, password) nilainya dari masing-masing inputan 
//fungsi insert
include "config/koneksi.php";
if (isset($_GET['delete'])) {
    $id_user = isset($_GET['delete']) ? $_GET['delete'] : '';
    $queryDelete = mysqli_query($config, "DELETE FROM instructors WHERE id='$id_user'");
    if ($queryDelete) {
        header("location:?page=instructor&hapus=berhasil");
    } else {
        header("location:?page=instructor&hapus=gagal");
    }
}
$id_user = isset($_GET['edit']) ? $_GET['edit'] : '';
$queryEdit = mysqli_query($config, "SELECT * FROM instructors WHERE id='$id_user'");
$rowEdit = mysqli_fetch_assoc($queryEdit);
// print_r($id_user);
if (isset($_POST['name'])) {
    //ada tidak parameter bernama edit, kalo ada jalankan perintah edit/update, kalo tidak ada tambah data baru/insert
    $name = $_POST['name'];
    $gender = $_POST['gender'];
    $education = $_POST['education'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $address = $_POST['address'];

    if (!isset($_GET['edit'])) {
        $insert = mysqli_query($config, "INSERT INTO instructors (name, gender, education, phone, email, address) 
 VALUES ('$name','$gender','$education','$phone','$email','$address')");
        header("location:?page=instructor&tambah=berhasil");
    } else {
        $Update = mysqli_query($config, "UPDATE instructors SET name='$name', gender='$gender', education='$education', phone='$phone', email='$email', address='$address' WHERE id='$id_user'");
        header("location:?page=instructor&ubah=berhasil");
    }
}

?>

<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title"><?php echo isset($id_user) ? 'Edit'  : 'Add' ?> Instructor</h5>
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
                            <input type="radio" name="gender" value="1" checked> Male
                            <input type="radio" name="gender" value="0"> Female
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
                                placeholder="username@gmail.com"
                                value="<?= isset($_GET['edit']) ? $rowEdit['email'] : '' ?>">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-sm-2">
                            <label for="">Address * </label>
                        </div>
                        <div class="col-sm-10">
                            <textarea id="summernote" class="form-control" name="address" cols="30" rows="5"><?php echo !isset($rowEdit['address']) ? "" : $rowEdit['address'] ?></textarea>
                        </div>
                    </div>




                    <div class="mb-3 row">
                        <div class="col-sm-12">
                            <button name="<?= isset($_GET['edit']) ? 'edit' : 'simpan'; ?>" type="submit"
                                class="btn btn-primary">Simpan</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>