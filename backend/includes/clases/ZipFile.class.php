<?php //------------------------------------------

@ include_once( dirname(__FILE__) . '/./../functions/strings.php' );
@ include_once( dirname(__FILE__) . '/./../functions/files.php' );
@ include_once( dirname(__FILE__) . '/./../functions/arrays.php' );



class ZipFile extends Zip {
	

	private static $_pathSeparator = '/';
	private static $_rootDir = '';
	
	//------------------------------------------------
	
	
	public static function createFromFile( $file ) {
		
		$zip = new ZipFile();
		$zip->read_zip( $file );
		
		$zipFile = new ZipFile();
		$files = $zip->files;
		
		foreach($files as $file) {
		
			$zipFile->changeDir( $file['dir'] );
			$zipFile->addContent( $file['data'], $file['name'] );
		}
			
		return $zipFile;
	}
	
	public static function createFromString( $string ) {
		
		$file = file_create_temp( $string );
		
		$zipFile = self::createFromFile( $file );
		
		@ unlink( $file );
		
		return $zipFile;
	}
	
	//---------------------------------------------------

	private $currentDir;
	private $_contents = array();
	
	
	public function __construct( $read = null ) {
		
		$this->changeDirRoot();	
		
		
		if( $read != null ) {
			
			$zip = new ZipFile();
			
			if( is_file( $read ) ) $zip->read_zip( $read );
			
			else {
				
				$file = file_create_temp( $read );
				$zip->read_zip( $file );
				@ unlink( $file );		
			}
		
			$files = $zip->files;
			
			
		
			foreach($files as $file) {
				
				$this->changeDir( $file['dir'] );
				$this->addContent( $file['data'], $file['name'] );
			}
			
			
			
		}
	}
	
	
	//---------------------------------------------------
	
	
	public function changeDir( $dir ) {
		
		if( $dir == self::$_pathSeparator || $dir == self::$_rootDir ) $this->currentDir = self::$_rootDir;
		
		else {
		
			$parts = array_filter( explode( self::$_pathSeparator, $dir ) );
			$this->currentDir = implode( self::$_pathSeparator, $parts );
		}
	}
	
	
	public function changeDirRoot() { $this->changeDir( self::$_rootDir ); }
	
	
	public function getCurrentDir() { return  self::$_pathSeparator . $this->currentDir; }
	
	
	//---------------------------------------------------
	
	public function getDirs( $searchDir = null ) {
		
		if( $searchDir != null ) {
			
			$currentDir = $this->currentDir;
			
			$this->changeDir( $searchDir );
			$dirs = $this->getDirs();
			
			$this->changeDir( $currentDir );
			
			return $dirs;
			
		} else {
		
			$dirsAll = array_values( array_filter( array_keys( $this->_contents ) ) );
			
			if( $this->currentDir == self::$_rootDir ) return $dirsAll;
			
			else {
				
				
				$dirs = array();
				
				foreach( $dirsAll as $dir )
				
					if( str_starts_with( $dir, $this->currentDir ) && $this->currentDir != $dir )
					
						$dirs[] = str_replace( $this->currentDir . self::$_pathSeparator, '', $dir );
				
				
				return $dirs;
			}
			
		}
	}
	
	
	public function getFiles( $searchDir = null ) { 
		
		if($searchDir == null) $searchDir = $this->currentDir;
		
		$array = $this->_contents[ $searchDir ];
		
		if( !is_array($array) ) $array = array();
		
		return array_keys( $array );
	}
	
	
	public function getFileContent( $file, $searchDir = null ) {
		
		if( $searchDir != null ) {
			
			$currentDir = $this->currentDir;
			
			$this->changeDir( $searchDir );
			$content = $this->getFileContent( $file );
			
			$this->changeDir( $currentDir );
			
			return $content;
		
		} else if( strpos( $file, self::$_pathSeparator ) !== false ) {
			
			$parts = explode( self::$_pathSeparator, $file );
			
			$file = array_pop( $parts );
			$searchDir = implode( self::$_pathSeparator, $parts );
			
			return $this->getFileContent( $file, $searchDir );
		
		} else {
			
			if( !array_key_exists( $this->currentDir, $this->_contents ) ) return '';
			else return $this->_contents[ $this->currentDir ][ $file ];
		}
		
	}
	
	
	public function getFileSize( $file, $searchDir = null ) {
		
		$content = $this->getFileContent( $file, $searchDir );
		return strlen( $content );
		
	}
	
	
	public function getFileType( $file, $searchDir = null ) {
		
		$content = $this->getFileContent( $file, $searchDir );
		return file_get_mimetype_string( $content );
		
	}
	
