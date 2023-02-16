let app = {
    backend: 'http://127.0.0.1:5001/api/v1',
    table : null,
    init: function() {
        app.initDatatable('#categoria');

        $("#save").click(function(){
            app.save({
                name : $('#name').val(),
                description: $('#description').val(),
                file_name: $('#file_name').val()
            });
        });
    },
    initDatatable : function(id) {
        app.table = $(id).DataTable({
            language: {
                "decimal": "",
                "emptyTable": "No hay información",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Mostrar _MENU_ Entradas",
                "loadingRecords": "Cargando...",
                "processing": "Procesando...",
                "search": "Buscar:",
                "zeroRecords": "Sin resultados encontrados",
                "paginate": {
                    "first": "Primero",
                    "last": "Ultimo",
                    "next": "Siguiente",
                    "previous": "Anterior"
                }
            },
            ajax : {
                url : app.backend + '/categories/',
                dataSrc : function(json) {
                    return json;
                }
            },
            dom: 'Bfrtip',
            columns: [                     
                {
                    data : null, "render": function (data, type, full, meta) {
                        return meta.row + 1;
                    }
                },
                {data : 'name'},
                {data : 'file_name'}
            ],
            buttons: [
                {
                    text : '<i class="fa-solid fa-plus"></i>',
                    action : function(e, dt, node, config) {
                        app.cleanForm();
                        $('#categoriaModal').modal();
                    }
                },
                {
                    text : '<i class="fa-solid fa-align-justify"></i>',
                    action : function(e, dt, node, config) {
                        let data = dt.rows('.table-active').data()[0];
                        app.setDataToModal(data);
                        app.load_words(data.id);
                    }
                },
                {
                    text : '<i class="fa-solid fa-trash-can"></i>',
                    action : function(e, dt, node, config) {
                        let data = dt.rows('.table-active').data()[0];
                        swal({
                            title: "¿Estás seguro de que deseas eliminar la categoría?",
                            text: "",
                            icon: "warning",
                            buttons: true,
                            dangerMode: true,
                            position: 'center',
                          })
                          .then((willDelete) => {
                            if (willDelete) {
                              swal('Eliminado exitosamente', '', 'success')
                              app.delete(data.id)
                            }
                          });
                    }
                },

                {
                    text : '<i class="fa-solid fa-pencil"></i>',
                    action : function(e, dt, node, config) {
                        let data = dt.rows('.table-active').data()[0];
                        app.setDataToModal(data);
                        $('#categoriaModal').modal();
                    }
                }
            ]
        });

        $('#categoria tbody').on('click', 'tr', function(){
            if ($(this).hasClass('table-active')) {
                $(this).removeClass('table-active');
            } else {
                app.table.$('tr.table-active').removeClass('table-active');
                $(this).addClass('table-active');
            }
        });
    },
    setDataToModal : function(data) {

        $('#name').val(data.name);
        $('#description').val(data.description);
        $('#file_name').val(data.file_name);
    },
    cleanForm: function(){
        $('#name').val('');
        $('#description').val('');
        $('#file_name').val('');
    },
    save : function(data) {
        $.ajax({
            url: app.backend + '/categories',
            data : JSON.stringify(data),
            method: 'POST',
            dataType : 'json',
            contentType: "application/json; charset=utf-8",
            success : function(json) {
                $("#msg").css("color", "#000");
                $("#msg").css("background-color", "#97fcb0");
                $("#msg").css("border", "#000 solid 1px");
                $("#msg").text('Se guardó la categoría correctamente');
                $("#msg").show();
                $('#categoriaModal').modal('hide');
                app.table.ajax.reload();
            },
            error : function(error) {
                $("#msg").css("color", "#000");
                $("#msg").css("background-color", "#fc97a4");
                $("#msg").css("border", "#000 solid 1px");
                $("#msg").text(error.error);
                $("#msg").show();

            }
        })
    },
    delete : function(id) {
        $.ajax({
            url: app.backend + '/categories/'+id,
            method: 'DELETE',
            dataType : 'json',
            contentType: "application/json; charset=utf-8",
            success : function(json) {
                $("#msg").css("color", "#000");
                $("#msg").css("background-color", "#97fcb0");
                $("#msg").css("border", "#000 solid 1px");
                $("#msg").text('Se eliminó  la categoría correctamente');
                $("#msg").show();
                app.table.ajax.reload();
            },
            error : function(error) {
                $("#msg").css("color", "#000");
                $("#msg").css("background-color", "#fc97a4");
                $("#msg").css("border", "#000 solid 1px");
                $("#msg").text(error.error);
                $("#msg").show();

            }
        })
    },
        load_words : function(id) {
        $.ajax({
            url: app.backend + '/categories/'+id+ '/words',
            method: 'GET',
            dataType : 'json',
            contentType: "application/json; charset=utf-8",
            success : function(data) {
                $('#categoria').empty();
                $.each(data, function (i, item) {
                    let rows = "<tr>" +
                        "<td>" + item.category_id + "</td>" +
                        "<td>" + item.id + "</td>" +
                        "<td>" + item.name + "</td>" +
                        "</tr>";
                    $('#categoria').append(rows);
                });
                console.log(data);
              
            },
            error : function(error) {
                $("#msg").text(error.error);
                $("#msg").show();

            }
        })
    }
};

$(document).ready(function(){
    app.init();
});

