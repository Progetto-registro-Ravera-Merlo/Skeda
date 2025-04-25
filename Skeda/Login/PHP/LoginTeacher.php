<?php
require_once 'Library.php';
$db=connect();
if($db)
{
    $teacher=getTeacher($db,$_POST['email'],$_POST['password'],$_POST['adminID']);
    session_start();
    $_SESSION['teacher']=$teacher;//array associativo
    echo json_encode(['result'=>['success'=>true,'redirect'=>'../Teacher']]);
    exit(0);

}

?>