	//---------------------------------------------------
	
	
	public function extractDir( $destinationDir, $dir, $searchDir = null ) {
		
		if($searchDir == null) $searchDir = $this->currentDir;
		
		$dir = str_replace('//', '/', "{$searchDir}/$dir" );
		
		$files = $this->getFiles( $dir );
		$dirs = $this->getDirs( $dir );
		
		$destinationDir = realpath( $destinationDir );
		
		foreach($files as $file) $this->extractFile( "$destinationDir/$file", $file, $dir );
		foreach($dirs as $folder) {
			
			mkdir( "$destinationDir/$folder" );
			$this->extractDir( "$destinationDir/$folder", $folder, $dir );
		}
		
	}
	
	public function extractFile( $destinationFile, $file, $searchDir = null ) {
		
		$content = $this->getFileContent( $file, $searchDir );
		return (boolean) file_put_contents( $destinationFile, $content );
	}
	
	
	//---------------------------------------------------
	
	public function addContent( $fileContent, $fileName ) {
		
		$fileName = basename( $fileName );
		
		$this->create_file( $fileContent, $this->currentDir . self::$_pathSeparator . $fileName );
		$this->_contents[ $this->currentDir ][ $fileName ] = $fileContent;
	}
	
	
	public function addFile( $file, $fileName = null ) {
		
		@ $content = file_get_contents( $file );
		
		if( $fileName == null ) $fileName = $file;
		
		$this->addContent( $content, $file );
	}
	
	
	
	//-----------------------------------------------------
	
	public function save( $name = 'file.zip' ) { return (boolean) file_put_contents( $name, $this->getString() ); }
		
		
		
	public function download( $name = 'file.zip' ) { 

		header("Content-Disposition: attachment; filename=\"$name\"");
		header('Content-Type: application/x-zip-compressed');	
		
		echo $this->getString();
	}
	
	
	public function getSize() { return strlen( $this->getString() ); }
	
	
	public function getString() { return (string) $this; }
	
	
	public function __toString() { return $this->zipped_file(); }
	
	//-----------------------------------------------------------
}


//----------------------------------------------------------------- 

class Zip {
	/*
		zipfile class, for reading or writing .zip files
		See http://www.gamingg.net for more of my work
		Based on tutorial given by John Coggeshall at http://www.zend.com/zend/spotlight/creating-zip-files3.php
		Copyright (C) Joshua Townsend and licensed under the GPL
		Version 1.0
	*/
	
	private $datasec = array(); // array to store compressed data
	protected $files = array(); // array of uncompressed files
	protected $dirs = array(); // array of directories that have been created already
	private $ctrl_dir = array(); // central directory
	private $eof_ctrl_dir = "\x50\x4b\x05\x06\x00\x00\x00\x00"; //end of Central directory record
	private $old_offset = 0;
	private $basedir = ".";

