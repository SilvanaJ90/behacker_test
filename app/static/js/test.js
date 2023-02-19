fetch('http://127.0.0.1:5001/api/v1/categories/16222f5a-2979-4fe5-8532-9d410095a093/words')
.then(response => response.json())
.then(data => {
  // Obtener el contenedor de los checkboxes
  const checkboxContainer = document.getElementById('checkbox-container');

  // Construir los checkboxes
  data.forEach(words => {
    const checkbox = document.createElement('input');
    checkbox.type = 'checkbox';
    checkbox.name = 'name_categorie';
    checkbox.id = words.id;

    const label = document.createElement('label');
    label.htmlFor = words.id;
    label.className = 'label-test';
    label.appendChild(document.createTextNode(words.name));

    // Agregar el checkbox y la etiqueta al contenedor
    checkboxContainer.appendChild(checkbox);
    checkboxContainer.appendChild(label);
  });
});