delimiter //
CREATE PROCEDURE `usp_getAllPermitsUser`(IN idUser_ INTEGER(11))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

SELECT
    permisosobjetos.idObjeto as 'idObjeto',
    group_concat(permisosobjetos.idTipoPermiso)  as 'sPermisos'
    ##objetos.sNombre as 'sObjeto'
FROM
    permisosobjetos
    LEFT JOIN objetos ON permisosobjetos.idObjeto = objetos.id
    LEFT JOIN permisosobjetosusuarios ON permisosobjetos.id = permisosobjetosusuarios.idPermisoObjeto
WHERE
    permisosobjetosusuarios.idUsuario = idUser_ 
group by permisosobjetos.idObjeto
ORDER BY permisosobjetos.idObjeto ASC;
        
END //

CREATE PROCEDURE `usp_getCampanias`(IN CONDITIONS_ VARCHAR(255), IN ORDER_ TEXT, IN OFFSET_ VARCHAR(8), IN NUM_ VARCHAR(8))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

SET @SQL_ = "
		SELECT 
        campanias.id as 'id',
        campanias.idEstadoTrabajo as 'idEstadoTrabajo',
        campanias.sRemitente as 'sRemitente',
        campanias.sTitulo as 'sTitulo',
        campanias.sMensaje as 'sMensaje',
        campanias.sObservacion as 'sObservacion',
        DATE_FORMAT(campanias.dFechaEnvio, '%d/%m/%Y %h:%i:%s') as 'dFechaEnvio',
        DATE_FORMAT(campanias.dFechaRegistro, '%d/%m/%Y %h:%i:%s') as 'dFechaRegistro'
        FROM
        	campanias
		";

IF(CONDITIONS_ != "")THEN
	SET @Conditions_ = CONCAT(" WHERE " , CONDITIONS_ );
	SET @SQL_ = CONCAT(@SQL_, " ", @Conditions_);
END IF;

IF(ORDER_ != "")THEN
	SET @Order_ = CONCAT(" ORDER BY " , ORDER_, " DESC" );
	SET @SQL_ = CONCAT(@SQL_, " ",@Order_);
END IF;


IF(OFFSET_ != "" AND NUM_ != "")THEN
	SET @Limit_ = CONCAT("LIMIT " , OFFSET_ , "," , NUM_);
	SET @SQL_ = CONCAT(@SQL_, " ",@Limit_);
END IF;

PREPARE stmt FROM @SQL_;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END //

CREATE PROCEDURE `usp_getCampanias1`(IN CONDITIONS_ VARCHAR(255), IN ORDER_ TEXT, IN OFFSET_ VARCHAR(8), IN NUM_ VARCHAR(8))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

SET @SQL_ = "
		SELECT 
        campanias.id as 'id',
        campanias.idEstadoTrabajo as 'idEstadoTrabajo',
        campanias.sRemitente as 'sRemitente',
        campanias.sTitulo as 'sTitulo',
        campanias.sMensaje as 'sMensaje',
        campanias.sObservacion as 'sObservacion',
        IF(campanias.dFechaEnvio='0000-00-00 00:00:00' ,DATE_FORMAT(campanias.dFechaEnvio, '%d/%m/%Y %h:%i:%s'),'-') as 'dFechaEnvio',
        DATE_FORMAT(campanias.dFechaRegistro, '%d/%m/%Y %h:%i:%s') as 'dFechaRegistro'
        FROM
        	campanias
		";

IF(CONDITIONS_ != "")THEN
	SET @Conditions_ = CONCAT(" WHERE " , CONDITIONS_ );
	SET @SQL_ = CONCAT(@SQL_, " ", @Conditions_);
END IF;

IF(ORDER_ != "")THEN
	SET @Order_ = CONCAT(" ORDER BY " , ORDER_, " DESC" );
	SET @SQL_ = CONCAT(@SQL_, " ",@Order_);
END IF;


IF(OFFSET_ != "" AND NUM_ != "")THEN
	SET @Limit_ = CONCAT("LIMIT " , OFFSET_ , "," , NUM_);
	SET @SQL_ = CONCAT(@SQL_, " ",@Limit_);
