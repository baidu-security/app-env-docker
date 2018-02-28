<?php
include_once('vendor/smarty/smarty/libs/Smarty.class.php');
define('SMARTY_COMPILE_DIR','/tmp/templates_c');
define('SMARTY_CACHE_DIR','/tmp/cache');

class test extends Smarty_Resource_Custom
{
    protected function fetch($name,&$source,&$mtime)
    {
        $template = "CVE-2017-1000480 smarty PHP code injection";
        $source = $template;
        $mtime = time();
    }
}

$smarty = new Smarty();
$my_security_policy = new Smarty_Security($smarty);
$my_security_policy->php_functions = null;
$my_security_policy->php_handling = Smarty::PHP_REMOVE;
$my_security_policy->modifiers = array();
$smarty->enableSecurity($my_security_policy);
$smarty->setCacheDir(SMARTY_CACHE_DIR);
$smarty->setCompileDir(SMARTY_COMPILE_DIR);
$smarty->registerResource('test',new test);
$smarty->display('test:' . @$_GET['test']);
?>