// DOM
const dediElement = document.querySelector(".dedi")
const backgroundSoundElement = new Audio("./assets/audio/background-music.mp3")

dediElement.addEventListener('click', () =>
{
    backgroundSoundElement.volume = 0.1
    backgroundSoundElement.play()
})