END IF;

PREPARE stmt FROM @SQL_;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END //

CREATE PROCEDURE `usp_getContactos`(IN CONDITIONS_ VARCHAR(255), IN ORDER_ TEXT, IN OFFSET_ VARCHAR(8), IN NUM_ VARCHAR(8))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

SET @SQL_ = "
		SELECT 
        contactos.id as 'id',
		contactos.idGrupo as 'idGrupo',
	    contactos.sNombre as 'sNombre',
        contactos.sApellido as 'sApellido',
	    contactos.sDireccion as 'sDireccion',
		contactos.sMail as 'sMail',
        contactos.sTelefono as 'sTelefono',
		contactos.sMovil as 'sMovil',
	    contactos.sEstado as 'sEstado',
        DATE_FORMAT(contactos.dFechaNacimiento, '%d/%m/%Y') as 'dFechaNacimiento',
        contactos.sImagen as 'sImagen',
		grupos.sNombre as 'sNombreGrupoUsuario'        
        FROM
        	contactos
			LEFT JOIN grupos ON contactos.idGrupo = grupos.id
		";



	
IF(CONDITIONS_ != "")THEN
	SET @Conditions_ = CONCAT(" WHERE " , CONDITIONS_ );
	SET @SQL_ = CONCAT(@SQL_, " ", @Conditions_);
END IF;

IF(ORDER_ != "")THEN
	SET @Order_ = CONCAT(" ORDER BY " , ORDER_, " DESC" );
	SET @SQL_ = CONCAT(@SQL_, " ",@Order_);
END IF;


IF(OFFSET_ != "" AND NUM_ != "")THEN
	SET @Limit_ = CONCAT("LIMIT " , OFFSET_ , "," , NUM_);
	SET @SQL_ = CONCAT(@SQL_, " ",@Limit_);
END IF;

PREPARE stmt FROM @SQL_;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END //

CREATE PROCEDURE `usp_getGrupos`(IN CONDITIONS_ VARCHAR(255), IN ORDER_ TEXT, IN OFFSET_ VARCHAR(8), IN NUM_ VARCHAR(8))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

SET @SQL_ = "
		SELECT 
        grupos.id as 'id',
		grupos.sNombre as 'sNombre',
		grupos.sDescripcion as 'sDescripcion',
        grupos.sEstado
        FROM
        	grupos
		";
	
IF(CONDITIONS_ != "")THEN
	SET @Conditions_ = CONCAT(" WHERE " , CONDITIONS_ );
	SET @SQL_ = CONCAT(@SQL_, " ", @Conditions_);
END IF;

IF(ORDER_ != "")THEN
	SET @Order_ = CONCAT(" ORDER BY " , ORDER_, " DESC" );
	SET @SQL_ = CONCAT(@SQL_, " ",@Order_);
END IF;


IF(OFFSET_ != "" AND NUM_ != "")THEN
	SET @Limit_ = CONCAT("LIMIT " , OFFSET_ , "," , NUM_);
	SET @SQL_ = CONCAT(@SQL_, " ",@Limit_);
END IF;

PREPARE stmt FROM @SQL_;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END //

CREATE PROCEDURE `usp_getMails`(IN CONDITIONS_ VARCHAR(255), IN ORDER_ TEXT, IN OFFSET_ VARCHAR(8), IN NUM_ VARCHAR(8))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

SET @SQL_ = "
		SELECT 
        mails.id as 'id',
        mails.idEstadoMail as 'idEstadoMail',
        mails.idUnidadNegocio as 'idUnidadNegocio',
        mails.idUsuario as 'idUsuario',
        mails.idTipoMail as 'idTipoMail',
        mails.idGrupo as 'idGrupo',
        mails.sAsunto as 'sAsunto',
        mails.sRemitente as 'sRemitente',
        mails.sMensaje as 'sMensaje',
        mails.sObservacion as 'sObservacion',
        DATE_FORMAT(mails.dFechaEnvio, '%d/%m/%Y %h:%i:%s') as 'dFechaEnvio',
        DATE_FORMAT(mails.dFechaRegistro, '%d/%m/%Y %h:%i:%s') as 'dFechaRegistro',
        tiposmails.sNombre as 'sTipoMail'
        FROM
        	mails
        LEFT JOIN tiposmails ON mails.idTipoMail = tiposmails.id
		";

