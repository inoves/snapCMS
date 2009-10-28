<?php

class Photo extends PhotoBase {
	
	static $versions = array(
		'quad/'	=> ' -resize 60x60^ -gravity center -extent 60x60 ',
		'thumbs/'=> ' -resize 60x60\> ',
		'small/'=> ' -resize 150x150\> ',
		'medium/'=> ' -resize 300x300\> ',
		'screen/'=> ' -resize 480x600\> '
	);
	public function url_photo($version){
		return Helper::url_photo($this, $version, 'name', 'photos');
	}
	public function upload($page_id, $file, $desc='')
	{
		if (!is_uploaded_file($file['tmp_name'])):
			throw new Exception('Not file uploaded.');
		endif;
		$photo = new Photo();
		$photo->page_id = $page_id;
		$photo->description = $desc;
		$photo->name = $file['name'];
		$photo->save();
		$dir =  Config::$path_photos . $photo->id.'/';
		foreach( Photo::$versions as $version => $value ){
			@mkdir( $dir.$version, 0777, TRUE );
			$str_exec = "convert ".$file['tmp_name'] . $value . $dir.$version.$file['name'];
			@exec($str_exec);
		}
		move_uploaded_file($file['tmp_name'], $dir.$file['name']);
		
	}
	
	public function del_photo()
	{
		$dir =  Config::$path_webroot .$this->id.'/';
		$this->rmdirr($dir);
		$this->destroy();
	}
	
	private function rmdirr($dirname)
	{
	    if (!file_exists($dirname)):
	        return false;
	    endif;
	    if (is_file($dirname) || is_link($dirname)):
	        return unlink($dirname);
	    endif;
	    $dir = dir($dirname);
	    while (false !== $entry = $dir->read()):
	        if ($entry == '.' || $entry == '..'):
	            continue;
	        endif;
	        self::rmdirr($dirname . DIRECTORY_SEPARATOR . $entry);
	    endwhile;
	    $dir->close();
	    return rmdir($dirname);
	}

}

?>
