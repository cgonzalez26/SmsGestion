function getElementById( object ) {
	
	if(typeof object == 'string') return document.getElementById(object);
	else return object;
	
}



function isArray( testObject ) {
    
	return testObject != null && testObject && typeof testObject === 'object' && testObject.constructor && testObject.constructor == Array;
}




//----------------------------------------------------------


function getNodes( object )  {
	
	var nodes = new Array();
	var i;	
	
	object = getElementById( object );
	
	for(i=0; i < object.childNodes.length; i++)
	
		if( object.childNodes[i].tagName ) 
		
			nodes.push(object.childNodes[i]);
			
	return nodes;
}


function getNodePosition( object, node ) {
	
	try {	
		
		object = getElementById(object);
		node = getElementById(node);

		var nodes = getNodes( object );
			
		return nodes.indexOf(node);
		
	} catch(e) { return -1; }
}


//------------------------------------------------

function isLastNode( object, node ) {
	
	try {	
		
		object = getElementById(object);
		node = getElementById(node);

		var nodes = getNodes( object );
		var index = nodes.indexOf(node);
		
		return index == nodes.length - 1;
		
	} catch(e) { return false; }

}


function isFirstNode(object, node) {
	
	try {	
		
		object = getElementById(object);
		node = getElementById(node);

		var nodes = getNodes( object );
		var index = nodes.indexOf(node);
		
		return index == 0;
		
	} catch(e) { return false; }
}


function getLastNode( object ) {
	
	var nodes = getNodes(object);
	
	if(nodes.length > 0) return nodes[ nodes.length - 1 ];
	else return null;
	
}


function getFirstNode( object ) {
	
	var nodes = getNodes(object);
	
	if(nodes.length > 0) return nodes[ 0 ];
	else return null;
}



function getNodeByPosition( object, nodeIndex ) {
	
	var nodes = getNodes(object);
	
	if(nodeIndex < nodes.length && nodeIndex >= 0) return nodes[ nodeIndex ];
	else return null;
}

function getNodesByPosition( object, nodesIndexs ) {
		
	if(nodesIndexs == null) return [];
	if(!isArray(nodesIndexs)) nodesIndexs = [nodesIndexs];
	
	object = getElementById(object);
	
	var originalNodes = getNodes(object);
	var nodes = new Array();
	var i;
	var index;
	
	for(i=0; i < nodesIndexs.length; i++) {
		
		index = nodesIndexs[i];
		
		if(index < originalNodes.length && index >= 0) nodes.push( originalNodes[index] );
	}
	
	return nodes;
}



function getNodesByRange( object, firstPosition, length ) {
		
	object = getElementById(object);
	var nodes = getNodes( object );
	
	if(firstPosition == null || firstPosition >= nodes.length) return [];
	
	if(length == null) length = nodes.length - firstPosition;
		
	
	var indexs = new Array();
	var lastPosition = firstPosition + length;
	
	var i;
	
	
	for(i=firstPosition; i < lastPosition; i++ )
		indexs.push(i);
		
	return getNodesByPosition( object, indexs );
		
}



//-------------------------------------------------------------------------------


function insertNodes( object, nodes, position ) {
	
	if(nodes == null) return;
	if(!isArray(nodes)) nodes = [nodes];
	
	object = getElementById(object);
		
	var originalNodes = getNodes(object);
		
	if(position == null || !(position >= 0 && position < originalNodes.length))
		position = originalNodes.length;
		
	var afterNodes = getNodesByRange(object, position);
	removeNodes(object, afterNodes);
	
	var i;
	var node;
	
	for(i=0; i < nodes.length; i++) {
	
		try {
					
			if(object.tagName && object.tagName == 'SELECT' && nodes[i].tagName && nodes[i].tagName == 'OPTION') object.options[ object.length ] = nodes[i];
			else if(typeof nodes[i] == 'object') object.appendChild( nodes[i] );
			else if(typeof nodes[i] == 'string') object.innerHTML += nodes[i];
						
		} catch(e) {}
	
	}	
		
	for(i=0; i < afterNodes.length; i++)
		object.appendChild( afterNodes[i] );
}


function insertNodesAfter(object, nodes) {
	
	object = getElementById(object);
	
	var parent = object.parentNode;
	var position = getNodePosition( parent, object );
	
	insertNodes( parent, nodes, position + 1 );
	
}



function insertNodesBefore(object, nodes) {
	
	object = getElementById(object);
	
	var parent = object.parentNode;
	var position = getNodePosition( parent, object );
	
	insertNodes( parent, nodes, position );
	
}




function setNodes(object, nodes) {
	
	removeNodes(object);
	insertNodes(object, nodes);
}



//-------------------------------------------------


function removeNodes( object, nodes ) { 
		
	object = getElementById(object);
	
	if(nodes == null) nodes = getNodes(object);
	else if( !isArray(nodes) ) nodes = [nodes];
	
	var i;
	
	for(i=0; i < nodes.length; i++) 

		try { object.removeChild(nodes[i]); } 
		catch(e) {}
}



function removeNodesByPosition( object, positions ) {
	
	var nodes = getNodesByPosition( object, positions );
	removeNodes(object, nodes);
}




function removeNodesByRange( object, firstPosition, length ) {
	
	var nodes = getNodesByRange( object, firstPosition, length );
	removeNodes(object, nodes);
	
}

