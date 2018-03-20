<?php
const UNKNOWN 		= "unknown";

const OS_WIN 		= "windows";
const OS_LINUX 		= "linux";
const OS_OSX 		= "mac";

const LINUX_UBUNTU 	= "ubuntu";
const LINUX_CENTOS 	= "centos";

const INFO 	= "INFO";
const DEBUG = "DEBUG";
const ERROR = "ERROR";

//获取linux发行版本
function get_linux_release_name() {
	$des = system("lsb_release -i -s");
	if (stripos($des, "UBUNTU") !== FALSE || stripos(system("whereis apt"), "/APT") !== FALSE) {
		return LINUX_UBUNTU;
	} else if(stripos($des, "CENTOS") !== FALSE || stripos(system("whereis yum"), "/YUM") !== FALSE) {
		return LINUX_CENTOS;
	} else {
		return UNKNOWN;
	}
}

//获取操作系统
function get_OS() {
	if (stristr(PHP_OS, 'DAR')) {
		return OS_OSX;
	} else if (stristr(PHP_OS, 'WIN')) {
		return OS_WIN;
	} else if (stristr(PHP_OS, 'LINUX')) {
		return OS_LINUX;
	} else {
		return UNKNOWN;
	}
}

//获取 ini_scanned_path
function get_ini_scanned_path() {
	$ini_scanned_files = php_ini_scanned_files();
	if ($ini_scanned_files) {
		$ini_scanned_arr = explode(",\n", trim(php_ini_scanned_files()));
		return dirname($ini_scanned_arr[0]);
	} else {
		return false;
	}
}

//安装流程展示
function major_tips($message, $done = FALSE) {
	global $index;
	echo <<<MSG
***********************************************************
 $index. $message
***********************************************************

MSG;
	$index++;
	if ($done) {
		exit(0);
	}
}

//日志
function log_tips($level, $msg, $arr = null) {
	echo '['.$level."]: ".$msg.PHP_EOL;
	if (!empty($arr) && is_array($arr)) {
		foreach ($arr as $key => $value) {
			echo $key." =>".$value.PHP_EOL;
		}
	}
	if ($level === ERROR) {
		exit(0); 	
	}
}

//帮助
function show_help() {
	echo <<<HELP
Synopsis:
    php install.php [options]

Options:
    -d <file>   <file> will act as OpenRASP work folder.

    -h          This Help.

HELP;
	exit(0); 
}

//全局变量
$index = 1;
$root_dir = null;
$current_os = get_OS();
$supported_sapi = array('apache2', 'cli', 'fpm');
$lib_filename = $current_os == OS_WIN ? 'openrasp.dll' : 'openrasp.so';
$lib_source_path = __DIR__.DIRECTORY_SEPARATOR.'php'.DIRECTORY_SEPARATOR.$current_os.'-php'
.PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION.'-'.php_uname("m").DIRECTORY_SEPARATOR.$lib_filename;
$extension_dir = ini_get('extension_dir');
$ini_loaded_file = php_ini_loaded_file();
$ini_scanned_path = get_ini_scanned_path();
$ini_scanned_file = 'openrasp.ini';

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 过程化安装 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
if (extension_loaded("openrasp")) {
	major_tips('openrasp has already been loaded.', TRUE);
}


if (isset($argc) && $argc > 1) {
	for ($i=1; $i<$argc; $i++) {
		switch ($argv[$i]) {
			case '-d':
				if (isset($argv[$i + 1])) {
					$root_dir = $argv[++$i];	
				}
				break;
			case '-h':
			default:
				show_help();
		}
	}
} else {
	show_help();
}

if (empty($root_dir)) {
	log_tips(ERROR, 'root_dir must be appropriately set!');
} else {
	echo "openrasp.root_dir => ".$root_dir.PHP_EOL; 
}