IF(CONDITIONS_ != "")THEN
	SET @Conditions_ = CONCAT(" WHERE " , CONDITIONS_ );
	SET @SQL_ = CONCAT(@SQL_, " ", @Conditions_);
END IF;

IF(ORDER_ != "")THEN
	SET @Order_ = CONCAT(" ORDER BY " , ORDER_, " DESC" );
	SET @SQL_ = CONCAT(@SQL_, " ",@Order_);
END IF;


IF(OFFSET_ != "" AND NUM_ != "")THEN
	SET @Limit_ = CONCAT("LIMIT " , OFFSET_ , "," , NUM_);
	SET @SQL_ = CONCAT(@SQL_, " ",@Limit_);
END IF;

PREPARE stmt FROM @SQL_;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END //

CREATE PROCEDURE `usp_getMensajes`(IN CONDITIONS_ VARCHAR(255), IN ORDER_ TEXT, IN OFFSET_ VARCHAR(8), IN NUM_ VARCHAR(8))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

SET @SQL_ = "
		SELECT 
        mensajes.id as 'id',
		mensajes.idContacto as 'idContacto',
		mensajes.idTipoMensaje as 'idTipoMensaje',
		mensajes.idUsuario as 'idUsuario',			
	    mensajes.idEstadoMensaje as 'idEstadoMensaje',
        mensajes.sRemitente as 'sRemitente',
        mensajes.sDestinatario as 'sDestinatario',
        mensajes.sMensaje as 'sMensaje',
        DATE_FORMAT(mensajes.dFechaRegistro, '%d/%m/%Y %h:%i:%s') as 'dFechaRegistro',
		mensajes.sObservacion as 'sObservacion',
        tiposmensajes.sNombre as 'sEstado',
        contactos.sApellido as 'sApellido',
        contactos.sNombre as 'sNombre'
        FROM
        	mensajes
			LEFT JOIN tiposmensajes ON mensajes.idTipoMensaje = tiposmensajes.id
            LEFT JOIN contactos ON mensajes.idContacto = contactos.id
		";



	
IF(CONDITIONS_ != "")THEN
	SET @Conditions_ = CONCAT(" WHERE " , CONDITIONS_ );
	SET @SQL_ = CONCAT(@SQL_, " ", @Conditions_);
END IF;

IF(ORDER_ != "")THEN
	SET @Order_ = CONCAT(" ORDER BY " , ORDER_, " DESC" );
	SET @SQL_ = CONCAT(@SQL_, " ",@Order_);
END IF;


IF(OFFSET_ != "" AND NUM_ != "")THEN
	SET @Limit_ = CONCAT("LIMIT " , OFFSET_ , "," , NUM_);
	SET @SQL_ = CONCAT(@SQL_, " ",@Limit_);
END IF;

PREPARE stmt FROM @SQL_;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END //

CREATE PROCEDURE `usp_getObject`()
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SELECT 
    	objetos.id as 'id',
        objetos.idTipoObjeto as 'idTipoObjeto',
        objetos.sNombre as 'sNombre',
        objetos.sCodigoObjeto as 'sCodigoObjeto',
        objetos.sUrl as 'sUrl',
        objetos.sClass as 'sClass',
        objetos.sImage as 'sImage',
        
        tiposobjetos.sNombre as 'sNombreTipoObjeto',
        tiposobjetos.sCodigoTipoObjeto as 'sCodigoTipoObjeto',		

        permisosobjetos.id as 'idPermisoObjeto',
        
		tipospermisos.id as 'idTipoPermiso',
		tipospermisos.sNombre as 'sNombreTipoPermiso',
		tipospermisos.sCodigoTipoPermiso as 'sCodigoTipoPermiso'
		
		
    FROM 
		permisosobjetos
    	LEFT JOIN objetos ON permisosobjetos.idObjeto = objetos.id
        LEFT JOIN tiposobjetos ON objetos.idTipoObjeto = tiposobjetos.id  
		LEFT JOIN tipospermisos ON permisosobjetos.idTipoPermiso = tipospermisos.id ;
   END //

