let form = document.getElementById('addForm');
let itemList = document.getElementById('items');
let filter = document.getElementById('filter');

// Evento de envío de formulario
form.addEventListener('submit', addItem);
// Eliminar evento
itemList.addEventListener('click', removeItem);
// Filtrar evento


// Agregar Item
function addItem(e){
  e.preventDefault();

  // Obtener valor de entrada
  let newItem = document.getElementById('item').value;

  // Crear nuevo elemento li
  let li = document.createElement('li');
  // Agregar Clase
  li.className = 'list-group-item';
  // Agregar nodo de texto con valor de entrada
  li.appendChild(document.createTextNode(newItem));

  // Crear el botón eliminar
  let deleteBtn = document.createElement('button');

  // Agregar la clase del botón eliminar
  deleteBtn.className = 'btn btn-dark btn-sm float-right delete';

  // Añadir nodo de texto
  deleteBtn.appendChild(document.createTextNode('Eliminar'));

  // Agregar botón a li
  li.appendChild(deleteBtn);

  // Agregar li a la lista
  itemList.appendChild(li);
}

// Eliminar Item
function removeItem(e){
  if(e.target.classList.contains('delete')){
    if(confirm('Estás segur@?')){
      let li = e.target.parentElement;
      itemList.removeChild(li);
    }
  }
}

// Filtrar Item
function filterItems(e){
  // convertir texto a minúsculas
  let text = e.target.value.toLowerCase();
  // Obtener lista
  let items = itemList.getElementsByTagName('li');
  // Convertir a Array
  Array.from(items).forEach(function(item){
    let itemName = item.firstChild.textContent;
    if(itemName.toLowerCase().indexOf(text) != -1){
      item.style.display = 'block';
    } else {
      item.style.display = 'none';
    }
  });
}