major_tips('copy openrasp lib to extension_dir');
if (!file_exists($extension_dir)) {
	log_tips(ERROR, $extension_dir.' not exist!');
}
if (!is_writable($extension_dir)) {
	log_tips(ERROR, $extension_dir.' is not writable, please make sure you have write permissions!');
}
if (!copy($lib_source_path, $extension_dir.DIRECTORY_SEPARATOR.$lib_filename)) {
	log_tips(ERROR, 'fail to copy openrasp lib into extension_dir!');
} else {
	log_tips(INFO, 'Successfully copy '.$lib_filename.' to '.$extension_dir);
}


major_tips('modify php.ini');
$ini_content = <<<OPENRASP
extension=openrasp.so
openrasp.root_dir="$root_dir"
;openrasp.block_url=
;openrasp.callable_blacklists=
;openrasp.enforce_policy=
;openrasp.hooks_ignore=
;openrasp.inject_urlprefix=
;openrasp.locale=
;openrasp.log_maxburst=
;openrasp.slowquery_min_rows=
;openrasp.syslog_alarm_enable=
;openrasp.syslog_facility=
;openrasp.syslog_server_address=
;openrasp.timeout_ms=

OPENRASP;
if ($ini_scanned_path) {
	$linux_release_name = UNKNOWN;
	$ini_system_links = null;
	if ($current_os == OS_LINUX) {
		$linux_release_name = get_linux_release_name();
	}
	if ($linux_release_name == LINUX_UBUNTU) {
		$ini_scanned_root = stristr($ini_scanned_path, 'cli', true);
		$ini_scanned_path = $ini_scanned_root."mods-available";
		$sapi_conf_paths = scandir($ini_scanned_root);
		foreach ($sapi_conf_paths as $key => $value) {
			if (is_dir($ini_scanned_root.$value) && in_array($value, $supported_sapi)) {
				$ini_system_links[$value] = $ini_scanned_root.$value.DIRECTORY_SEPARATOR.'conf.d/99-openrasp.ini';	
			}
		}
	}
	if (!is_writable($ini_scanned_path)) {
		log_tips(ERROR, $ini_scanned_path.' is not writable, please make sure you have write permissions!');
	}
	$handle = fopen($ini_scanned_path.DIRECTORY_SEPARATOR.$ini_scanned_file, "w+");
	if ($handle) {
		if (fwrite($handle, $ini_content) === FALSE) {
			log_tips(ERROR, 'Cannot write to '.$ini_scanned_path.DIRECTORY_SEPARATOR.$ini_scanned_file);
		} else {
			log_tips(INFO, 'Successfully write openrasp config to '.$ini_scanned_path.DIRECTORY_SEPARATOR.$ini_scanned_file);
		}
		if (!empty($ini_system_links) && is_array($ini_system_links)) {
			log_tips(INFO, 'Found system links of openrasp.ini are:', $ini_system_links);
			foreach ($ini_system_links as $key => $value) {
				if (file_exists($value) && readlink($value) === $ini_scanned_path.DIRECTORY_SEPARATOR.$ini_scanned_file) {
					continue;
				}
				if (!symlink($ini_scanned_path.DIRECTORY_SEPARATOR.$ini_scanned_file, $value)) {
					log_tips(ERROR, 'Fail to create link '.$value);
				}
			}
		}
		fclose($handle);
	} else {
		log_tips(ERROR, 'Cannot open '.$ini_scanned_path.DIRECTORY_SEPARATOR.$ini_scanned_file);
	} 
} else if ($ini_loaded_file) {
	if (!is_writable($ini_loaded_file)) {
		log_tips(ERROR, $ini_loaded_file.' is not writable, please make sure you have write permissions!');
	}
	$handle = fopen($ini_loaded_file, "a+");
	if ($handle) {
		if (fwrite($handle, $ini_content) === FALSE) {
			log_tips(ERROR, 'Cannot write to '.$ini_loaded_file);
		} else {
			log_tips(INFO, 'Successfully append openrasp config to '.$ini_loaded_file);
		}
		fclose($handle);
	} else {
		log_tips(ERROR, 'Cannot open '.$ini_loaded_file);
	} 
} else {
	log_tips(ERROR, 'Cannot find appropriate php.ini file.');
}


major_tips('Finish the installation.', TRUE); 
?>
