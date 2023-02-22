// Función que maneja el botón
function handleButton() {
  // Obtener el contenedor de los checkboxes
  const checkboxContainer = document.getElementById('checkbox-container');
  const wordsToShow = categories.length * 3; // Número de palabras a mostrar en los checkboxes

  // Crear una lista de todas las palabras
  let allWords = [];
  categories.forEach(category => {
    fetch(`http://127.0.0.1:5001/api/v1/categories/${category.id}/words`)
      .then(response => response.json())
      .then(words => {
        allWords = allWords.concat(words);
      });
  });

  // Seleccionar palabras aleatorias
  setTimeout(() => {
    const selectedWords = selectRandomWords(allWords, wordsToShow);

    // Construir los checkboxes
    selectedWords.forEach(word => {
      const checkbox = document.createElement('input');
      checkbox.type = 'checkbox';
      checkbox.id = word.id;

      const label = document.createElement('label');
      label.htmlFor = word.id;
      label.className = 'label-test';
      label.appendChild(document.createTextNode(word.name));

      // Agregar el checkbox y la etiqueta al contenedor
      checkboxContainer.appendChild(checkbox);
      checkboxContainer.appendChild(label);
    });
  }, 500);
}

// Función que maneja las tres iteraciones y la alerta final
function runTest() {
  for (let i = 0; i < 3; i++) {
    handleButton();
  }
  alert('Finalizó el test');
}

// Agregar un evento click al botón
const button = document.getElementById('test-button');
button.addEventListener('click', runTest);