	protected function create_dir($name) // Adds a directory to the zip with the name $name
	{
		$name = str_replace("\\", "/", $name);

		$fr = "\x50\x4b\x03\x04";
		$fr .= "\x0a\x00";	// version needed to extract
		$fr .= "\x00\x00";	// general purpose bit flag
		$fr .= "\x00\x00";	// compression method
		$fr .= "\x00\x00\x00\x00"; // last mod time and date

		$fr .= pack("V",0); // crc32
		$fr .= pack("V",0); //compressed filesize
		$fr .= pack("V",0); //uncompressed filesize
		$fr .= pack("v",strlen($name)); //length of pathname
		$fr .= pack("v", 0); //extra field length
		$fr .= $name;
		// end of "local file header" segment

		// no "file data" segment for path

		// "data descriptor" segment (optional but necessary if archive is not served as file)
		$fr .= pack("V",0); //crc32
		$fr .= pack("V",0); //compressed filesize
		$fr .= pack("V",0); //uncompressed filesize

		// add this entry to array
		$this->datasec[] = $fr;

		$new_offset = strlen(implode("", $this->datasec));

		// ext. file attributes mirrors MS-DOS directory attr byte, detailed
		// at http://support.microsoft.com/support/kb/articles/Q125/0/19.asp

		// now add to central record
		$cdrec = "\x50\x4b\x01\x02";
		$cdrec .="\x00\x00";	// version made by
		$cdrec .="\x0a\x00";	// version needed to extract
		$cdrec .="\x00\x00";	// general purpose bit flag
		$cdrec .="\x00\x00";	// compression method
		$cdrec .="\x00\x00\x00\x00"; // last mod time and date
		$cdrec .= pack("V",0); // crc32
		$cdrec .= pack("V",0); //compressed filesize
		$cdrec .= pack("V",0); //uncompressed filesize
		$cdrec .= pack("v", strlen($name) ); //length of filename
		$cdrec .= pack("v", 0 ); //extra field length
		$cdrec .= pack("v", 0 ); //file comment length
		$cdrec .= pack("v", 0 ); //disk number start
		$cdrec .= pack("v", 0 ); //internal file attributes
		$cdrec .= pack("V", 16 ); //external file attributes  - 'directory' bit set

		$cdrec .= pack("V", $this->old_offset); //relative offset of local header
		$this->old_offset = $new_offset;

		$cdrec .= $name;
		// optional extra field, file comment goes here
		// save to array
		$this->ctrl_dir[] = $cdrec;
		$this->dirs[] = $name;
	}

	protected function create_file($data, $name) // Adds a file to the path specified by $name with the contents $data
	{
		$name = str_replace("\\", "/", $name);

		$fr = "\x50\x4b\x03\x04";
		$fr .= "\x14\x00";	// version needed to extract
		$fr .= "\x00\x00";	// general purpose bit flag
		$fr .= "\x08\x00";	// compression method
		$fr .= "\x00\x00\x00\x00"; // last mod time and date

		$unc_len = strlen($data);
		$crc = crc32($data);
		$zdata = gzcompress($data);
		$zdata = substr($zdata, 2, -4); // fix crc bug
		$c_len = strlen($zdata);
		$fr .= pack("V",$crc); // crc32
		$fr .= pack("V",$c_len); //compressed filesize
		$fr .= pack("V",$unc_len); //uncompressed filesize
		$fr .= pack("v", strlen($name) ); //length of filename
		$fr .= pack("v", 0 ); //extra field length
		$fr .= $name;
		// end of "local file header" segment

		// "file data" segment
		$fr .= $zdata;

		// "data descriptor" segment (optional but necessary if archive is not served as file)
		$fr .= pack("V",$crc); // crc32
		$fr .= pack("V",$c_len); // compressed filesize
		$fr .= pack("V",$unc_len); // uncompressed filesize

		// add this entry to array
		$this->datasec[] = $fr;

		$new_offset = strlen(implode("", $this->datasec));

		// now add to central directory record
		$cdrec = "\x50\x4b\x01\x02";
		$cdrec .="\x00\x00";	// version made by
		$cdrec .="\x14\x00";	// version needed to extract
		$cdrec .="\x00\x00";	// general purpose bit flag
		$cdrec .="\x08\x00";	// compression method
		$cdrec .="\x00\x00\x00\x00"; // last mod time & date
		$cdrec .= pack("V",$crc); // crc32
		$cdrec .= pack("V",$c_len); //compressed filesize
		$cdrec .= pack("V",$unc_len); //uncompressed filesize
		$cdrec .= pack("v", strlen($name) ); //length of filename
		$cdrec .= pack("v", 0 ); //extra field length
		$cdrec .= pack("v", 0 ); //file comment length
		$cdrec .= pack("v", 0 ); //disk number start
		$cdrec .= pack("v", 0 ); //internal file attributes
		$cdrec .= pack("V", 32 ); //external file attributes - 'archive' bit set

		$cdrec .= pack("V", $this->old_offset); //relative offset of local header
		$this->old_offset = $new_offset;

		$cdrec .= $name;
		// optional extra field, file comment goes here
		// save to central directory
		$this->ctrl_dir[] = $cdrec;
	}

