<?php
require_once 'Library.php';
$db=connect();
if($db)
{
    $parent=getParent($db,$_POST['email'],$_POST['password'],$_POST['adminID']);
    session_start();
    $_SESSION['parent']=$parent;//array associativo
    echo json_encode(['result'=>['success'=>true,'redirect'=>'../Parent']]);
    exit(0);

}
?>
