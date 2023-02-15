let app1 = {
    backend: 'http://127.0.0.1:5001/api/v1/categories/',
    table : null,
    init: function() {
        app1.initDatatable('#categoria-palabras');

        $("#save").click(function(){
            app1.save({
                id : $("#id").val(),
                name_word : $('#name').val(),

            });
        });
    },
    initDatatable : function(id) {
        app1.table = $(id).DataTable({
            ajax : {
                url : app1.backend +  id +'/words',
                dataSrc : function(json) {
                    return json;
                }
            },
            dom: 'Bfrtip',
            columns : [
                {data : "id"},
                {data : "name"}
            ],
            buttons: [
                {
                    text : '<i class="fa-solid fa-plus"></i>',
                    action : function(e, dt, node, config) {
                        app1.cleanForm();
                        $('#palabrasModal').modal();
                    }
                },
                {
                    text : '<i class="fa-solid fa-trash-can"></i>',
                    action : function(e, dt, node, config) {
                        let data = dt.rows('.table-active').data()[0];
                        if (confirm('Esta seguro que desea eliminar la categoría')) {
                            app1.delete(data.id)
                        }
                    }
                },
                {
                    text : '<i class="fa-solid fa-pencil"></i>',
                    action : function(e, dt, node, config) {
                        var data = dt.rows('.table-active').data()[0];
                        app1.setDataToModal(data);
                        $('#palabrasModal').modal();
                    }
                }
            ]
        });

        $('#categoria-palabras tbody').on('click', 'tr', function(){
            if ($(this).hasClass('table-active')) {
                $(this).removeClass('table-active');
            } else {
                app1.table.$('tr.table-active').removeClass('table-active');
                $(this).addClass('table-active');
            }
        });
    },
    setDataToModal : function(data) {
        $('#id').val(data.id);
        $('#name_word').val(data.name);

    },
    cleanForm: function(){
        $('#id').val('');
        $('#name_word').val('');
    },
    save : function(data) {
        $.ajax({
            url: app1.backend + '/categories/1a98c509-b176-49d9-b39c-93c9161c67fa/words',
            data : JSON.stringify(data),
            method: 'POST',
            dataType : 'json',
            contentType: "app1lication/json; charset=utf-8",
            success : function(json) {
                $("#msg").text('Se guardó la categoría correctamente');
                $("#msg").show();
                $('#palabrasModal').modal('hide');
                app1.table.ajax.reload();
            },
            error : function(error) {
                $("#msg").text(error.error);
                $("#msg").show();

            }
        })
    },
    delete : function(id) {
        $.ajax({
            url: app1.backend + '/words/'+ id,
            method: 'DELETE',
            dataType : 'json',
            contentType: "app1lication/json; charset=utf-8",
            success : function(json) {
                $("#msg").text('Se eliminó  la categoría correctamente');
                $("#msg").show();
                app1.table.ajax.reload();
            },
            error : function(error) {
                $("#msg").text(error.error);
                $("#msg").show();

            }
        })
    }
};

$(document).ready(function(){
    app1.init();
});