	protected function read_zip($name)
	{
		// Clear current file
		$this->datasec = array();

		// File information
		$this->name = $name;
		$this->mtime = filemtime($name);
		$this->size = filesize($name);

		// Read file
		$fh = fopen($name, "rb");
		$filedata = fread($fh, $this->size);
		fclose($fh);

		// Break into sections
		$filesecta = explode("\x50\x4b\x05\x06", $filedata);

		// ZIP Comment
		$unpackeda = unpack('x16/v1length', $filesecta[1]);
		$this->comment = substr($filesecta[1], 18, $unpackeda['length']);
		$this->comment = str_replace(array("\r\n", "\r"), "\n", $this->comment); // CR + LF and CR -> LF

		// Cut entries from the central directory
		$filesecta = explode("\x50\x4b\x01\x02", $filedata);
		$filesecta = explode("\x50\x4b\x03\x04", $filesecta[0]);
		array_shift($filesecta); // Removes empty entry/signature

		foreach($filesecta as $filedata)
		{
			// CRC:crc, FD:file date, FT: file time, CM: compression method, GPF: general purpose flag, VN: version needed, CS: compressed size, UCS: uncompressed size, FNL: filename length
			$entrya = array();
			$entrya['error'] = "";

			$unpackeda = unpack("v1version/v1general_purpose/v1compress_method/v1file_time/v1file_date/V1crc/V1size_compressed/V1size_uncompressed/v1filename_length", $filedata);

			// Check for encryption
			$isencrypted = (($unpackeda['general_purpose'] & 0x0001) ? true : false);

			// Check for value block after compressed data
			if($unpackeda['general_purpose'] & 0x0008)
			{
				$unpackeda2 = unpack("V1crc/V1size_compressed/V1size_uncompressed", substr($filedata, -12));

				$unpackeda['crc'] = $unpackeda2['crc'];
				$unpackeda['size_compressed'] = $unpackeda2['size_uncompressed'];
				$unpackeda['size_uncompressed'] = $unpackeda2['size_uncompressed'];

				unset($unpackeda2);
			}

			$entrya['name'] = substr($filedata, 26, $unpackeda['filename_length']);

			if(substr($entrya['name'], -1) == "/") // skip directories
			{
				continue;
			}

			$entrya['dir'] = dirname($entrya['name']);
			$entrya['dir'] = ($entrya['dir'] == "." ? "" : $entrya['dir']);
			$entrya['name'] = basename($entrya['name']);


			$filedata = substr($filedata, 26 + $unpackeda['filename_length']);

			if(strlen($filedata) != $unpackeda['size_compressed'])
			{
				$entrya['error'] = "Compressed size is not equal to the value given in header.";
			}

			if($isencrypted)
			{
				$entrya['error'] = "Encryption is not supported.";
			}
			else
			{
				switch($unpackeda['compress_method'])
				{
					case 0: // Stored
						// Not compressed, continue
					break;
					case 8: // Deflated
						@ $filedata = gzinflate($filedata);
					break;
					case 12: // BZIP2
						if(!extension_loaded("bz2"))
						{
							@dl((strtolower(substr(PHP_OS, 0, 3)) == "win") ? "php_bz2.dll" : "bz2.so");
						}

						if(extension_loaded("bz2"))
						{
							$filedata = bzdecompress($filedata);
						}
						else
						{
							$entrya['error'] = "Required BZIP2 Extension not available.";
						}
					break;
					default:
						$entrya['error'] = "Compression method ({$unpackeda['compress_method']}) not supported.";
				}

				if(!$entrya['error'])
				{
					if($filedata === false)
					{
						$entrya['error'] = "Decompression failed.";
					}
					elseif(strlen($filedata) != $unpackeda['size_uncompressed'])
					{
						$entrya['error'] = "File size is not equal to the value given in header.";
					}
					elseif(crc32($filedata) != $unpackeda['crc'])
					{
						$entrya['error'] = "CRC32 checksum is not equal to the value given in header.";
					}
				}

				$entrya['filemtime'] = mktime(($unpackeda['file_time']  & 0xf800) >> 11,($unpackeda['file_time']  & 0x07e0) >>  5, ($unpackeda['file_time']  & 0x001f) <<  1, ($unpackeda['file_date']  & 0x01e0) >>  5, ($unpackeda['file_date']  & 0x001f), (($unpackeda['file_date'] & 0xfe00) >>  9) + 1980);
				$entrya['data'] = $filedata;
			}

			$this->files[] = $entrya;
		}

		return $this->files;
	}

