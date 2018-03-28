<?php

class News extends CI_Controller {
    function __construct()
    {
        parent::__construct();
        $this->load->helper('cookie');
        $this->load->library('session');
    }

    public function show($id) {
        $cookie = array(
            'name'   => 'whatever',
            'value'  => 'test',
            'expire' => '300',
            'secure' => TRUE
        );
        // $this->input->set_cookie($cookie);

        $newdata = array(
            'username'  => 'johndoe',
            'logged_in' => TRUE
        );

        $this->session->set_userdata($newdata);
    }
}