CREATE PROCEDURE `usp_getPermitUser`(IN idUser_ INTEGER(11))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
            SELECT
                permisosobjetosusuarios.id as 'CODE',
                permisosobjetosusuarios.idPermisoObjeto as 'ID_PERMIT_OBJECT'
            FROM
                permisosobjetosusuarios
				LEFT JOIN permisosobjetos ON permisosobjetosusuarios.idPermisoObjeto = permisosobjetos.id                
            WHERE
                permisosobjetosusuarios.idUsuario = idUser_ 
            ORDER BY permisosobjetosusuarios.id ASC;
END //

CREATE DEFINER = 'root'@'localhost' PROCEDURE `usp_getSelect`(IN NombreTabla VARCHAR(100), IN idTabla VARCHAR(100), IN sValue VARCHAR(100), IN sCondition VARCHAR(255))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
DECLARE idTabla_,sValue_ VARCHAR(100);

SET AUTOCOMMIT=0;
START TRANSACTION;

SET idTabla_ = CONCAT(NombreTabla,".",idTabla);
SET sValue_ = CONCAT(NombreTabla,".",sValue);

SET @SQL_ = CONCAT("SELECT ", idTabla," as 'CODE',", sValue," as 'TEXT' FROM ", NombreTabla);	

IF(sCondition <> "")THEN
	SET @SQL_ = CONCAT(@SQL_, " WHERE ", sCondition);	
END IF;

PREPARE stmt FROM @SQL_;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;  

COMMIT;	

END //

CREATE PROCEDURE `usp_getTiposUsuarios`(IN Conditions_ VARCHAR(4096), IN Order_ VARCHAR(1024), IN Offset_ VARCHAR(8), IN Num_ VARCHAR(8))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
SET @SQL_ = "
            SELECT
                tiposusuarios.id as 'id',
				tiposusuarios.sNombre as 'sNombre',               
				tiposusuarios.sEstado as 'sEstado'
                FROM
                tiposusuarios
            ";
    
IF(Conditions_ != "")THEN
    SET @Conditions_ = CONCAT(" WHERE " , Conditions_ );
    SET @SQL_ = CONCAT(@SQL_, " ", @Conditions_);
END IF;

IF(Order_ != "")THEN
    SET @Order_ = CONCAT(" ORDER BY " , Order_, " DESC" );
    SET @SQL_ = CONCAT(@SQL_, " ",@Order_);
END IF;


IF(Offset_ != "" AND Num_ != "")THEN
    SET @Limit_ = CONCAT("LIMIT " , Offset_ , "," , Num_);
    SET @SQL_ = CONCAT(@SQL_, " ",@Limit_);
END IF;

PREPARE stmt FROM @SQL_;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END //

CREATE PROCEDURE `usp_getUnidadesNegocios`(IN CONDITIONS_ VARCHAR(255), IN ORDER_ TEXT, IN OFFSET_ VARCHAR(8), IN NUM_ VARCHAR(8))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

SET @SQL_ = "
		SELECT 
        unidadesnegocios.id as 'id',
		unidadesnegocios.sNombre as 'sNombre',
		unidadesnegocios.sMail as 'sMail'
        FROM
        	unidadesnegocios
		";
	
IF(CONDITIONS_ != "")THEN
	SET @Conditions_ = CONCAT(" WHERE " , CONDITIONS_ );
	SET @SQL_ = CONCAT(@SQL_, " ", @Conditions_);
END IF;

IF(ORDER_ != "")THEN
	SET @Order_ = CONCAT(" ORDER BY " , ORDER_, " DESC" );
	SET @SQL_ = CONCAT(@SQL_, " ",@Order_);
END IF;


IF(OFFSET_ != "" AND NUM_ != "")THEN
	SET @Limit_ = CONCAT("LIMIT " , OFFSET_ , "," , NUM_);
	SET @SQL_ = CONCAT(@SQL_, " ",@Limit_);