	protected function add_file($file, $dir = ".", $file_blacklist = array(), $ext_blacklist = array())
	{
		$file = str_replace("\\", "/", $file);
		$dir = str_replace("\\", "/", $dir);

		if(strpos($file, "/") !== false)
		{
			$dira = explode("/", "{$dir}/{$file}");
			$file = array_shift($dira);
			$dir = implode("/", $dira);
			unset($dira);
		}

		while(substr($dir, 0, 2) == "./")
		{
			$dir = substr($dir, 2);
		}
		while(substr($file, 0, 2) == "./")
		{
			$file = substr($file, 2);
		}
		if(!in_array($dir, $this->dirs))
		{
			if($dir == ".")
			{
				$this->create_dir("./");
			}
			$this->dirs[] = $dir;
		}
		if(in_array($file, $file_blacklist))
		{
			return true;
		}
		foreach($ext_blacklist as $ext)
		{
			if(substr($file, -1 - strlen($ext)) == ".{$ext}")
			{
				return true;
			}
		}

		$filepath = (($dir && $dir != ".") ? "{$dir}/" : "").$file;
		if(is_dir("{$this->basedir}/{$filepath}"))
		{
			$dh = opendir("{$this->basedir}/{$filepath}");
			while(($subfile = readdir($dh)) !== false)
			{
				if($subfile != "." && $subfile != "..")
				{
					$this->add_file($subfile, $filepath, $file_blacklist, $ext_blacklist);
				}
			}
			closedir($dh);
		}
		else
		{
			$this->create_file(implode("", file("{$this->basedir}/{$filepath}")), $filepath);
		}

		return true;
	}

	protected function zipped_file() // return zipped file contents
	{
		$data = implode("", $this->datasec);
		$ctrldir = implode("", $this->ctrl_dir);

		return $data.
				$ctrldir.
				$this->eof_ctrl_dir.
				pack("v", sizeof($this->ctrl_dir)). // total number of entries "on this disk"
				pack("v", sizeof($this->ctrl_dir)). // total number of entries overall
				pack("V", strlen($ctrldir)). // size of central dir
				pack("V", strlen($data)). // offset to start of central dir
				"\x00\x00"; // .zip file comment length
	}
}

//----------------------------------------------------------------- ?>