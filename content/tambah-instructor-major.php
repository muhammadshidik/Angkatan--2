<?php
// jika user/pengguna mencet tombol simpan
// ambil data dari inputan, email, nama dan password
// masukkan ke dalam table user (name, email, password) nilainya dari masing-masing inputan 
//fungsi insert
include "config/koneksi.php";
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $id_instructor = $_GET['id_instructor'];

    $queryDelete = mysqli_query($config, "DELETE FROM instructor_majors WHERE id='$id'");
    if ($queryDelete) {
        header("location:?page=tambah-instructor-major&id=" . $id . "&hapus=berhasil");
    } else {
        header("location:?page=tambah-instructor-major&id=" . $id . "&tambah=gagal");
    }
}

$id = isset($_GET['id']) ? $_GET['id'] : '';
// print_r($id_user);
if (isset($_POST['id_major'])) {
    //ada tidak parameter bernama edit, kalo ada jalankan perintah edit/update, kalo tidak ada tambah data baru/insert
    $id_major = $_POST['id_major'];

    $insert = mysqli_query($config, "INSERT INTO instructor_majors (id_major, id_instructor) 
 VALUES ('$id_major', '$id')");
    header("location:?page=tambah-instructor-major&id=" . $id . "&tambah=berhasil");
}

$queryMajor = mysqli_query($config, "SELECT * FROM majors ORDER BY id DESC");
$rowMajors = mysqli_fetch_all($queryMajor, MYSQLI_ASSOC);

$queryInstructor = mysqli_query($config, "SELECT * FROM instructors WHERE id = '$id'");
$rowInstructor = mysqli_fetch_assoc($queryInstructor);

$queryInstructorMajor = mysqli_query($config, "SELECT majors.name, instructor_majors.id, id_instructor FROM instructor_majors 
LEFT JOIN majors ON majors.id = instructor_majors.id_major WHERE id_instructor = '$id' ORDER BY instructor_majors.id DESC");
$rowInstructorMajors = mysqli_fetch_all($queryInstructorMajor, MYSQLI_ASSOC);

?>

<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title"> Add Instructor Major : <?php echo $rowInstructor['name'] ?></h5>
                <div align="right">
                    <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Add Instructor Major
                    </button>
                </div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Major Name</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $no = 1;
                        foreach ($rowInstructorMajors as $index => $rowInstructorMajor): ?>
                            <tr>
                                <!-- <td><?php echo $index += 1; ?></td> -->
                                <td><?php echo $no++ ?></td>
                                <td><?php echo $rowInstructorMajor['name']; ?></td>
                                <td>
                                    <a onclick="return confirm('Are you sure wanna delete this data??')"
                                        href="?page=tambah-instructor-major&delete=<?php echo $rowInstructorMajor['id'] ?>
                                        &id_instructor=<?php echo $rowInstructorMajor['id_instructor'] ?>"
                                        class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </tr>
                        <?php endforeach ?>
                    </tbody>
                </table>
                <!-- Button trigger modal -->


                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Add New Instructor Major : </h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="" method="post">
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label for="">Major Name</label>
                                        <select name="id_major" id="" class="form_control">
                                            <option value="">Select One</option>
                                            <?php foreach ($rowMajors as $rowMajor): ?>
                                                <option value="<?php echo $rowMajor['id'] ?>"><?php echo $rowMajor['name'] ?></option>
                                            <?php endforeach ?>
                                        </select>
                                    </div>
                                    ...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>