fetch('http://127.0.0.1:5001/api/v1/categories')
  .then(response => response.json())
  .then(categories => {
    // Obtener el contenedor de los checkboxes
    const checkboxContainer = document.getElementById('checkbox-container');
    const wordsToShow = categories.length * 3; // Número de palabras a mostrar en los checkboxes

    // Crear una lista de todas las palabras
    let allWords = [];
    const promises = categories.map(category => {
      return fetch(`http://127.0.0.1:5001/api/v1/categories/${category.id}/words`)
        .then(response => response.json())
    });
    Promise.all(promises).then(values => {
      allWords = values.flat();
      // Seleccionar palabras aleatorias
      const selectedWords = selectRandomWords(allWords, wordsToShow);

      // Obtener el ID de la categoría desde la URL
      const categoryId = checkboxContainer.dataset.categoryId;

      // Construir los checkboxes
      selectedWords.forEach(word => {
        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.id = word.id;

        const label = document.createElement('label');
        label.htmlFor = word.id;
        label.className = 'label-test';
        label.dataset.categoryId = categoryId;
        label.appendChild(document.createTextNode(word.name));

        // Agregar el checkbox y la etiqueta al contenedor
        checkboxContainer.appendChild(checkbox);
        checkboxContainer.appendChild(label);
      });
    });
  });

// Función para mezclar un array y seleccionar n elementos aleatorios sin repetir
function selectRandomWords(array, n) {
  const shuffled = shuffleArray(array);
  const selected = shuffled.slice(0, n);
  return Array.from(new Set(selected));
}

// Función para mezclar un array
function shuffleArray(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
}

// Obtener el formulario
const form = document.querySelector('.formulario');

// Escuchar el evento "submit" del formulario
form.addEventListener('submit', (event) => {
  // Cancelar la acción predeterminada del formulario
  event.preventDefault();

  // Obtener los elementos checkbox seleccionados
  const checkboxes = document.querySelectorAll('input[type=checkbox]:checked');

  // Almacenar las palabras seleccionadas en un array
  const selectedWords = Array.from(checkboxes).map(checkbox => {
    return {
      id: checkbox.id,
      categoryId: checkbox.nextElementSibling.dataset.categoryId,
      name: checkbox.nextElementSibling.textContent
    };
  });

  // Procesar las palabras seleccionadas (por ejemplo, enviarlas al servidor)
  console.log(selectedWords);
});