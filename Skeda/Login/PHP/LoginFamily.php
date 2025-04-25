<?php
require_once 'Library.php';
$db=connect();
if($db)
{
    $parent=getparent($db,$_POST['email'],$_POST['password']);
    if($parent)
    {
        session_start();
        $_SESSION['parent']=$parent;//array associativo
        echo json_encode(['result'=>['success'=>true,'redirect'=>'./HTML/parent.html']]);
        exit(0);
    }
    else
    {
        echo json_encode(['result'=>[ 'resultText'=>'Parent not found','success'=>false]]);
        exit(4);
    }
}

?>
