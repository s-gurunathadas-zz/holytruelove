<?php
if ($_GET['randomId'] != "pMreo1xYPnvgzEP7tTWF4GzbiYWuwVVEH75BOg6xRi_3Xbc4msAo_2iqCYUUl6op") {
    echo "Access Denied";
    exit();
}

// display the HTML code:
echo stripslashes($_POST['wproPreviewHTML']);

?>  
