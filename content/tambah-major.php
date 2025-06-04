<?php

if (isset($_GET['delete'])) {
    $id_user = isset($_GET['delete']) ? $_GET['delete'] : '';
    $queryDelete = mysqli_query($config, "DELETE FROM majors WHERE id='$id_user'");
    if ($queryDelete) {
        header("location:?page=major&hapus=berhasil");
    } else {
        header("location:?page=major&hapus=gagal");
    }
}
$id_user = isset($_GET['edit']) ? $_GET['edit'] : '';
$queryEdit = mysqli_query($config, "SELECT * FROM majors WHERE id='$id_user'");
$rowEdit = mysqli_fetch_assoc($queryEdit);
// print_r($id_user);
if (isset($_POST['name'])) {
    //ada tidak parameter bernama edit, kalo ada jalankan perintah edit/update, kalo tidak ada tambah data baru/insert
    $name = $_POST['name'];

    if (!isset($_GET['edit'])) {
        $insert = mysqli_query($config, "INSERT INTO majors (name) VALUES('$name')");
        header("location:?page=major&tambah=berhasil");
    } else {
        $Update = mysqli_query($config, "UPDATE majors SET name='$name' WHERE id='$id_user'");
        header("location:?page=major&ubah=berhasil");
    }
}

?>


<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title"><?php echo isset($id_user) ? 'Edit'  : 'Add' ?> Major</h5>
                <form action="" method="post">
                    <div class="mb-3">
                        <label for="">Name Major</label>
                        <input value="<?php echo isset($rowEdit['name']) ? $rowEdit['name'] : '' ?>" type="text" class="form-control" name="name" placeholder="" required>
                    </div>
                    <div class="mb-3">
                        <input type="submit" class="btn btn-success" name="save">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>