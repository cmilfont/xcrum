/**
 * @namespace Ext.ux.data
 * @version 0.1
 * @since 0.1
 * @author Christiano Milfont
 *
 * Assegurar que o Namespace para extensão será reconhecido
 */
Ext.namespace("Ext.ux.grid");

Ext.ux.grid.XcrumGrid = Ext.extend(Ext.grid.GridPanel, {
    border:true,
	sm: new Ext.grid.RowSelectionModel({singleSelect:true}),
    frame:true,iconCls:'icon-grid',
	autoShow:true, width:750,height:250,
    initComponent:function() {

		var store = new Ext.data.Store({
			url:this.initialConfig.url,
			reader:new Ext.data.JsonReader()
    	});

		var columns = this.initialConfig.columns;

       Ext.apply(this, {
			renderTo:this.initialConfig.grid_id,
            store:store
           ,columns:columns
           ,viewConfig:{forceFit:true}
           ,bbar: new Ext.PagingToolbar({
                pageSize:5,store:store,displayInfo: true,
                displayMsg: 'Exibindo o resultado: {0} a {1} de {2} registros',
                emptyMsg: "Sem resultados a exibir",
                items: ['-', {
                    pressed: true,enableToggle: true,text: 'Cadastrar',cls: 'x-btn-text-icon details',toggleHandler: function(){}
                },{
                    pressed: true,enableToggle: true,text: 'Alterar',cls: 'x-btn-text-icon details',toggleHandler: function(){}
                }, {
                    pressed: true,enableToggle: true,text: 'Excluir',cls: 'x-btn-text-icon details',toggleHandler: function(){}
                }]
            })
       });
       Ext.ux.grid.XcrumGrid.superclass.initComponent.apply(this, arguments);

   } // eo function initComponent
   ,onRender:function() {
		this.store.load({params: {start: 0, limit: 5, page:1} });
		Ext.ux.grid.XcrumGrid.superclass.onRender.apply(this, arguments);
   } // eo function onRender
 });
 Ext.reg('xcrumgrid', Ext.ux.grid.XcrumGrid);

