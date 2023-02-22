fetch('http://127.0.0.1:5001/api/v1/categories')
  .then(response => response.json())
  .then(categories => {
    // Obtener el contenedor de los checkboxes
    const checkboxContainer = document.getElementById('checkbox-container');
    const wordsToShow = categories.length * 5; // Número de palabras a mostrar en los checkboxes

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

  // Seleccionar el botón de "Continuar"
  const continueButton = document.getElementById('continue-button');

  // Agregar un event listener al botón
  continueButton.addEventListener('click', (event) => {
    // Prevenir el comportamiento por defecto del botón
    event.preventDefault();

    // Ocultar el contenedor de los checkboxes
    checkboxContainer.style.display = 'none';

    // Mostrar una alerta con el mensaje que quieras
    // alert('¡Gracias por completar el test!, tienes un perfil de personalidad dominante, el resultado del test le será enviado al correo registrado.');
    swal({
      title: "DOMINANTE",
      text: "¡Gracias por completar el test!, tienes un perfil de personalidad dominante, el resultado del test le será enviado al correo registrado.'",
      icon: "success",
      button: "SALIR",
      }).then(function() {
      window.location.href ="/bhprofile/";
      });
    });
  });