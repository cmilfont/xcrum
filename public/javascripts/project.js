Ext.override(Ext.PagingToolbar, {
    doLoad : function(start){
        var o = {}, pn = this.paramNames;
        o[pn.start] = start;
        o[pn.limit] = this.pageSize;
        o['page'] = Math.ceil((start+this.pageSize)/this.pageSize);
        if(this.fireEvent('beforechange', this, o) !== false){
            this.store.load({params:o});
        }
    }
});

var Project = function() {

    Ext.Ajax.method = 'GET';

    var grid_id = "project_grid";
    var store = new Ext.data.Store({
                url: 'projects.json',
                reader: new Ext.data.JsonReader({
                    totalProperty:'total',
                    root:'results',id:'id'
                }, Ext.data.Record.create([
                    {name:'id', mapping:'id'},
                    {name:'name', mapping:'name'},
                    {name:'created_at', mapping:'created_at'},
                    {name:'updated_at', mapping:'updated_at'}
                ]))
            });
    var grid;

    var cadastrar = function() {
        Ext.Ajax.request({
                url:'projects.json',
                jsonData:{
                    project:{
                        name:'Milfont test',
                        items_attributes:[{id:1,description:'teste'}],
                        items:[{id:1,description:'teste'}]
                    }
                },
                method:'POST',
                callback: function(options, success, response) {
                    if(success) {
                        store.reload();
                    }
                }
        });
    };

    var excluir = function() {
        try {
            var id = grid.getSelectionModel().getSelected().get('id');
            Ext.Ajax.request({
                url:'projects/'+id+'.json',
                method:'DELETE',
                callback: function(options, success, response) {
                    if(success) {
                        store.reload();
                    }
                }
            });
        } catch(e) {
            //console.log (e.message);
            Ext.Msg.show({
                icon: Ext.MessageBox.WARNING,
                title:'Atenção',
                msg:'Selecione um registro para exclusão!'
            });
        }
    };

    return {
      init: function() {
        grid = new Ext.grid.GridPanel({
            renderTo:grid_id, autoShow:true,
            store: store,
            columns: [
                {id:'id', header: "id", width: 200, sortable: true, dataIndex: 'id'},
                {header: "Nome", width: 120, sortable: true, dataIndex: 'name'},
                {header: "Criado em", width: 135, sortable: true, renderer: function(value){
                    return Date.parseDate(value, 'Y-m-d\\TH:i:s\\Z').format('d/m/Y H:i:s');
                    //2009-06-14T12:51:07Z
                }, dataIndex: 'created_at'},
                {header: "Última atualização", width: 135, sortable: true, renderer: function(value){
                    return Date.parseDate(value, 'Y-m-d\\TH:i:s\\Z').format('d/m/Y H:i:s');
                    //2009-06-14T12:51:07Z
                }, dataIndex: 'updated_at'}
            ],
            viewConfig: {forceFit: true},
            sm: new Ext.grid.RowSelectionModel({singleSelect:true}),
            width:600,height:300,frame:true,title:'Projects',iconCls:'icon-grid',
            bbar: new Ext.PagingToolbar({
                pageSize:5,store:store,displayInfo: true,
                displayMsg: 'Exibindo o resultado: {0} a {1} de {2} registros',
                emptyMsg: "Sem resultados a exibir",
                items: ['-', {
                    pressed: true,enableToggle: true,text: 'Cadastrar',cls: 'x-btn-text-icon details',toggleHandler: cadastrar
                },{
                    pressed: true,enableToggle: true,text: 'Alterar',cls: 'x-btn-text-icon details',toggleHandler: function(){}
                }, {
                    pressed: true,enableToggle: true,text: 'Excluir',cls: 'x-btn-text-icon details',toggleHandler: excluir
                }]
            })
        });
        store.load({params: {start: 0, limit: 5, page:1} });
      }
    };

}();
Ext.onReady(Project.init);