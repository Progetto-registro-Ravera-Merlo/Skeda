<?php


DEFINE('DB_HOST', 'localhost');
DEFINE('DB_USER', 'root');
DEFINE('DB_PASS', '');
DEFINE('DB_NAME', 'register');


function connect()
{
    $pdo = null;
    try {
        $pdo = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME, DB_USER, DB_PASS);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch(PDOException $e) {
        echo json_encode(['result'=>[ 'resultText'=>'Server connection error','success'=>false]]);
        exit(1);
    }
    return $pdo;
}

function disconnect($pdo)
{
    $pdo=null;
}

function getStudent($pdo,$email,$password,$adminID)
{
    try {
        $stmt = $pdo->prepare("SELECT * FROM students WHERE email = :email AND adminID = :adminID");
        $stmt->execute([':email' => $email,':adminID'=>$adminID]);
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        $passwordHash=password_hash($password,PASSWORD_DEFAULT);
        if ($data && password_verify($data['password'],$passwordHash)) {
            return $data; // Login OK
        } else {
            echo json_encode(['result'=>[ 'resultText'=>'Wrong password email or school','success'=>false]]);
            exit(2); // Login fallito
        }
    } catch (PDOException $e) {
        echo json_encode(['result'=>[ 'resultText'=>'Data base exception','success'=>false]]);
        exit(3);
    }
}
function getTeacher($pdo,$email,$password,$adminID)
{
    try {
        $stmt = $pdo->prepare("SELECT * FROM teachers WHERE email = :email AND adminID = :adminID");;
        $stmt->execute([':email' => $email,':adminID'=>$adminID]);
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        $passwordHash=password_hash($password,PASSWORD_DEFAULT);
        if ($data && password_verify($data['password'],$passwordHash)) {
            return $data; // Login OK
        } else {
            echo json_encode(['result'=>[ 'resultText'=>'Wrong password email or school','success'=>false]]);
            exit(2); // Login fallito
        }
    } catch (PDOException $e) {
        echo json_encode(['result'=>[ 'resultText'=>'Data base exception','success'=>false]]);
        exit(3);
    }
}
function getParent($pdo,$email,$password,$adminID)
{
    try {
        $stmt = $pdo->prepare("SELECT * FROM parents WHERE email = :email AND adminID = :adminID");
        $stmt->execute([':email' => $email,':adminID'=>$adminID]);
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        $passwordHash=password_hash($password,PASSWORD_DEFAULT);
        if ($data && password_verify($data['password'],$passwordHash)) {
            return $data; // Login OK
        } else {
            echo json_encode(['result'=>[ 'resultText'=>'Wrong password email or school','success'=>false]]);
            exit(2); // Login fallito
        }
    } catch (PDOException $e) {
        echo json_encode(['result'=>[ 'resultText'=>'Data base exception','success'=>false]]);
        exit(3);
    }
}
function getSchools($pdo)
{
    try {
        $stmt = $pdo->prepare("SELECT adminID,name FROM admins");
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($data) {
            echo json_encode(['data'=>$data,'success'=>true]);
        } else {
            echo json_encode(['resultText'=>'No data found','success'=>false]);
            exit(2);
        }
    } catch (PDOException $e) {
        echo json_encode(['result'=>[ 'resultText'=>'Data base exception','success'=>false]]);
        exit(3);
    }
}
?>
