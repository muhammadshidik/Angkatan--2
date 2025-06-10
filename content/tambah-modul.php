<?php

if (isset($_GET['delete'])) {
    $id = isset($_GET['delete']) ? $_GET['delete'] : '';

    $queryModulsDetails = mysqli_query($config, "SELECT file FROM moduls_details WHERE id_modul='$id'");
    $rowModulDetails = mysqli_fetch_assoc($queryModulsDetails);
    unlink("uploads/" . $rowModulDetails['file']);



    $queryDelete = mysqli_query($config, "DELETE FROM moduls_details WHERE id_modul='$id'");
    $queryDelete = mysqli_query($config, "DELETE FROM moduls WHERE id='$id'");
    if ($queryDelete) {
        header("location:?page=moduls&hapus=berhasil");
    } else {
        header("location:?page=moduls&hapus=gagal");
    }
}
$id_user = isset($_GET['edit']) ? $_GET['edit'] : '';
$queryEdit = mysqli_query($config, "SELECT * FROM majors WHERE id='$id_user'");
$rowEdit = mysqli_fetch_assoc($queryEdit);
// print_r($id_user);
if (isset($_POST['save'])) {
    //ada tidak parameter bernama edit, kalo ada jalankan perintah edit/update, kalo tidak ada tambah data baru/insert
    $id_instructor = $_POST['id_instructor'];
    $id_major = $_POST['id_major'];
    $name = $_POST['name'];
    $insert = mysqli_query($config, "INSERT INTO moduls (id_major, id_instructor, name) VALUES('$id_major','$id_instructor','$name')");

    if ($insert) {
        $id_modul = mysqli_insert_id($config);
        //$_FILES
        foreach ($_FILES['file']['name'] as $index => $file) {
            if ($_FILES['file']['error'][$index] == 0) {

                $name = basename($_FILES['file']['name'][$index]);
                $fileName = uniqid() . "-" . $name;
                $path = "uploads/";
                $targetPath = $path . $fileName;

                if (move_uploaded_file($_FILES['file']['tmp_name'][$index], $targetPath)) {
                    $insertModulDetail = mysqli_query($config, "INSERT INTO moduls_details 
                (id_modul, file) VALUES('$id_modul','$fileName')");
                }
            }
        }
        header("location:?page=moduls&tambah=berhasil");
    }
}

$id_instructor = isset($_SESSION['ID_USER']) ? $_SESSION['ID_USER'] : '';
$queryInstructorMajor = mysqli_query($config, "SELECT majors.name,
 instructor_majors.* FROM instructor_majors LEFT JOIN majors ON majors.id = instructor_majors.id_major 
 WHERE instructor_majors.id_instructor = '$id_instructor'");

$rowInstructorMajors = mysqli_fetch_all($queryInstructorMajor, MYSQLI_ASSOC);

$id_modul = isset($_GET['detail']) ? $_GET['detail'] : '';
$queryModul = mysqli_query($config, "SELECT majors.name as major_name,
instructors.name as instructor_name, moduls.* 
FROM moduls
LEFT JOIN majors ON majors.id = moduls.id_major
LEFT JOIN instructors ON instructors.id = moduls.id_instructor WHERE moduls.id = '$id_modul'");
$rowModul = mysqli_fetch_assoc($queryModul);

//query ke detail modul
$queryDetailModul = mysqli_query($config, "SELECT * FROM moduls_details WHERE id_modul='$id_modul'");
$rowDetailModul = mysqli_fetch_all($queryDetailModul, MYSQLI_ASSOC);

?>


<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title"><?php echo isset($_GET['detail']) ? 'Detail' : 'Add' ?> Modul</h5>

                <?php if (isset($_GET['detail'])): ?>
                <?php else: ?>
                    <!-- detail modul -->
                    <table class="table table-stripped">
                        <tr>
                            <th>Modul Name</th>
                            <th>:</th>
                            <td><?php echo $rowModul['name'] ?></td>
                            <th>Major</th>
                            <th>:</th>
                            <td><?php echo $rowModul['major_name'] ?></td>
                        </tr>
                        <tr>
                            <th>Instructor</th>
                            <th>:</th>
                            <td><?php echo $rowModul['instructor_name'] ?></td>
                        </tr>
                    </table>
                    <br>
                    <br>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                    </table>
                <?php endif ?>
                <!-- form tambah modul -->
                <form action="" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="mb-3">
                                <label for="" class="form-label">Instructor Name</label>
                                <input readonly value="<?php echo $_SESSION['NAME'] ?>" type="text" class="form-control">
                                <input type="hidden" name="id_instructor" value="<?php echo $_SESSION['ID_USER'] ?>">
                            </div>
                            <div class="mb-3">
                                <label for="" class="form-label">Modul Name</label>
                                <input class="form-control" type="text" name="name" value="" placeholder="Enter Modul Name">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="mb-3">
                                <label for="" class="form-label">Major Name</label>
                                <select name="id_major" id="" class="form-control">
                                    <option value="">Select one</option>
                                    <?php foreach ($rowInstructorMajors as $row) : ?>
                                        <option value="<?php echo $row['id_major'] ?>"><?php echo $row['name'] ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div align="right" class="mb-3">
                        <button type="button" class="btn btn-primary addRow" id="addRow">Add Row</button>
                    </div>
                    <table class="table" id="myTable">
                        <thead>
                            <tr>
                                <th>File</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
            </div>
            <div class="mb-3">
                <input type="submit" class="btn btn-success" name="save" value="Save">
            </div>
            </form>
        </div>
    </div>
</div>
</div>
<script>
    // var, let, const
    // var : ketika nilainya tidak ada, maka tidak ada error
    // let : harus mempunyai nilai
    // const :isi nya tidak boleh berubah
    // const button = document.getElementById('addRow');
    // const button = document.getElementsByClassName('addRow');
    const button = document.querySelector('.addRow');
    const tbody = document.querySelector('#myTable tbody');
    // button.textContent = "duar";
    // button.style.color = "red";

    button.addEventListener("click", function() {
        // alert('Duar');
        const tr = document.createElement('tr'); //<tr></tr>
        tr.innerHTML = `
        <td><input type='file' name='file[]'></td><td>Delete</td>`;

        tbody.appendChild(tr);
    });
</script>