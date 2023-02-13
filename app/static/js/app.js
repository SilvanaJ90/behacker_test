let app = {
  backend: 'http://0.0.0.0:5001/api/v1',
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
      ajax : {
        url : app.backend + '/categories',
        dataSrc : function(json) {
          return json;
        }
      },
      dom: 'Bfrtip',
      columns : [
        {data : "id"},
        {data : "name"},
        {data : "file_name"}
      ],
      buttons: [
        {
          text : 'Crear',
          action : function(e, dt, node, config) {
            app.cleanForm();
              $('#categoriaModal').modal();
          }
        },
        {
          text : '<i class="fa-regular fa-trash-can mg-left-right"></i>',
          action : function(e, dt, node, config) {
            let data = dt.rows('.table-active').data()[0];
              if (confirm('Esta seguro que desea eliminar la categoría')) {
                app.delete(data.id)
              }
          }
        },
        {
          text : '<i class="fa-solid fa-align-justify mg-left-right"></i>',
          action : function(e, dt, node, config) {
            $('#categoriaModal').modal();
          }
        },
        {
          text : '<i class="fa-sharp fa-solid fa-pencil mg-left-right" ></i>',
          action : function(e, dt, node, config) {
            var data = dt.rows('.table-active').data()[0];
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
        $("#msg").text('Se guardó la categoría correctamente');
        $("#msg").show();
        $('#categoriaModal').modal('hide');
        app.table.ajax.reload();
      },
      error : function(error) {
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
        $("#msg").text('Se eliminó  la categoría correctamente');
        $("#msg").show();
        app.table.ajax.reload();
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