END IF;

PREPARE stmt FROM @SQL_;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END //

CREATE DEFINER = 'root'@'localhost' PROCEDURE `usp_getUsuarios`(IN CONDITIONS_ VARCHAR(255), IN ORDER_ TEXT, IN OFFSET_ VARCHAR(8), IN NUM_ VARCHAR(8))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

SET @SQL_ = "
		SELECT 
        usuarios.id as 'id',
		usuarios.idTipoUsuario as 'idTipoUsuario',
		usuarios.sLogin as 'sLogin',
		usuarios.sPassword as 'sPassword',			
	    usuarios.sNombre as 'sNombre',
        usuarios.sApellido as 'sApellido',
	    usuarios.sDireccion as 'sDireccion',
		usuarios.sMail as 'sMail',
        usuarios.sTelefono as 'sTelefono',
		usuarios.sMovil as 'sMovil',
	    usuarios.sEstado as 'sEstado',
		tiposusuarios.sNombre as 'sNombreTipoUsuario'
        FROM
        	usuarios
			LEFT JOIN tiposusuarios ON usuarios.idTipoUsuario = tiposusuarios.id
		";



	
IF(CONDITIONS_ != "")THEN
	SET @Conditions_ = CONCAT(" WHERE " , CONDITIONS_ );
	SET @SQL_ = CONCAT(@SQL_, " ", @Conditions_);
END IF;

IF(ORDER_ != "")THEN
	SET @Order_ = CONCAT(" ORDER BY " , ORDER_, " DESC" );
	SET @SQL_ = CONCAT(@SQL_, " ",@Order_);
END IF;


IF(OFFSET_ != "" AND NUM_ != "")THEN
	SET @Limit_ = CONCAT("LIMIT " , OFFSET_ , "," , NUM_);
	SET @SQL_ = CONCAT(@SQL_, " ",@Limit_);
END IF;

PREPARE stmt FROM @SQL_;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END //

CREATE PROCEDURE `usp_InsertAuditoria`(IN idUsuario_ INTEGER(11), IN idTransaccion_ INTEGER(11), IN sDetalle_ VARCHAR(4096))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SET AUTOCOMMIT=0;
	START TRANSACTION;	
    
	INSERT INTO auditorias(idUsuario,idTipoAuditoria,dFecha,sDetalle) VALUES(idUsuario_,idTransaccion_,NOW(),sDetalle_);
    
    COMMIT;
END //

CREATE PROCEDURE `usp_InsertTable`(IN Table_ VARCHAR(255), IN Set_ VARCHAR(1000), IN Values_ VARCHAR(500), IN idUsuario_ INTEGER(11), IN idTransaccion_ INTEGER(11), IN sDetalle_ VARCHAR(4096))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
DECLARE LastId INT(11);

SET AUTOCOMMIT=0;
START TRANSACTION;

SET @SQL_ = CONCAT("INSERT INTO ", Table_,"(",Set_,") VALUES(",Values_,")");

PREPARE stmt FROM @SQL_;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET LastId = LAST_INSERT_ID();

CALL usp_InsertAuditoria(idUsuario_,idTransaccion_,sDetalle_);

SELECT LastId;

COMMIT;

END //

CREATE PROCEDURE `usp_UpdateTable`(IN Table_ VARCHAR(255), IN Set_ VARCHAR(5000), IN Conditions_ VARCHAR(255), IN idUsuario_ INTEGER(11), IN idTransaccion_ INTEGER(11), IN sDetalle_ VARCHAR(4096))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

SET AUTOCOMMIT=0;
START TRANSACTION;

SET @SQL_ = CONCAT("UPDATE ", Table_, " SET ", Set_);

IF(Conditions_ <> "")THEN
	SET @Conditions_ = CONCAT(" WHERE " , Conditions_ );
    SET @SQL_ = CONCAT(@SQL_ , @Conditions_);
END IF;
      
    PREPARE stmt FROM @SQL_;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;  

CALL usp_InsertAuditoria(idUsuario_,idTransaccion_,sDetalle_);

COMMIT;
END //
delimiter ;
