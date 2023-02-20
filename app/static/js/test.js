fetch('http://127.0.0.1:5001/api/v1/categories')
  .then(response => response.json())
  .then(categoriesData => {
    // Obtener el contenedor de los checkboxes
    const checkboxContainer = document.getElementById('checkbox-container');

    // Seleccionar una cantidad específica de palabras para cada categoría
    const numWordsPerCategory = 3;
    const selectedWords = [];

    // Obtener las palabras para cada categoría
    categoriesData.forEach(category => {
      fetch(`http://127.0.0.1:5001/api/v1/categories/${category.id}/words`)
      .then(response => response.json())
      .then(wordsData => {
        // Obtener el contenedor de los checkboxes
        const checkboxContainer = document.getElementById('checkbox-container');
    
        // Construir los checkboxes
        wordsData.forEach(words => {
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
  });

});
