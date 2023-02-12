({
	doInit : function(component, event, helper) 
	{
		var fieldName = component.get("v.fieldName");
		var record = component.get("v.record");
		var value = record[fieldName] ? record[fieldName] : '';
		
		if( component.get("v.fieldValue") == 'View' )
		{
			component.set("v.parentId",value);
			component.set( "v.fieldType",'REFERENCE' );
			return;
		}
		
		var fieldType = '';
		var fieldTypeMap = component.get("v.fieldsMap");
		var fldsInfo = fieldTypeMap[fieldName];
		if( fldsInfo )
		{
			fldsInfo = fldsInfo.split('--');
			fieldType = fldsInfo[1];
			if( fldsInfo.length > 1 )
			{
				component.set( "v.fieldType",fieldType );
			}
		}
		
		if( fieldName.indexOf('.') > 1 )
		{
			var flds = fieldName.split('.');
			value = record[flds[0]][flds[1]];
		}
		else if( fieldType == 'REFERENCE' )
		{
			component.set("v.parentId",record[fieldName]);
			if( fieldName.indexOf('__c') > 1 )
			{
				fieldName = fieldName.replace('__c','__r');
			}
			else
			{
				fieldName = fieldName.substring(0, fieldName.length-2);
			}
			value = record[fieldName]['Name'];
		}
		component.set("v.fieldValue",value);
	} 
})