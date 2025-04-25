<?php
require_once 'Library.php';
$db=connect();
if($db)
{
    $student=getStudent($db,$_POST['email'],$_POST['password'],$_POST['adminID']);
    session_start();
    $_SESSION['student']=$student;//array associativo
    echo json_encode(['result'=>['success'=>true,'redirect'=>'../Student']]);
    exit(0);
}
?>
