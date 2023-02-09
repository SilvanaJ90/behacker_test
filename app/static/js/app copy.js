const d = document,
  $table = d.querySelector(".crud-table"),
  $form = d.querySelector(".crud-form"),
  $title = d.querySelector(".crud-title"),
  $template = d.getElementById("crud-template").content,
  $fragment = d.createDocumentFragment();
const ajax =(options)=> {
  let {url, method, success, error, data} = options;
  const xhr = new XMLHttpRequest();
  xhr.addEventListener("readystatechange", e=>{
    if(xhr.readyState !== 4)return;

    if(xhr.status >= 200 && xhr.status < 300){
    let json = JSON.parse(xhr.responseText);
      success(json);
    }else{
      let message = xhr.statusText || "Ocurrio un error";
      error('Error ${xhr.status}:${message}');
    }
  });
  xhr.open(method || "GET", url);
  xhr.setRequestHeader("content-Type","application/json;charset=utf-8");
  xhr.send(JSON.stringify(data));
}
const getAll =()=> {
  ajax({
    method: "GET",
    url: "http://0.0.0.0:5001/api/v1/categories",
    success: (res) => {
      console.log(res);
      res.forEach(el => {
        $template.querySelector(".name").textContent = el.name;
        $template.querySelector(".edit").dataset.id = el.id;
        $template.querySelector(".edit").dataset.name = el.name;
        $template.querySelector(".edit").dataset.description = el.description;
        $template.querySelector(".edit").dataset.file_name = el.file_name;
        $template.querySelector(".delete").dataset.id = el.id;
        let $clone = d.importNode($template, true);
        $fragment.appendChild($clone);
      });
      $table.querySelector("tbody").appendChild($fragment);
    },
    error:(err) => {
      console.log(err);
      $table.insertAdjacentHTML("afterend",'<p><b>${err}</b></p>');
    }
  })
}
d.addEventListener("DOMContentLoaded", getAll);

d.addEventListener("submit", e => {
  if(e.target === $form){
    e.preventDefault();
    if(!e.target.id.value){
      // create POST
      ajax({
        url: "http://0.0.0.0:5001/api/v1/categories",
        method: "POST",
        success:(res)=>location.reload(),
        error: () => $form.insertAdjacentHTML("afterend", '<p><b>${err}</b</p>'),
        data: {
          name:e.target.name.value,
          description:e.target.description.value,
          file_name:e.target.file_name.value
        }
      });
    }else{
        //UPDATE PUT
      ajax({
        url: `http://0.0.0.0:5001/api/v1/categories/${e.target.id.value}`,
        method: "PUT",
        success: (res)=>location.reload(),
        error: () => $form.insertAdjacentHTML("afterend", '<p><b>${err}</b</p>'),
        data: {
          name: e.target.name.value
        }
      });
    }
  }
});

d.addEventListener("click", e=> {
  if(e.target.matches(".edit")){
    $title.textContent = "Editar Categoria";
    $form.name.value = e.target.dataset.name;
    $form.id.value = e.target.dataset.id;
  }
  if(e.target.matches(".delete")){
    let isDelete = confirm(`¿Esta seguro de eliminar el id${e.target.dataset.id}?`);
    if(isDelete){
    //Delete
      ajax({
        url: `http://0.0.0.0:5001/api/v1/categories/${e.target.dataset.id}`,
        method: "DELETE",
        success: (res) => location.reload(),
        error: () => alert(err)
      });
    }
  }
})
  
