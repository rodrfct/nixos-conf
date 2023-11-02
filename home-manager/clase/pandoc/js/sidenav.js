window.addEventListener('load', () => {

  let nav = document.querySelector('nav')

  let button = document.createElement('button')
  button.classList.add('nav-toggle')
  button.innerText = '☰'
  button.title = "Desplegar/Plegar Índice: Tecla \"I\""

  document.querySelector('#title-block-header>h1').insertAdjacentElement('beforebegin', button)

  button.addEventListener('click', () => {
    nav.classList.toggle('sidenav')
  })

  document.addEventListener("keydown", (e) => {
    if (e.altKey || e.ctrlKey || e.metaKey || e.shiftKey || e.target.type === 'textarea' || e.target.type === 'text') { return; }

    if (e.code == 'KeyI' && !e.repeat) {
      nav.classList.toggle('sidenav')
    }
  });

})