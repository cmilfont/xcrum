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

    var grid_id = "project_grid";

    return {
      init: function() {
		console.log("teste " + grid_id);
        grid = new Ext.ux.grid.XcrumGrid({
			title:'Projects',
			url: 'projects.json',
            grid_id: grid_id,
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
            ]
        });
      }
    };

}();

